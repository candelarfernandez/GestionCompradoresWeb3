using GestionCompetidores.Data;
using GestionCompetidores.Data.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GestionCompetidores.Servicios
{
    public interface IServiceCompetidor
    {
        void CrearCompetidor(Competidor competidor);
        List<Competidor> Listar();
        List<Competidor> ListarPorDeporte(int idDeporte);
    }
    public class ServiceCompetidor : IServiceCompetidor
    {
        private GestionCompetidoresContext _context;
        public ServiceCompetidor(GestionCompetidoresContext context) { 
        _context = context;}

        public void CrearCompetidor(Competidor competidor)
        {
            _context.Competidors.Add(competidor);
            _context.SaveChanges();
        }

        public List<Competidor> Listar()
        {
            var competidores = _context.Competidors.ToList();
            return competidores;
        }

        public List<Competidor> ListarPorDeporte(int idDeporte)
        {
           var listaPorSucursal = _context.Competidors.Where(x=>x.IdDeporte==idDeporte).ToList();
            return listaPorSucursal;
        }
    }
}
