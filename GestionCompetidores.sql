USE [master]
GO
/****** Object:  Database [GestionCompetidores]    Script Date: 12/6/2024 12:50:14 ******/
CREATE DATABASE [GestionCompetidores] ON  PRIMARY 
( NAME = N'GestionCompetidores', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\GestionCompetidores.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GestionCompetidores_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\GestionCompetidores_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GestionCompetidores].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GestionCompetidores] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GestionCompetidores] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GestionCompetidores] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GestionCompetidores] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GestionCompetidores] SET ARITHABORT OFF 
GO
ALTER DATABASE [GestionCompetidores] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GestionCompetidores] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GestionCompetidores] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GestionCompetidores] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GestionCompetidores] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GestionCompetidores] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GestionCompetidores] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GestionCompetidores] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GestionCompetidores] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GestionCompetidores] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GestionCompetidores] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GestionCompetidores] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GestionCompetidores] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GestionCompetidores] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GestionCompetidores] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GestionCompetidores] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GestionCompetidores] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GestionCompetidores] SET  MULTI_USER 
GO
ALTER DATABASE [GestionCompetidores] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GestionCompetidores] SET DB_CHAINING OFF 
GO
USE [GestionCompetidores]
GO
/****** Object:  Table [dbo].[Competidor]    Script Date: 12/6/2024 12:50:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Competidor](
	[IdCompetidor] [int] IDENTITY(1,1) NOT NULL,
	[NombreCompetidor] [nvarchar](50) NULL,
	[IdDeporte] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCompetidor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Deporte]    Script Date: 12/6/2024 12:50:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deporte](
	[IdDeporte] [int] IDENTITY(1,1) NOT NULL,
	[NombreDeporte] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDeporte] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Deporte] ON 

INSERT [dbo].[Deporte] ([IdDeporte], [NombreDeporte]) VALUES (1, N'Futbol')
INSERT [dbo].[Deporte] ([IdDeporte], [NombreDeporte]) VALUES (2, N'Handball')
INSERT [dbo].[Deporte] ([IdDeporte], [NombreDeporte]) VALUES (3, N'Voley')
SET IDENTITY_INSERT [dbo].[Deporte] OFF
GO
ALTER TABLE [dbo].[Competidor]  WITH CHECK ADD FOREIGN KEY([IdDeporte])
REFERENCES [dbo].[Deporte] ([IdDeporte])
GO
USE [master]
GO
ALTER DATABASE [GestionCompetidores] SET  READ_WRITE 
GO
