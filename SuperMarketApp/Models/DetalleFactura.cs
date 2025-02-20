namespace SuperMarketApp.Models
{
    public class DetalleFactura
    {
        public int DetalleID { get; set; }
        public int FacturaID { get; set; }
        public Factura? Factura { get; set; }
        public int ProductoID { get; set; }
        public Producto? Producto { get; set; }
        public int Cantidad { get; set; }
        public decimal PrecioUnitario { get; set; }
        public decimal Subtotal { get; set; }
    }
}
