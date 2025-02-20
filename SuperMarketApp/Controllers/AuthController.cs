using Microsoft.AspNetCore.Mvc;
using SuperMarketApp.Business.Interfaces;

namespace SuperMarketApp.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AuthController : ControllerBase
    {
        private readonly IUsurioService _usuarioService;

        public AuthController(IUsurioService usuarioService)
        {
            _usuarioService = usuarioService;
        }

        [HttpPost("login")]
        public async Task<IActionResult> Login([FromBody] UsuarioLoginModel loginModel)
        {
            var token = await _usuarioService.Authenticate(loginModel.UsuarioLogin, loginModel.Contrasena);
            if (token == null)
            {
                return Unauthorized();
            }
            return Ok(new { Token = token });
        }
    }

    public class UsuarioLoginModel
    {
        public string UsuarioLogin { get; set; }
        public string Contrasena { get; set; }
    }
}
