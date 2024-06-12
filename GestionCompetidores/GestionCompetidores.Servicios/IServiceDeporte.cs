using GestionCompetidores.Data;
using GestionCompetidores.Data.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GestionCompetidores.Servicios
{
    public interface IServiceDeporte
    {
        List<Deporte> Listar();
    }
    public class ServiceDeporte : IServiceDeporte {
        private GestionCompetidoresContext _context;

        public ServiceDeporte(GestionCompetidoresContext context){
            _context = context;
        }

        public List<Deporte> Listar()
        {
            var deportes = _context.Deportes.OrderBy(x=>x.NombreDeporte).ToList();
            return deportes;
        }
    }
}
