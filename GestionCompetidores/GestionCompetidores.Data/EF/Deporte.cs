using System;
using System.Collections.Generic;

namespace GestionCompetidores.Data.EF;

public partial class Deporte
{
    public int IdDeporte { get; set; }

    public string? NombreDeporte { get; set; }

    public virtual ICollection<Competidor> Competidors { get; set; } = new List<Competidor>();
}
