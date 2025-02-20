using Microsoft.EntityFrameworkCore;
using SuperMarketApp.Models;

namespace SuperMarketApp.Data
{
    public class SuperMarketContext : DbContext
    {
        public SuperMarketContext(DbContextOptions<SuperMarketContext> options)
            : base(options)
        {
        }
        public DbSet<Usuario> Usuarios { get; set; }
        public DbSet<Proveedor> Proveedores { get; set; }
        public DbSet<Categoria> Categorias { get; set; }
        public DbSet<DetallePedido> DetallesPedido { get; set; }
        public DbSet<Inventario> Inventarios { get; set; }
        public DbSet<Almacen> Almacenes { get; set; }
        public DbSet<Producto> Productos { get; set; }

        //protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        //{
        //    optionsBuilder.UseSqlServer("data source=(localdb)\\MSSQLLocalDB;initial catalog=SuperMarketDB;Integrated Security=SSPI;");
        //}
    }
}
