namespace compra_api.Models
{
    public class Productos
    {
        public int IdProducto { get; set; }
        public string Producto { get; set; } = null!;
        public int IdMarca { get; set; }
        public string? Descripcion { get; set; }
        public string? Imagen { get; set; }
        public decimal PrecioCosto { get; set; }
        public decimal PrecioVenta { get; set; }
        public int Existencia { get; set; }
        public DateTime FechaIngreso { get; set; }
    }
}
