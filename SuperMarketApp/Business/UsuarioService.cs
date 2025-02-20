using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using SuperMarketApp.Business.Interfaces;
using SuperMarketApp.Data;
using SuperMarketApp.Models;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace SuperMarketApp.Business
{
    public class UsuarioService: IUsurioService
    {
        private readonly ILogger<UsuarioService> _logger;
        private readonly SuperMarketContext _context;
        private readonly IConfiguration _configuration;

        public UsuarioService(
            ILogger<UsuarioService> logger,
            SuperMarketContext context,
            IConfiguration configuration)
        {
            _logger = logger;
            _context = context;
            _configuration = configuration;
        }

        /// <summary>
        /// Get Usuario by Id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<Usuario> GetUsuarioById(int id)
        {
            _logger.LogInformation("GetUsuarioById");
            return new Usuario();
        }

        /// <summary>
        /// Get all Usuarios
        /// </summary>
        /// <returns></returns>
        public async Task<IEnumerable<Usuario>> GetAllUsuarios()
        {
            _logger.LogInformation("GetAllUsuarios");
            var datos = await _context.Usuarios.ToListAsync();
            return datos;
        }

        /// <summary>
        /// Authenticate user and generate JWT token
        /// </summary>
        /// <param name="correo"></param>
        /// <param name="contrasena"></param>
        /// <returns></returns>
        public async Task<string> Authenticate(string UsuarioLogin, string contrasena)
        {
            var usuario = await _context.Usuarios.SingleOrDefaultAsync(u => u.UsuarioLogin == UsuarioLogin);
            if (usuario == null || !BCrypt.Net.BCrypt.Verify(contrasena, usuario.Contrasena))
            {
                return null;
            }

            var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.ASCII.GetBytes(_configuration["Jwt:Key"]);
            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(new Claim[]
                {
                       new Claim(ClaimTypes.Name, usuario.UsuarioID.ToString()),
                       //new Claim(ClaimTypes.Usuario, usuario.UsuarioLogin.ToString())
                }),
                Expires = DateTime.UtcNow.AddHours(1),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
            };
            var token = tokenHandler.CreateToken(tokenDescriptor);
            return tokenHandler.WriteToken(token);
        }

        /// <summary>
        /// Create a new Usuario
        /// </summary>
        /// <param name="usuario"></param>
        /// <returns></returns>
        public async Task<Usuario> CreateUsuario(Usuario usuario)
        {
            usuario.Contrasena = BCrypt.Net.BCrypt.HashPassword(usuario.Contrasena);
            _context.Usuarios.Add(usuario);
            await _context.SaveChangesAsync();
            return usuario;
        }
    }
}
