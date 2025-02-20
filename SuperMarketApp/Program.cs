using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.FileProviders;
using Microsoft.IdentityModel.Tokens;
using SuperMarketApp.Business;
using SuperMarketApp.Business.Interfaces;
using SuperMarketApp.Data;
using System.Text;

var builder = WebApplication.CreateBuilder(args);

// Agregar servicios al contenedor
builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddDbContext<SuperMarketContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("conexion")));

// Leer la configuración de JWT desde appsettings.json
var jwtSettings = builder.Configuration.GetSection("Jwt");
var key = Encoding.ASCII.GetBytes(jwtSettings["Key"]);

builder.Services.AddAuthentication(options =>
{
    options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
    options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
})
.AddJwtBearer(options =>
{
    options.RequireHttpsMetadata = false;
    options.SaveToken = true;
    options.TokenValidationParameters = new TokenValidationParameters
    {
        ValidateIssuer = true,
        ValidateAudience = true,
        ValidateLifetime = true,
        ValidateIssuerSigningKey = true,
        ValidIssuer = jwtSettings["Issuer"],
        ValidAudience = jwtSettings["Audience"],
        IssuerSigningKey = new SymmetricSecurityKey(key)
    };
});

builder.Services.AddTransient<IUsurioService, UsuarioService>();
builder.Services.AddTransient<IProductoService, ProductoService>();

var app = builder.Build();

// Configurar Swagger solo en desarrollo
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

//app.UseHttpsRedirection();
//app.UseAuthorization();
//app.MapControllers();

app.UseHttpsRedirection();
app.UseCors(); // Habilitar CORS
app.UseAuthentication();
app.UseAuthorization();
app.MapControllers();

// ?? 1. Servir archivos estáticos de React
var reactAppPath = Path.Combine(builder.Environment.ContentRootPath, "ClientApp/dist");
if (Directory.Exists(reactAppPath))
{
    app.UseDefaultFiles();
    app.UseStaticFiles(new StaticFileOptions
    {
        FileProvider = new PhysicalFileProvider(reactAppPath)
    });

    // ?? 2. Middleware para servir `index.html` en rutas desconocidas
    app.Use(async (context, next) =>
    {
        if (!context.Request.Path.Value.StartsWith("/api") && !Path.HasExtension(context.Request.Path.Value))
        {
            context.Response.ContentType = "text/html";
            await context.Response.SendFileAsync(Path.Combine(reactAppPath, "index.html"));
            return;
        }

        await next();
    });
}

app.Run();
