using Microsoft.EntityFrameworkCore;
using compra_api.Data;

var builder = WebApplication.CreateBuilder(args);

// Configuración de la conexión a MySQL
builder.Services.AddDbContext<ApplicationDbContext>(options =>
    options.UseMySql(
        builder.Configuration.GetConnectionString("DefaultConnection"),
        new MySqlServerVersion(new Version(8, 0, 21))
    ));

// Servicios de controladores
builder.Services.AddControllers();

// Add services to the container.
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowAll",
        policy => policy.AllowAnyOrigin()
                        .AllowAnyMethod()
                        .AllowAnyHeader());
});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.MapGet("/api/productos", async (ApplicationDbContext dbContext) =>
{
    var productos = await dbContext.Productos.ToListAsync();
    return productos;
})
.WithName("GetProductos")
.WithOpenApi();

app.MapGet("/api/productos/{id:int}", async (int id, ApplicationDbContext dbContext) =>
{
    var producto = await dbContext.Productos
        .FirstOrDefaultAsync(p => p.IdProducto == id);

    if (producto == null)
    {
        return Results.NotFound(); // Devuelve un 404 si no se encuentra el producto
    }

    return Results.Ok(producto); // Devuelve el producto si lo encuentra
})
.WithName("GetProductoById")
.WithOpenApi();


app.UseCors("AllowAll");

app.Run();

record WeatherForecast(DateOnly Date, int TemperatureC, string? Summary)
{
    public int TemperatureF => 32 + (int)(TemperatureC / 0.5556);
}
