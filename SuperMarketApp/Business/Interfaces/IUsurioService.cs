using SuperMarketApp.Models;

namespace SuperMarketApp.Business.Interfaces
{
    public interface IUsurioService
    {
        Task<Usuario> GetUsuarioById(int id);
        Task<IEnumerable<Usuario>> GetAllUsuarios();
        Task<Usuario> CreateUsuario(Usuario usuario);
        Task<string> Authenticate(string UsuarioLogin, string contrasena);
    }
}
