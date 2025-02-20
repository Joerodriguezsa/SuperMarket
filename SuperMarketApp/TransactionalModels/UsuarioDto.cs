using SuperMarketApp.Models;

namespace SuperMarketApp.TransactionalModels
{
    public class UsuarioDto
    {
        public int UsuarioID { get; set; }
        public string? Nombre { get; set; }
        public string? Correo { get; set; }
        public string? Contrasena { get; set; }
        public int RolID { get; set; }
        public Rol? Rol { get; set; }
    }
}
