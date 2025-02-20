namespace SuperMarketApp.Models
{
    public class Pedido
    {
        public int PedidoID { get; set; }
        public int ProveedorID { get; set; }
        public Proveedor? Proveedor { get; set; }
        public DateTime FechaPedido { get; set; }
        public decimal Total { get; set; }
    }
}
