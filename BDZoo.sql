USE [master]
GO
/****** Object:  Database [zoologico]    Script Date: 7/12/2022 3:19:55 p. m. ******/
CREATE DATABASE [zoologico]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'zoologico', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\zoologico.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'zoologico_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\zoologico_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [zoologico] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [zoologico].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [zoologico] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [zoologico] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [zoologico] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [zoologico] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [zoologico] SET ARITHABORT OFF 
GO
ALTER DATABASE [zoologico] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [zoologico] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [zoologico] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [zoologico] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [zoologico] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [zoologico] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [zoologico] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [zoologico] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [zoologico] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [zoologico] SET  ENABLE_BROKER 
GO
ALTER DATABASE [zoologico] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [zoologico] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [zoologico] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [zoologico] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [zoologico] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [zoologico] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [zoologico] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [zoologico] SET RECOVERY FULL 
GO
ALTER DATABASE [zoologico] SET  MULTI_USER 
GO
ALTER DATABASE [zoologico] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [zoologico] SET DB_CHAINING OFF 
GO
ALTER DATABASE [zoologico] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [zoologico] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [zoologico] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [zoologico] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'zoologico', N'ON'
GO
ALTER DATABASE [zoologico] SET QUERY_STORE = OFF
GO
USE [zoologico]
GO
/****** Object:  Table [dbo].[animal]    Script Date: 7/12/2022 3:19:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[animal](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[nombre_vulgar] [varchar](40) NOT NULL,
	[nombre_cientifico] [varchar](40) NOT NULL,
	[familia] [varchar](50) NULL,
	[peligro_extincion] [varchar](10) NULL,
	[Id_zoo] [int] NOT NULL,
	[especie] [varchar](50) NOT NULL,
	[sexo] [varchar](20) NOT NULL,
	[año_nacimiento] [date] NOT NULL,
	[pais_origen] [varchar](40) NOT NULL,
	[continente] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[zoo]    Script Date: 7/12/2022 3:19:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zoo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[nombre_zoo] [varchar](50) NOT NULL,
	[ciudad] [varchar](20) NOT NULL,
	[pais] [varchar](20) NOT NULL,
	[tamaño_m2] [int] NOT NULL,
	[presupuesto_anual] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[animal] ON 

INSERT [dbo].[animal] ([Id], [nombre_vulgar], [nombre_cientifico], [familia], [peligro_extincion], [Id_zoo], [especie], [sexo], [año_nacimiento], [pais_origen], [continente]) VALUES (1, N'rana', N'pelophylax perezi', N'Ranidae', N'no', 1, N'anfibio', N'macho', CAST(N'2018-10-10' AS Date), N'colombia', N'america del sur')
SET IDENTITY_INSERT [dbo].[animal] OFF
GO
SET IDENTITY_INSERT [dbo].[zoo] ON 

INSERT [dbo].[zoo] ([Id], [nombre_zoo], [ciudad], [pais], [tamaño_m2], [presupuesto_anual]) VALUES (1, N'Parque de la conservacion', N'Medellin', N'Colombia', 160000, 300000000)
SET IDENTITY_INSERT [dbo].[zoo] OFF
GO
ALTER TABLE [dbo].[animal]  WITH CHECK ADD  CONSTRAINT [fk_zoo] FOREIGN KEY([Id_zoo])
REFERENCES [dbo].[zoo] ([Id])
GO
ALTER TABLE [dbo].[animal] CHECK CONSTRAINT [fk_zoo]
GO
USE [master]
GO
ALTER DATABASE [zoologico] SET  READ_WRITE 
GO
