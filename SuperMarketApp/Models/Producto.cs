using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace SuperMarketApp.Models
{
    public class Producto
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ProductoID { get; set; }
        public string? NombreProducto { get; set; }
        public string? Descripcion { get; set; }
        public decimal PrecioVenta { get; set; }
        public decimal PrecioCompra { get; set; }
        public int CantidadEnInventario { get; set; }
        public DateTime FechaVencimiento { get; set; }
        public string? CodigoBarras { get; set; }
        public int CategoriaID { get; set; }
        public Categoria? Categoria { get; set; }
    }
}
