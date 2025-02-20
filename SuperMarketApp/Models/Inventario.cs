namespace SuperMarketApp.Models
{
    public class Inventario
    {
        public int InventarioID { get; set; }
        public int AlmacenID { get; set; }
        public Almacen? Almacen { get; set; }
        public int ProductoID { get; set; }
        public Producto? Producto { get; set; }
        public int Cantidad { get; set; }
    }
}
