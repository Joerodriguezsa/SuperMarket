namespace SuperMarketApp.Models
{
    public class Devolucion
    {
        public int DevolucionID { get; set; }
        public int FacturaID { get; set; }
        public Factura? Factura { get; set; }
        public int ProductoID { get; set; }
        public Producto? Producto { get; set; }
        public int CantidadDevuelta { get; set; }
        public DateTime FechaDevolucion { get; set; }
        public string? Motivo { get; set; }
    }
}
