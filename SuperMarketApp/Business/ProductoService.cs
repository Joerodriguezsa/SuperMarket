using Microsoft.EntityFrameworkCore;
using SuperMarketApp.Business.Interfaces;
using SuperMarketApp.Data;
using SuperMarketApp.Models;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SuperMarketApp.Business
{
    public class ProductoService : IProductoService
    {
        private readonly SuperMarketContext _context;

        public ProductoService(SuperMarketContext context)
        {
            _context = context;
        }

        public async Task<Producto> GetProductoById(int id)
        {
            return await _context.Productos.FindAsync(id);
        }

        public async Task<IEnumerable<Producto>> GetAllProductos()
        {
            return await _context.Productos.ToListAsync();
        }

        public async Task<Producto> CreateProducto(Producto producto)
        {
            _context.Productos.Add(producto);
            await _context.SaveChangesAsync();
            return producto;
        }

        public async Task<Producto> UpdateProducto(Producto producto)
        {
            _context.Entry(producto).State = EntityState.Modified;
            await _context.SaveChangesAsync();
            return producto;
        }

        public async Task<IEnumerable<Producto>> SearchProductos(string searchTerm)
        {
            return await _context.Productos
                .Where(p => p.NombreProducto.Contains(searchTerm) ||
                            p.Descripcion.Contains(searchTerm) ||
                            p.CodigoBarras.Contains(searchTerm))
                .ToListAsync();
        }
    }
}

