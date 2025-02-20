namespace SuperMarketApp.Models
{
    public class Factura
    {
        public int FacturaID { get; set; }
        public DateTime Fecha { get; set; }
        public int UsuarioID { get; set; }
        public Usuario? Usuario { get; set; }
        public decimal Total { get; set; }
        public int TipoVentaID { get; set; }
        public TipoVenta? TipoVenta { get; set; }
        public decimal TotalDevoluciones { get; set; }
    }
}
