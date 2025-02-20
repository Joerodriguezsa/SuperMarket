using SuperMarketApp.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SuperMarketApp.Business.Interfaces
{
    public interface IProductoService
    {
        Task<Producto> GetProductoById(int id);
        Task<IEnumerable<Producto>> GetAllProductos();
        Task<Producto> CreateProducto(Producto producto);
        Task<Producto> UpdateProducto(Producto producto);
        Task<IEnumerable<Producto>> SearchProductos(string searchTerm);
    }
}

