using Microsoft.EntityFrameworkCore;
using compra_api.Models;

namespace compra_api.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options) { }

        public DbSet<Productos> Productos { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Productos>(entity =>
            {
                entity.ToTable("productos");
                entity.HasKey(e => e.IdProducto).HasName("PRIMARY");
                entity.Property(e => e.IdProducto).HasColumnName("id_producto");
                entity.Property(e => e.Producto).HasColumnName("producto").IsRequired();
                entity.Property(e => e.IdMarca).HasColumnName("id_marca").IsRequired();
                entity.Property(e => e.Descripcion).HasColumnName("descripcion");
                entity.Property(e => e.Imagen).HasColumnName("imagen");
                entity.Property(e => e.PrecioCosto).HasColumnName("precio_costo").HasColumnType("decimal(10,2)");
                entity.Property(e => e.PrecioVenta).HasColumnName("precio_venta").HasColumnType("decimal(10,2)");
                entity.Property(e => e.Existencia).HasColumnName("existencia").HasDefaultValue(0);
                entity.Property(e => e.FechaIngreso).HasColumnName("fecha_ingreso").IsRequired();
            });
        } 
    }
}
