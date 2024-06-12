using GestionCompetidores.Data.EF;
using GestionCompetidores.Servicios;
using Microsoft.AspNetCore.Mvc;

namespace GestionCompetidores.Web.Controllers
{
    public class CompetidorController : Controller
    {
        private IServiceDeporte _serviceDeporte;
        private IServiceCompetidor _serviceCompetidor;

        public CompetidorController(IServiceCompetidor serviceCompetidor, IServiceDeporte serviceDeporte) {
            _serviceDeporte = serviceDeporte;
            _serviceCompetidor = serviceCompetidor;
        }
        public IActionResult Index(int? idDeporte)
        {
            ViewBag.Deportes = _serviceDeporte.Listar();
            ViewBag.IdDeporteFiltro = idDeporte;
            if (idDeporte.HasValue)
            {
                var competidoresFiltro = _serviceCompetidor.ListarPorDeporte(idDeporte.Value);
                return View(competidoresFiltro);
            }
            else
            {
                var competidores =_serviceCompetidor.Listar();
                return View(competidores);
            }
        }
        public IActionResult Crear()
        {
            ViewBag.Deportes = _serviceDeporte.Listar();
            return View();
        }
        [HttpPost]
        public IActionResult Crear(Competidor competidor)
        {
            ViewBag.Deportes = _serviceDeporte.Listar();
            _serviceCompetidor.CrearCompetidor(competidor);
            return RedirectToAction("Index");
        }
    }
}
