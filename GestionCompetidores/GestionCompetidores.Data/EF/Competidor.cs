﻿using System;
using System.Collections.Generic;

namespace GestionCompetidores.Data.EF;

public partial class Competidor
{
    public int IdCompetidor { get; set; }

    public string? NombreCompetidor { get; set; }

    public int? IdDeporte { get; set; }

    public virtual Deporte? IdDeporteNavigation { get; set; }
}
