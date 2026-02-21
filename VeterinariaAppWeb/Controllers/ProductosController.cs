using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis.CSharp.Syntax;
using Microsoft.Data.SqlClient;
using VeterinariaAppWeb.Models;

namespace VeterinariaAppWeb.Controllers
{
    public class ProductosController : Controller
    {
        private readonly string cadenaConexion = "server=localhost; database=veterinaria;Integrated security=true;TrustServerCertificate=true";
        public IActionResult Index()
        {
            var listado = obtenerProductos();
            return View(listado);
        }

        #region . Métodos privados .
        private List<Producto> obtenerProductos()
        {
            var listado = new List<Producto>();
            using (var conexion = new SqlConnection(cadenaConexion))
            {
                conexion.Open();
            }
            return listado;
        } 
        #endregion
    }
}
