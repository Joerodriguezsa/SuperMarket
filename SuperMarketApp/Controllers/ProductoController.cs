using Microsoft.AspNetCore.Mvc;
using SuperMarketApp.Business.Interfaces;
using SuperMarketApp.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SuperMarketApp.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductoController : ControllerBase
    {
        private readonly IProductoService _productoService;

        public ProductoController(IProductoService productoService)
        {
            _productoService = productoService;
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Producto>> GetProductoById(int id)
        {
            var producto = await _productoService.GetProductoById(id);
            if (producto == null)
            {
                return NotFound();
            }
            return producto;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Producto>>> GetAllProductos()
        {
            return Ok(await _productoService.GetAllProductos());
        }

        [HttpPost]
        public async Task<ActionResult<Producto>> CreateProducto(Producto producto)
        {
            var createdProducto = await _productoService.CreateProducto(producto);
            return CreatedAtAction(nameof(GetProductoById), new { id = createdProducto.ProductoID }, createdProducto);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateProducto(int id, Producto producto)
        {
            if (id != producto.ProductoID)
            {
                return BadRequest();
            }

            await _productoService.UpdateProducto(producto);
            return NoContent();
        }

        [HttpGet("search")]
        public async Task<ActionResult<IEnumerable<Producto>>> SearchProductos([FromQuery] string searchTerm)
        {
            return Ok(await _productoService.SearchProductos(searchTerm));
        }
    }
}

