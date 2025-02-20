using Microsoft.AspNetCore.Mvc;
using SuperMarketApp.Business.Interfaces;
using SuperMarketApp.Models;
using System.Threading.Tasks;

namespace SuperMarketApp.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class UsuarioController : ControllerBase
    {
        private readonly IUsurioService _usuarioService;

        public UsuarioController(IUsurioService usuarioService)
        {
            _usuarioService = usuarioService;
        }

        [HttpPost]
        public async Task<IActionResult> CreateUsuario([FromBody] Usuario usuario)
        {
            if (usuario == null)
            {
                return BadRequest();
            }

            var createdUsuario = await _usuarioService.CreateUsuario(usuario);
            return CreatedAtAction(nameof(GetUsuarioById), new { id = createdUsuario.UsuarioID }, createdUsuario);
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetUsuarioById(int id)
        {
            var usuario = await _usuarioService.GetUsuarioById(id);
            if (usuario == null)
            {
                return NotFound();
            }
            return Ok(usuario);
        }

        [HttpGet()]
        public async Task<IActionResult> GetUsuarios()
        {
            var usuario = await _usuarioService.GetAllUsuarios();
            if (usuario == null)
            {
                return NotFound();
            }
            return Ok(usuario);
        }

    }
}
