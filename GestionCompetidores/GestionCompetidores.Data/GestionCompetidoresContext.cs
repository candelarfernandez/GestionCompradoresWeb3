using System;
using System.Collections.Generic;
using GestionCompetidores.Data.EF;
using Microsoft.EntityFrameworkCore;

namespace GestionCompetidores.Data;

public partial class GestionCompetidoresContext : DbContext
{
    public GestionCompetidoresContext()
    {
    }

    public GestionCompetidoresContext(DbContextOptions<GestionCompetidoresContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Competidor> Competidors { get; set; }

    public virtual DbSet<Deporte> Deportes { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=LAPTOP-RFDT8K10;Database=GestionCompetidores;Trusted_Connection=True;Encrypt=False;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Competidor>(entity =>
        {
            entity.HasKey(e => e.IdCompetidor).HasName("PK__Competid__1B4C0B7630913F60");

            entity.ToTable("Competidor");

            entity.Property(e => e.NombreCompetidor).HasMaxLength(50);

            entity.HasOne(d => d.IdDeporteNavigation).WithMany(p => p.Competidors)
                .HasForeignKey(d => d.IdDeporte)
                .HasConstraintName("FK__Competido__IdDep__398D8EEE");
        });

        modelBuilder.Entity<Deporte>(entity =>
        {
            entity.HasKey(e => e.IdDeporte).HasName("PK__Deporte__B5FFCC7D1B8FB006");

            entity.ToTable("Deporte");

            entity.Property(e => e.NombreDeporte).HasMaxLength(50);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
