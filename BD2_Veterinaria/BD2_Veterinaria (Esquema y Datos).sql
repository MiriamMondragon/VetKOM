USE [master]
GO
/****** Object:  Database [BD2_Veterinaria]    Script Date: 7/21/2020 11:27:36 AM ******/
CREATE DATABASE [BD2_Veterinaria]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BD2_Veterinaria', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\BD2_Veterinaria.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BD2_Veterinaria_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\BD2_Veterinaria_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BD2_Veterinaria] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BD2_Veterinaria].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BD2_Veterinaria] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BD2_Veterinaria] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BD2_Veterinaria] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BD2_Veterinaria] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BD2_Veterinaria] SET ARITHABORT OFF 
GO
ALTER DATABASE [BD2_Veterinaria] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BD2_Veterinaria] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BD2_Veterinaria] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BD2_Veterinaria] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BD2_Veterinaria] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BD2_Veterinaria] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BD2_Veterinaria] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BD2_Veterinaria] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BD2_Veterinaria] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BD2_Veterinaria] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BD2_Veterinaria] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BD2_Veterinaria] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BD2_Veterinaria] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BD2_Veterinaria] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BD2_Veterinaria] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BD2_Veterinaria] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BD2_Veterinaria] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BD2_Veterinaria] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BD2_Veterinaria] SET  MULTI_USER 
GO
ALTER DATABASE [BD2_Veterinaria] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BD2_Veterinaria] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BD2_Veterinaria] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BD2_Veterinaria] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BD2_Veterinaria] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BD2_Veterinaria] SET QUERY_STORE = OFF
GO
USE [BD2_Veterinaria]
GO
/****** Object:  UserDefinedFunction [dbo].[SPLITSTRING]    Script Date: 7/21/2020 11:27:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SPLITSTRING](@ID NVARCHAR(50), @STRINGTOSPLIT VARCHAR(MAX))
RETURNS
@RETURNLIST TABLE ([Id] [nvarchar] (50), [Dato] [nvarchar] (500))
AS
BEGIN

 DECLARE @DATO NVARCHAR(255)
 DECLARE @POS INT

	 WHILE CHARINDEX(',', @STRINGTOSPLIT) > 0
	 BEGIN
	  SELECT @POS  = CHARINDEX(',', @STRINGTOSPLIT)  
	  SELECT @DATO = SUBSTRING(@STRINGTOSPLIT, 1, @pos-1)

	  INSERT INTO @RETURNLIST 
	  SELECT @ID, @DATO

	  SELECT @STRINGTOSPLIT  = SUBSTRING(@STRINGTOSPLIT , @POS + 1, LEN(@STRINGTOSPLIT )- @POS)
	 END

	 INSERT INTO @RETURNLIST
	 SELECT @ID, @STRINGTOSPLIT 
	
 RETURN
END
GO
/****** Object:  Table [dbo].[Animales]    Script Date: 7/21/2020 11:27:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Animales](
	[Id_Animal] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Id_Raza] [int] NOT NULL,
	[Id_Cliente_Duenio] [nvarchar](50) NOT NULL,
	[Fecha_Nacimiento] [date] NULL,
	[Tipo_Sangre] [nvarchar](50) NULL,
	[Id_Genero] [int] NOT NULL,
	[Id_Color] [int] NOT NULL,
	[Esterilizado] [bit] NOT NULL,
	[Ruta_Foto] [nvarchar](100) NULL,
	[Observaciones] [ntext] NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Animales] PRIMARY KEY CLUSTERED 
(
	[Id_Animal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cargos]    Script Date: 7/21/2020 11:27:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cargos](
	[Id_Cargo] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Cargo] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Cargos] PRIMARY KEY CLUSTERED 
(
	[Id_Cargo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 7/21/2020 11:27:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[Id_Categoria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Categoria] [nvarchar](50) NOT NULL,
	[Descripcion] [ntext] NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[Id_Categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Citas]    Script Date: 7/21/2020 11:27:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Citas](
	[Id_Cita] [int] IDENTITY(1,1) NOT NULL,
	[Id_Animal] [int] NOT NULL,
	[Id_Tipo_Cita] [int] NOT NULL,
	[Id_Empleado] [int] NOT NULL,
	[Fecha_Registro] [date] NULL,
	[Fecha_Cita] [datetime] NOT NULL,
	[No_Sala] [int] NULL,
	[Id_Estado] [int] NOT NULL,
	[Observaciones] [ntext] NULL,
 CONSTRAINT [PK_Citas] PRIMARY KEY CLUSTERED 
(
	[Id_Cita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ciudades]    Script Date: 7/21/2020 11:27:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ciudades](
	[Id_Ciudad] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Ciudad] [nvarchar](50) NOT NULL,
	[Id_Departamento] [int] NOT NULL,
 CONSTRAINT [PK_Ciudades] PRIMARY KEY CLUSTERED 
(
	[Id_Ciudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 7/21/2020 11:27:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[Id_Cliente] [nvarchar](50) NOT NULL,
	[Nombres] [nvarchar](50) NOT NULL,
	[Apellidos] [nvarchar](50) NOT NULL,
	[Fecha_Registro] [date] NULL,
	[Fecha_Nacimiento] [date] NULL,
	[Id_Genero] [int] NOT NULL,
	[Direccion] [nvarchar](50) NULL,
	[Id_Ciudad] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
	[Ruta_Foto] [nvarchar](100) NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[Id_Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes_Correos]    Script Date: 7/21/2020 11:27:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes_Correos](
	[Id_Cliente] [nvarchar](50) NOT NULL,
	[Correo] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes_Telefonos]    Script Date: 7/21/2020 11:27:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes_Telefonos](
	[Id_Cliente] [nvarchar](50) NOT NULL,
	[Telefono] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Colores]    Script Date: 7/21/2020 11:27:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colores](
	[Id_Color] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Color] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Colores] PRIMARY KEY CLUSTERED 
(
	[Id_Color] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Conceptos_Facturacion]    Script Date: 7/21/2020 11:27:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conceptos_Facturacion](
	[Id_Concepto] [int] NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[Id_Tipo_Concepto] [int] NOT NULL,
 CONSTRAINT [PK_Conceptos_Facturacion] PRIMARY KEY CLUSTERED 
(
	[Id_Concepto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departamentos]    Script Date: 7/21/2020 11:27:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamentos](
	[Id_Departamento] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Departamento] [nvarchar](50) NOT NULL,
	[Id_Pais] [int] NOT NULL,
 CONSTRAINT [PK_Departamento] PRIMARY KEY CLUSTERED 
(
	[Id_Departamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Descuentos]    Script Date: 7/21/2020 11:27:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Descuentos](
	[Id_Descuento] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Descuento] [nvarchar](50) NOT NULL,
	[Valor_Descuento] [money] NULL,
 CONSTRAINT [PK_Descuentos] PRIMARY KEY CLUSTERED 
(
	[Id_Descuento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detalles_Factura]    Script Date: 7/21/2020 11:27:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalles_Factura](
	[Id_Factura] [int] NOT NULL,
	[Id_Concepto_Facturacion] [int] NOT NULL,
	[Id_Descuento] [int] NULL,
	[Id_Impuesto] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 7/21/2020 11:27:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[Id_Empleado] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [nvarchar](50) NOT NULL,
	[Apellidos] [nvarchar](50) NOT NULL,
	[Fecha_Nacimiento] [date] NULL,
	[Fecha_Contratacion] [date] NULL,
	[Fecha_Finalizacion_Contrato] [date] NULL,
	[Id_Cargo] [int] NOT NULL,
	[Reporta_A] [int] NULL,
	[Direccion] [nvarchar](50) NULL,
	[Id_Ciudad] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
	[Ruta_Foto] [nvarchar](100) NULL,
	[Notas] [ntext] NULL,
 CONSTRAINT [PK_Empleados] PRIMARY KEY CLUSTERED 
(
	[Id_Empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Especies]    Script Date: 7/21/2020 11:27:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Especies](
	[Id_Especie] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Especie] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Especies] PRIMARY KEY CLUSTERED 
(
	[Id_Especie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estados_Cita]    Script Date: 7/21/2020 11:27:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estados_Cita](
	[Id_Estado_Cita] [int] IDENTITY(1,1) NOT NULL,
	[Estado_Cita] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Estados_Cita] PRIMARY KEY CLUSTERED 
(
	[Id_Estado_Cita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estados_Conceptos]    Script Date: 7/21/2020 11:27:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estados_Conceptos](
	[Id_Estado] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Estado] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Estados_Conceptos] PRIMARY KEY CLUSTERED 
(
	[Id_Estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Facturas]    Script Date: 7/21/2020 11:27:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facturas](
	[Id_Factura] [int] IDENTITY(1,1) NOT NULL,
	[Id_Cita] [int] NOT NULL,
	[Fecha_Factura] [date] NOT NULL,
	[Id_Metodo_Pago] [int] NOT NULL,
	[SubTotal] [money] NOT NULL,
	[Total] [money] NOT NULL,
 CONSTRAINT [PK_Facturas] PRIMARY KEY CLUSTERED 
(
	[Id_Factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Generos]    Script Date: 7/21/2020 11:27:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Generos](
	[Id_Genero] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Genero] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Generos] PRIMARY KEY CLUSTERED 
(
	[Id_Genero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Historico_Precios_Impuestos]    Script Date: 7/21/2020 11:27:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Historico_Precios_Impuestos](
	[Id_Impuesto] [int] NOT NULL,
	[Precio] [money] NOT NULL,
	[Fecha_Inicio] [date] NOT NULL,
	[Fecha_Fin] [date] NULL,
 CONSTRAINT [PK_Historico_Precios_Impuestos] PRIMARY KEY CLUSTERED 
(
	[Id_Impuesto] ASC,
	[Fecha_Inicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Historico_Precios_Productos]    Script Date: 7/21/2020 11:27:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Historico_Precios_Productos](
	[Id_Producto] [int] NOT NULL,
	[Precio] [money] NOT NULL,
	[Fecha_Inicio] [date] NOT NULL,
	[Fecha_Fin] [date] NULL,
 CONSTRAINT [PK_Historico_Precios_Productos] PRIMARY KEY CLUSTERED 
(
	[Id_Producto] ASC,
	[Fecha_Inicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Historico_Precios_Servicios]    Script Date: 7/21/2020 11:27:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Historico_Precios_Servicios](
	[Id_Servicio] [int] NOT NULL,
	[Precio] [money] NOT NULL,
	[Fecha_Inicio] [date] NOT NULL,
	[Fecha_Fin] [date] NULL,
 CONSTRAINT [PK_Historico_Precios_Servicios] PRIMARY KEY CLUSTERED 
(
	[Id_Servicio] ASC,
	[Fecha_Inicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Impuestos]    Script Date: 7/21/2020 11:27:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Impuestos](
	[Id_Impuesto] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Impuesto] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Impuestos] PRIMARY KEY CLUSTERED 
(
	[Id_Impuesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Metodo_Pago]    Script Date: 7/21/2020 11:27:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Metodo_Pago](
	[Id_Metodo_Pago] [int] IDENTITY(1,1) NOT NULL,
	[Metodo_Pago] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Metodo_Pago] PRIMARY KEY CLUSTERED 
(
	[Id_Metodo_Pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paises]    Script Date: 7/21/2020 11:27:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paises](
	[Id_Pais] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Pais] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Paises] PRIMARY KEY CLUSTERED 
(
	[Id_Pais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 7/21/2020 11:27:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[Id_Producto] [int] NOT NULL,
	[Nombre_Producto] [nvarchar](50) NOT NULL,
	[Id_Proveedor] [int] NOT NULL,
	[Id_Categoria] [int] NOT NULL,
	[Cantidades_Unidad] [nvarchar](50) NOT NULL,
	[Unidades_Almacen] [int] NOT NULL,
	[Cantidad_Minima] [int] NOT NULL,
	[Cantidad_Maxima] [int] NOT NULL,
	[Id_Estado_Concepto] [int] NOT NULL,
 CONSTRAINT [PK_Productos_1] PRIMARY KEY CLUSTERED 
(
	[Id_Producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 7/21/2020 11:27:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
	[Id_Proveedor] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Proveedor] [nvarchar](50) NOT NULL,
	[Contacto] [nvarchar](50) NULL,
	[Id_Ciudad] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Proveedor] PRIMARY KEY CLUSTERED 
(
	[Id_Proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedor_Correos]    Script Date: 7/21/2020 11:27:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor_Correos](
	[Id_Proveedor] [int] IDENTITY(1,1) NOT NULL,
	[Correo] [nvarchar](50) NULL,
 CONSTRAINT [PK_Proveedor_Correos] PRIMARY KEY CLUSTERED 
(
	[Id_Proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedor_Telefonos]    Script Date: 7/21/2020 11:27:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor_Telefonos](
	[Id_Proveedor] [int] NOT NULL,
	[Telefono] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Razas]    Script Date: 7/21/2020 11:27:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Razas](
	[Id_Raza] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Raza] [nvarchar](50) NOT NULL,
	[Id_Especie] [int] NOT NULL,
 CONSTRAINT [PK_Razas] PRIMARY KEY CLUSTERED 
(
	[Id_Raza] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Servicios]    Script Date: 7/21/2020 11:27:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servicios](
	[Id_Servicio] [int] NOT NULL,
	[Nombre_Servicio] [nvarchar](50) NOT NULL,
	[Id_Estado] [int] NOT NULL,
 CONSTRAINT [PK_Servicios] PRIMARY KEY CLUSTERED 
(
	[Id_Servicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Servicios_Personal]    Script Date: 7/21/2020 11:27:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servicios_Personal](
	[Id_Servicio] [int] NOT NULL,
	[Id_Empleado] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Telefonos_Empleados]    Script Date: 7/21/2020 11:27:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Telefonos_Empleados](
	[Id_Empleado] [int] NOT NULL,
	[Telefono] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipos_Cita]    Script Date: 7/21/2020 11:27:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipos_Cita](
	[Id_Tipo_Cita] [int] IDENTITY(1,1) NOT NULL,
	[Tipo_Cita] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Tipos_Cita] PRIMARY KEY CLUSTERED 
(
	[Id_Tipo_Cita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipos_Concepto]    Script Date: 7/21/2020 11:27:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipos_Concepto](
	[Id_Tipo_Concepto] [int] IDENTITY(1,1) NOT NULL,
	[Tipo_Concepto] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Tipos_Concepto] PRIMARY KEY CLUSTERED 
(
	[Id_Tipo_Concepto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 7/21/2020 11:27:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id_Usuario] [nvarchar](50) NOT NULL,
	[Id_Empleado] [int] NOT NULL,
	[Clave] [nvarchar](50) NOT NULL,
	[Activo] [bit] NOT NULL,
	[Fecha_Registro] [date] NULL,
	[Ultima_Fecha_Actualizacion] [date] NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Id_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cargos] ON 

INSERT [dbo].[Cargos] ([Id_Cargo], [Nombre_Cargo]) VALUES (1, N'Medico General')
INSERT [dbo].[Cargos] ([Id_Cargo], [Nombre_Cargo]) VALUES (2, N'Radiólogo')
INSERT [dbo].[Cargos] ([Id_Cargo], [Nombre_Cargo]) VALUES (3, N'Bañador')
INSERT [dbo].[Cargos] ([Id_Cargo], [Nombre_Cargo]) VALUES (4, N'Secretario')
INSERT [dbo].[Cargos] ([Id_Cargo], [Nombre_Cargo]) VALUES (5, N'Cirujano')
INSERT [dbo].[Cargos] ([Id_Cargo], [Nombre_Cargo]) VALUES (6, N'Odontólogo')
INSERT [dbo].[Cargos] ([Id_Cargo], [Nombre_Cargo]) VALUES (7, N'Peluquero')
SET IDENTITY_INSERT [dbo].[Cargos] OFF
SET IDENTITY_INSERT [dbo].[Categorias] ON 

INSERT [dbo].[Categorias] ([Id_Categoria], [Nombre_Categoria], [Descripcion]) VALUES (1, N'Jabones', N'Productos de higiene, cosméticos y hodorizantes')
INSERT [dbo].[Categorias] ([Id_Categoria], [Nombre_Categoria], [Descripcion]) VALUES (2, N'Alimentos', N'Comestibles, recompensas y chucherías para las mascotas')
SET IDENTITY_INSERT [dbo].[Categorias] OFF
SET IDENTITY_INSERT [dbo].[Ciudades] ON 

INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (1, N'La Ceiba', 1)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (2, N'El Porvenir', 1)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (3, N'Tela', 1)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (4, N'Jutiapa', 1)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (5, N'La Masica', 1)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (6, N'San Francisco', 1)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (7, N'Arizona', 1)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (8, N'Esparta', 1)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (9, N'Trujillo', 2)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (10, N'Balfate', 2)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (11, N'Iriona', 2)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (12, N'Limón', 2)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (13, N'Sabá', 2)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (14, N'Santa Fe', 2)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (15, N'Santa Rosa de Aguán', 2)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (16, N'Sonaguera', 2)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (17, N'Tocoa', 2)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (18, N'Bonito Oriental', 2)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (19, N'Comayagua', 3)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (20, N'Ajuterique', 3)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (21, N'El Rosario', 3)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (22, N'Esquías', 3)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (23, N'Humuya', 3)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (24, N'La libertad', 3)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (25, N'Lamaní', 3)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (26, N'La Trinidad', 3)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (27, N'Lejamani', 3)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (28, N'Meambar', 3)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (29, N'Minas de Oro', 3)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (30, N'Ojos de Agua', 3)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (31, N'San Jerónimo', 3)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (32, N'San José de Comayagua', 3)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (33, N'San José del Potrero', 3)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (34, N'San Luis', 3)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (35, N'San Sebastián', 3)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (36, N'Siguatepeque', 3)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (37, N'Villa de San Antonio', 3)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (38, N'Las Lajas', 3)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (39, N'Taulabé', 3)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (40, N'Santa Rosa de Copán', 4)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (41, N'Cabañas', 4)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (42, N'Concepción', 4)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (43, N'Copán Ruinas', 4)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (44, N'Corquín', 4)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (45, N'Cucuyagua', 4)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (46, N'Dolores', 4)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (47, N'Dulce Nombre', 4)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (48, N'El Paraíso', 4)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (49, N'Florida', 4)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (50, N'La Jigua', 4)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (51, N'La Unión', 4)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (52, N'Nueva Arcadia', 4)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (53, N'San Agustín', 4)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (54, N'San Antonio', 4)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (55, N'San Jerónimo', 4)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (56, N'San José', 4)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (57, N'San Juan de Opoa', 4)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (58, N'San Nicolás', 4)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (59, N'San Pedro', 4)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (60, N'Santa Rita', 4)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (61, N'Trinidad de Copán', 4)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (62, N'Veracruz', 4)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (63, N'San Pedro Sula', 5)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (64, N'Choloma', 5)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (65, N'Omoa', 5)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (66, N'Pimienta', 5)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (67, N'Potrerillos', 5)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (68, N'Puerto Cortés', 5)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (69, N'San Antonio de Cortés', 5)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (70, N'San Francisco de Yojoa', 5)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (71, N'San Manuel', 5)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (72, N'Santa Cruz de Yojoa', 5)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (73, N'Villanueva', 5)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (74, N'La Lima', 5)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (75, N'Choluteca', 6)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (76, N'Apacilagua', 6)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (77, N'Concepción de María', 6)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (78, N'Duyure', 6)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (79, N'El Corpus', 6)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (80, N'El Triunfo', 6)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (81, N'Marcovia', 6)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (82, N'Morolica', 6)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (83, N'Namasigue', 6)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (84, N'Orocuina', 6)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (85, N'Pespire', 6)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (86, N'San Antonio de Flores', 6)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (87, N'San Isidro', 6)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (88, N'San José', 6)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (89, N'San Marcos de Colón', 6)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (90, N'Santa Ana de Yusguare', 6)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (91, N'Yuscarán', 7)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (92, N'Alauca', 7)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (93, N'Danlí', 7)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (94, N'El Paraíso', 7)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (95, N'Güinope', 7)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (96, N'Jacaleapa', 7)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (97, N'Liure', 7)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (98, N'Morocelí', 7)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (99, N'Oropolí', 7)
GO
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (100, N'Potrerillos', 7)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (101, N'San Antonio de Flores', 7)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (102, N'San Lucas', 7)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (103, N'San Matías', 7)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (104, N'Soledad', 7)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (105, N'Teupasenti', 7)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (106, N'Texiguat', 7)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (107, N'Vado Ancho', 7)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (108, N'Yauyupe', 7)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (109, N'Trojes', 7)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (110, N'Distrito Central (Comayagüela y Tegucigalpa)', 8)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (111, N'Alubarén', 8)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (112, N'Cedros', 8)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (113, N'Curarén', 8)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (114, N'El Porvenir', 8)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (115, N'Guaimaca', 8)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (116, N'La Libertad', 8)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (117, N'La Venta', 8)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (118, N'Lepaterique', 8)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (119, N'Maraita', 8)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (120, N'Marale', 8)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (121, N'Nueva Armenia', 8)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (122, N'Ojojona', 8)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (123, N'Orica', 8)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (124, N'Reitoca', 8)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (125, N'Sabanagrande', 8)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (126, N'San Antonio de Oriente', 8)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (127, N'San Buenaventura', 8)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (128, N'San Ignacio', 8)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (129, N'San Juan de Flores', 8)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (130, N'San Miguelito', 8)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (131, N'Santa Ana', 8)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (132, N'Santa Lucía', 8)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (133, N'Talanga', 8)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (134, N'Tatumbla', 8)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (135, N'Valle de Ángeles', 8)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (136, N'Villa de San Francisco', 8)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (137, N'Vallecillo', 8)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (138, N'Puerto Lempira', 9)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (139, N'Brus Laguna', 9)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (140, N'Ahuas', 9)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (141, N'Juan Francisco Bulnes', 9)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (142, N'Ramón Villeda Morales', 9)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (143, N'Wampusirpe', 9)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (144, N'La Esperanza', 10)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (145, N'Camasca', 10)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (146, N'Colomoncagua', 10)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (147, N'Concepción', 10)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (148, N'Dolores', 10)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (149, N'Intibucá', 10)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (150, N'Jesús de Otoro', 10)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (151, N'Magdalena', 10)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (152, N'Masaguara', 10)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (153, N'San Antonio', 10)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (154, N'San Isidro', 10)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (155, N'San Juan', 10)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (156, N'San Marcos de la Sierra', 10)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (157, N'San Miguel Guancapla', 10)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (158, N'Santa Lucía', 10)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (159, N'Yamaranguila', 10)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (160, N'San Francisco de Opalaca', 10)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (161, N'Roatán', 11)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (162, N'Guanaja', 11)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (163, N'José Santos Guardiola', 11)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (164, N'Utila', 11)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (165, N'La Paz', 12)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (166, N'Aguanqueterique', 12)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (167, N'Cabañas', 12)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (168, N'Cane', 12)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (169, N'Chinacla', 12)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (170, N'Guajiquiro', 12)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (171, N'Lauterique', 12)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (172, N'Marcala', 12)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (173, N'Mercedes de Oriente', 12)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (174, N'Opatoro', 12)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (175, N'San Antonio del Norte', 12)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (176, N'San José', 12)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (177, N'San Juan', 12)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (178, N'San Pedro de Tutule', 12)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (179, N'Santa Ana', 12)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (180, N'Santa Elena', 12)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (181, N'Santa María', 12)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (182, N'Santiago de Puringla', 12)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (183, N'Yarula', 12)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (184, N'Gracias', 13)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (185, N'Belén', 13)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (186, N'Candelaria', 13)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (187, N'Cololaca', 13)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (188, N'Erandique', 13)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (189, N'Gualcince', 13)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (190, N'Guarita', 13)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (191, N'La Campa', 13)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (192, N'La Iguala', 13)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (193, N'Las Flores', 13)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (194, N'La Unión', 13)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (195, N'La Virtud', 13)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (196, N'Lepaera', 13)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (197, N'Mapulaca', 13)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (198, N'Piraera', 13)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (199, N'San Andrés', 13)
GO
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (200, N'San Francisco', 13)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (201, N'San Juan Guarita', 13)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (202, N'San Manuel Colohete', 13)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (203, N'San Rafael', 13)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (204, N'San Sebastián', 13)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (205, N'Santa Cruz', 13)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (206, N'Talgua', 13)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (207, N'Tambla', 13)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (208, N'Tomalá', 13)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (209, N'Valladolid', 13)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (210, N'Virginia', 13)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (211, N'San Marcos de Caiquín', 13)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (212, N'Ocotepeque', 14)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (213, N'Belén Gualcho', 14)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (214, N'Concepción', 14)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (215, N'Dolores Merendón', 14)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (216, N'Fraternidad', 14)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (217, N'La Encarnación', 14)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (218, N'La Labor', 14)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (219, N'Lucerna', 14)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (220, N'Mercedes', 14)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (221, N'San Fernando', 14)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (222, N'San Francisco del Valle', 14)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (223, N'San Jorge', 14)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (224, N'San Marcos', 14)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (225, N'Santa Fe', 14)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (226, N'Sensenti', 14)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (227, N'Sinuapa', 14)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (228, N'Juticalpa', 15)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (229, N'Campamento', 15)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (230, N'Catacamas', 15)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (231, N'Concordia', 15)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (232, N'Dulce Nombre de Culmí', 15)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (233, N'El Rosario', 15)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (234, N'Esquipulas del Norte', 15)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (235, N'Gualaco', 15)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (236, N'Guarizama', 15)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (237, N'Guata', 15)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (238, N'Guayape', 15)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (239, N'Jano', 15)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (240, N'La Unión', 15)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (241, N'Mangulile', 15)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (242, N'Manto', 15)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (243, N'Salamá', 15)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (244, N'San Esteban', 15)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (245, N'San Francisco de Becerra', 15)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (246, N'San Francisco de la Paz', 15)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (247, N'Santa María del Real', 15)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (248, N'Silca', 15)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (249, N'Yocón', 15)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (250, N'Patuca', 15)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (251, N'Santa Bárbara', 16)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (252, N'Arada', 16)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (253, N'Atima', 16)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (254, N'Azacualpa', 16)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (255, N'Ceguaca', 16)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (256, N'Concepción del Norte', 16)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (257, N'Concepción del Sur', 16)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (258, N'Chinda', 16)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (259, N'El Níspero', 16)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (260, N'Gualala', 16)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (261, N'Ilama', 16)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (262, N'Las Vegas', 16)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (263, N'Macuelizo', 16)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (264, N'Naranjito', 16)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (265, N'Nuevo Celilac', 16)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (266, N'Nueva Frontera', 16)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (267, N'Petoa', 16)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (268, N'Protección', 16)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (269, N'Quimistán', 16)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (270, N'San Francisco de Ojuera', 16)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (271, N'San José de Colinas', 16)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (272, N'San Luis', 16)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (273, N'San Marcos', 16)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (274, N'San Nicolás', 16)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (275, N'San Pedro Zacapa', 16)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (276, N'San Vicente Centenario', 16)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (277, N'Santa Rita', 16)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (278, N'Trinidad', 16)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (279, N'Nacaome', 17)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (280, N'Alianza', 17)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (281, N'Amapala', 17)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (282, N'Aramecina', 17)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (283, N'Caridad', 17)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (284, N'Goascorán', 17)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (285, N'Langue', 17)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (286, N'San Francisco de Coray', 17)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (287, N'San Lorenzo', 17)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (288, N'Yoro', 18)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (289, N'Arenal', 18)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (290, N'El Negrito', 18)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (291, N'El Progreso', 18)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (292, N'Jocón', 18)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (293, N'Morazán', 18)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (294, N'Olanchito', 18)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (295, N'Santa Rita', 18)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (296, N'Sulaco', 18)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (297, N'Victoria', 18)
INSERT [dbo].[Ciudades] ([Id_Ciudad], [Nombre_Ciudad], [Id_Departamento]) VALUES (298, N'Yorito', 18)
SET IDENTITY_INSERT [dbo].[Ciudades] OFF
GO
INSERT [dbo].[Clientes] ([Id_Cliente], [Nombres], [Apellidos], [Fecha_Registro], [Fecha_Nacimiento], [Id_Genero], [Direccion], [Id_Ciudad], [Activo], [Ruta_Foto]) VALUES (N'0801200019327', N'Karol Stephany', N'Palma Ventura', CAST(N'2011-12-21' AS Date), CAST(N'2000-10-13' AS Date), 1, N'Col.Hato', 128, 0, NULL)
INSERT [dbo].[Clientes] ([Id_Cliente], [Nombres], [Apellidos], [Fecha_Registro], [Fecha_Nacimiento], [Id_Genero], [Direccion], [Id_Ciudad], [Activo], [Ruta_Foto]) VALUES (N'0802198709091', N'Carlos Josias', N'Maradiaga Lopez', CAST(N'2020-07-20' AS Date), CAST(N'1987-07-16' AS Date), 2, N'Col. Palmeras', 111, 1, NULL)
INSERT [dbo].[Clientes_Correos] ([Id_Cliente], [Correo]) VALUES (N'0802198709091', N'maradiaga.carlos@gmail.com')
INSERT [dbo].[Clientes_Correos] ([Id_Cliente], [Correo]) VALUES (N'0801200019327', N'keikobblack@gmail.com')
INSERT [dbo].[Clientes_Correos] ([Id_Cliente], [Correo]) VALUES (N'0801200019327', N'karolpalma@gmail.com')
INSERT [dbo].[Clientes_Telefonos] ([Id_Cliente], [Telefono]) VALUES (N'0802198709091', N'99233322')
INSERT [dbo].[Clientes_Telefonos] ([Id_Cliente], [Telefono]) VALUES (N'0802198709091', N'80898882')
INSERT [dbo].[Clientes_Telefonos] ([Id_Cliente], [Telefono]) VALUES (N'0801200019327', N'98989898')
SET IDENTITY_INSERT [dbo].[Colores] ON 

INSERT [dbo].[Colores] ([Id_Color], [Nombre_Color]) VALUES (1, N'No Aplica')
INSERT [dbo].[Colores] ([Id_Color], [Nombre_Color]) VALUES (2, N'Blanco')
INSERT [dbo].[Colores] ([Id_Color], [Nombre_Color]) VALUES (3, N'Negro')
INSERT [dbo].[Colores] ([Id_Color], [Nombre_Color]) VALUES (4, N'Café')
INSERT [dbo].[Colores] ([Id_Color], [Nombre_Color]) VALUES (5, N'Gris')
INSERT [dbo].[Colores] ([Id_Color], [Nombre_Color]) VALUES (6, N'Amarillo')
INSERT [dbo].[Colores] ([Id_Color], [Nombre_Color]) VALUES (7, N'Plateado')
INSERT [dbo].[Colores] ([Id_Color], [Nombre_Color]) VALUES (8, N'Dorado')
SET IDENTITY_INSERT [dbo].[Colores] OFF
INSERT [dbo].[Conceptos_Facturacion] ([Id_Concepto], [Nombre], [Id_Tipo_Concepto]) VALUES (1, N'Baño completo y Spa', 1)
INSERT [dbo].[Conceptos_Facturacion] ([Id_Concepto], [Nombre], [Id_Tipo_Concepto]) VALUES (2, N'Cirugía', 1)
INSERT [dbo].[Conceptos_Facturacion] ([Id_Concepto], [Nombre], [Id_Tipo_Concepto]) VALUES (3, N'Cita Médica', 1)
INSERT [dbo].[Conceptos_Facturacion] ([Id_Concepto], [Nombre], [Id_Tipo_Concepto]) VALUES (4, N'Radiografia', 1)
INSERT [dbo].[Conceptos_Facturacion] ([Id_Concepto], [Nombre], [Id_Tipo_Concepto]) VALUES (5, N'Corte de Pelo', 1)
INSERT [dbo].[Conceptos_Facturacion] ([Id_Concepto], [Nombre], [Id_Tipo_Concepto]) VALUES (6, N'Limpieza Dental', 1)
INSERT [dbo].[Conceptos_Facturacion] ([Id_Concepto], [Nombre], [Id_Tipo_Concepto]) VALUES (7, N'Desparacitación', 1)
INSERT [dbo].[Conceptos_Facturacion] ([Id_Concepto], [Nombre], [Id_Tipo_Concepto]) VALUES (8, N'Castración', 1)
INSERT [dbo].[Conceptos_Facturacion] ([Id_Concepto], [Nombre], [Id_Tipo_Concepto]) VALUES (9, N'Hotelería', 1)
SET IDENTITY_INSERT [dbo].[Departamentos] ON 

INSERT [dbo].[Departamentos] ([Id_Departamento], [Nombre_Departamento], [Id_Pais]) VALUES (1, N'Atlántida', 1)
INSERT [dbo].[Departamentos] ([Id_Departamento], [Nombre_Departamento], [Id_Pais]) VALUES (2, N'Colón', 1)
INSERT [dbo].[Departamentos] ([Id_Departamento], [Nombre_Departamento], [Id_Pais]) VALUES (3, N'Comayagua', 1)
INSERT [dbo].[Departamentos] ([Id_Departamento], [Nombre_Departamento], [Id_Pais]) VALUES (4, N'Copán', 1)
INSERT [dbo].[Departamentos] ([Id_Departamento], [Nombre_Departamento], [Id_Pais]) VALUES (5, N'Cortés', 1)
INSERT [dbo].[Departamentos] ([Id_Departamento], [Nombre_Departamento], [Id_Pais]) VALUES (6, N'Choluteca', 1)
INSERT [dbo].[Departamentos] ([Id_Departamento], [Nombre_Departamento], [Id_Pais]) VALUES (7, N'El Paraíso', 1)
INSERT [dbo].[Departamentos] ([Id_Departamento], [Nombre_Departamento], [Id_Pais]) VALUES (8, N'Francisco Morazán', 1)
INSERT [dbo].[Departamentos] ([Id_Departamento], [Nombre_Departamento], [Id_Pais]) VALUES (9, N'Gracias a Dios', 1)
INSERT [dbo].[Departamentos] ([Id_Departamento], [Nombre_Departamento], [Id_Pais]) VALUES (10, N'Intibucá', 1)
INSERT [dbo].[Departamentos] ([Id_Departamento], [Nombre_Departamento], [Id_Pais]) VALUES (11, N'Islas de la Bahía', 1)
INSERT [dbo].[Departamentos] ([Id_Departamento], [Nombre_Departamento], [Id_Pais]) VALUES (12, N'La Paz', 1)
INSERT [dbo].[Departamentos] ([Id_Departamento], [Nombre_Departamento], [Id_Pais]) VALUES (13, N'Lempira', 1)
INSERT [dbo].[Departamentos] ([Id_Departamento], [Nombre_Departamento], [Id_Pais]) VALUES (14, N'Ocotepeque', 1)
INSERT [dbo].[Departamentos] ([Id_Departamento], [Nombre_Departamento], [Id_Pais]) VALUES (15, N'Olancho', 1)
INSERT [dbo].[Departamentos] ([Id_Departamento], [Nombre_Departamento], [Id_Pais]) VALUES (16, N'Santa Bárbara', 1)
INSERT [dbo].[Departamentos] ([Id_Departamento], [Nombre_Departamento], [Id_Pais]) VALUES (17, N'Valle', 1)
INSERT [dbo].[Departamentos] ([Id_Departamento], [Nombre_Departamento], [Id_Pais]) VALUES (18, N'Yoro', 1)
SET IDENTITY_INSERT [dbo].[Departamentos] OFF
SET IDENTITY_INSERT [dbo].[Empleados] ON 

INSERT [dbo].[Empleados] ([Id_Empleado], [Nombres], [Apellidos], [Fecha_Nacimiento], [Fecha_Contratacion], [Fecha_Finalizacion_Contrato], [Id_Cargo], [Reporta_A], [Direccion], [Id_Ciudad], [Activo], [Ruta_Foto], [Notas]) VALUES (1, N'Miriam Ariel', N'Mondragon Espinoza', CAST(N'2000-09-27' AS Date), CAST(N'2020-07-01' AS Date), CAST(N'2030-07-01' AS Date), 1, NULL, N'Col. Torocagua', 110, 1, NULL, N'Graduada de la UTH Tegucigalpa')
SET IDENTITY_INSERT [dbo].[Empleados] OFF
SET IDENTITY_INSERT [dbo].[Especies] ON 

INSERT [dbo].[Especies] ([Id_Especie], [Nombre_Especie]) VALUES (1, N'Perro')
INSERT [dbo].[Especies] ([Id_Especie], [Nombre_Especie]) VALUES (2, N'Gato')
INSERT [dbo].[Especies] ([Id_Especie], [Nombre_Especie]) VALUES (3, N'Roedor')
INSERT [dbo].[Especies] ([Id_Especie], [Nombre_Especie]) VALUES (4, N'Tortuga')
INSERT [dbo].[Especies] ([Id_Especie], [Nombre_Especie]) VALUES (5, N'Oveja')
INSERT [dbo].[Especies] ([Id_Especie], [Nombre_Especie]) VALUES (6, N'MiniPig')
INSERT [dbo].[Especies] ([Id_Especie], [Nombre_Especie]) VALUES (7, N'Ave')
INSERT [dbo].[Especies] ([Id_Especie], [Nombre_Especie]) VALUES (8, N'Pez')
SET IDENTITY_INSERT [dbo].[Especies] OFF
SET IDENTITY_INSERT [dbo].[Estados_Conceptos] ON 

INSERT [dbo].[Estados_Conceptos] ([Id_Estado], [Nombre_Estado]) VALUES (1, N'Activo')
INSERT [dbo].[Estados_Conceptos] ([Id_Estado], [Nombre_Estado]) VALUES (2, N'Inactivo')
INSERT [dbo].[Estados_Conceptos] ([Id_Estado], [Nombre_Estado]) VALUES (3, N'Sin Personal Capacitado')
SET IDENTITY_INSERT [dbo].[Estados_Conceptos] OFF
SET IDENTITY_INSERT [dbo].[Generos] ON 

INSERT [dbo].[Generos] ([Id_Genero], [Nombre_Genero]) VALUES (1, N'Femenino')
INSERT [dbo].[Generos] ([Id_Genero], [Nombre_Genero]) VALUES (2, N'Masculino')
INSERT [dbo].[Generos] ([Id_Genero], [Nombre_Genero]) VALUES (3, N'No definido')
INSERT [dbo].[Generos] ([Id_Genero], [Nombre_Genero]) VALUES (4, N'No aplica')
SET IDENTITY_INSERT [dbo].[Generos] OFF
INSERT [dbo].[Historico_Precios_Servicios] ([Id_Servicio], [Precio], [Fecha_Inicio], [Fecha_Fin]) VALUES (1, 150.0000, CAST(N'2020-07-20' AS Date), NULL)
INSERT [dbo].[Historico_Precios_Servicios] ([Id_Servicio], [Precio], [Fecha_Inicio], [Fecha_Fin]) VALUES (2, 500.0000, CAST(N'2020-07-20' AS Date), NULL)
INSERT [dbo].[Historico_Precios_Servicios] ([Id_Servicio], [Precio], [Fecha_Inicio], [Fecha_Fin]) VALUES (3, 50.0000, CAST(N'2020-07-20' AS Date), NULL)
INSERT [dbo].[Historico_Precios_Servicios] ([Id_Servicio], [Precio], [Fecha_Inicio], [Fecha_Fin]) VALUES (4, 400.0000, CAST(N'2020-07-20' AS Date), NULL)
INSERT [dbo].[Historico_Precios_Servicios] ([Id_Servicio], [Precio], [Fecha_Inicio], [Fecha_Fin]) VALUES (5, 100.0000, CAST(N'2020-07-20' AS Date), NULL)
INSERT [dbo].[Historico_Precios_Servicios] ([Id_Servicio], [Precio], [Fecha_Inicio], [Fecha_Fin]) VALUES (6, 100.0000, CAST(N'2020-07-20' AS Date), NULL)
INSERT [dbo].[Historico_Precios_Servicios] ([Id_Servicio], [Precio], [Fecha_Inicio], [Fecha_Fin]) VALUES (7, 80.0000, CAST(N'2020-07-20' AS Date), NULL)
INSERT [dbo].[Historico_Precios_Servicios] ([Id_Servicio], [Precio], [Fecha_Inicio], [Fecha_Fin]) VALUES (8, 100.0000, CAST(N'2020-07-20' AS Date), NULL)
INSERT [dbo].[Historico_Precios_Servicios] ([Id_Servicio], [Precio], [Fecha_Inicio], [Fecha_Fin]) VALUES (9, 200.0000, CAST(N'2020-06-20' AS Date), CAST(N'2020-07-20' AS Date))
INSERT [dbo].[Historico_Precios_Servicios] ([Id_Servicio], [Precio], [Fecha_Inicio], [Fecha_Fin]) VALUES (9, 500.0000, CAST(N'2020-07-20' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Paises] ON 

INSERT [dbo].[Paises] ([Id_Pais], [Nombre_Pais]) VALUES (1, N'Honduras')
INSERT [dbo].[Paises] ([Id_Pais], [Nombre_Pais]) VALUES (2, N'Panamá')
INSERT [dbo].[Paises] ([Id_Pais], [Nombre_Pais]) VALUES (3, N'Nicaragua')
INSERT [dbo].[Paises] ([Id_Pais], [Nombre_Pais]) VALUES (4, N'Costa Rica')
SET IDENTITY_INSERT [dbo].[Paises] OFF
SET IDENTITY_INSERT [dbo].[Razas] ON 

INSERT [dbo].[Razas] ([Id_Raza], [Nombre_Raza], [Id_Especie]) VALUES (1, N'Siberiano', 1)
INSERT [dbo].[Razas] ([Id_Raza], [Nombre_Raza], [Id_Especie]) VALUES (2, N'Labrador', 1)
INSERT [dbo].[Razas] ([Id_Raza], [Nombre_Raza], [Id_Especie]) VALUES (3, N'Pitbull', 1)
INSERT [dbo].[Razas] ([Id_Raza], [Nombre_Raza], [Id_Especie]) VALUES (4, N'Pastor Alemán', 1)
INSERT [dbo].[Razas] ([Id_Raza], [Nombre_Raza], [Id_Especie]) VALUES (5, N'Angora', 2)
INSERT [dbo].[Razas] ([Id_Raza], [Nombre_Raza], [Id_Especie]) VALUES (6, N'Persa', 2)
INSERT [dbo].[Razas] ([Id_Raza], [Nombre_Raza], [Id_Especie]) VALUES (7, N'Siamés', 2)
INSERT [dbo].[Razas] ([Id_Raza], [Nombre_Raza], [Id_Especie]) VALUES (8, N'Conejo', 3)
INSERT [dbo].[Razas] ([Id_Raza], [Nombre_Raza], [Id_Especie]) VALUES (9, N'Hámster', 3)
INSERT [dbo].[Razas] ([Id_Raza], [Nombre_Raza], [Id_Especie]) VALUES (10, N'Rata Blanca', 3)
INSERT [dbo].[Razas] ([Id_Raza], [Nombre_Raza], [Id_Especie]) VALUES (11, N'Terrestre', 4)
INSERT [dbo].[Razas] ([Id_Raza], [Nombre_Raza], [Id_Especie]) VALUES (12, N'Marina', 4)
INSERT [dbo].[Razas] ([Id_Raza], [Nombre_Raza], [Id_Especie]) VALUES (13, N'Ninja', 4)
INSERT [dbo].[Razas] ([Id_Raza], [Nombre_Raza], [Id_Especie]) VALUES (14, N'Ryeland', 5)
INSERT [dbo].[Razas] ([Id_Raza], [Nombre_Raza], [Id_Especie]) VALUES (15, N'Vietnamita', 6)
INSERT [dbo].[Razas] ([Id_Raza], [Nombre_Raza], [Id_Especie]) VALUES (16, N'Perico', 7)
INSERT [dbo].[Razas] ([Id_Raza], [Nombre_Raza], [Id_Especie]) VALUES (17, N'Canarios', 7)
INSERT [dbo].[Razas] ([Id_Raza], [Nombre_Raza], [Id_Especie]) VALUES (18, N'Dorado', 8)
INSERT [dbo].[Razas] ([Id_Raza], [Nombre_Raza], [Id_Especie]) VALUES (19, N'Payaso', 8)
SET IDENTITY_INSERT [dbo].[Razas] OFF
INSERT [dbo].[Servicios] ([Id_Servicio], [Nombre_Servicio], [Id_Estado]) VALUES (1, N'Baño completo y Spa', 1)
INSERT [dbo].[Servicios] ([Id_Servicio], [Nombre_Servicio], [Id_Estado]) VALUES (2, N'Cirugía', 1)
INSERT [dbo].[Servicios] ([Id_Servicio], [Nombre_Servicio], [Id_Estado]) VALUES (3, N'Cita Médica', 1)
INSERT [dbo].[Servicios] ([Id_Servicio], [Nombre_Servicio], [Id_Estado]) VALUES (4, N'Radiografia', 1)
INSERT [dbo].[Servicios] ([Id_Servicio], [Nombre_Servicio], [Id_Estado]) VALUES (5, N'Corte de Pelo', 1)
INSERT [dbo].[Servicios] ([Id_Servicio], [Nombre_Servicio], [Id_Estado]) VALUES (6, N'Limpieza Dental', 1)
INSERT [dbo].[Servicios] ([Id_Servicio], [Nombre_Servicio], [Id_Estado]) VALUES (7, N'Desparacitación', 1)
INSERT [dbo].[Servicios] ([Id_Servicio], [Nombre_Servicio], [Id_Estado]) VALUES (8, N'Castración', 3)
INSERT [dbo].[Servicios] ([Id_Servicio], [Nombre_Servicio], [Id_Estado]) VALUES (9, N'Hotelería', 2)
INSERT [dbo].[Servicios_Personal] ([Id_Servicio], [Id_Empleado]) VALUES (3, 1)
INSERT [dbo].[Servicios_Personal] ([Id_Servicio], [Id_Empleado]) VALUES (7, 1)
INSERT [dbo].[Telefonos_Empleados] ([Id_Empleado], [Telefono]) VALUES (1, N'98379065')
INSERT [dbo].[Telefonos_Empleados] ([Id_Empleado], [Telefono]) VALUES (1, N'99892340')
SET IDENTITY_INSERT [dbo].[Tipos_Concepto] ON 

INSERT [dbo].[Tipos_Concepto] ([Id_Tipo_Concepto], [Tipo_Concepto]) VALUES (1, N'Servicio')
INSERT [dbo].[Tipos_Concepto] ([Id_Tipo_Concepto], [Tipo_Concepto]) VALUES (2, N'Producto')
SET IDENTITY_INSERT [dbo].[Tipos_Concepto] OFF
ALTER TABLE [dbo].[Animales]  WITH CHECK ADD  CONSTRAINT [FK_Animales_Clientes] FOREIGN KEY([Id_Cliente_Duenio])
REFERENCES [dbo].[Clientes] ([Id_Cliente])
GO
ALTER TABLE [dbo].[Animales] CHECK CONSTRAINT [FK_Animales_Clientes]
GO
ALTER TABLE [dbo].[Animales]  WITH CHECK ADD  CONSTRAINT [FK_Animales_Colores] FOREIGN KEY([Id_Color])
REFERENCES [dbo].[Colores] ([Id_Color])
GO
ALTER TABLE [dbo].[Animales] CHECK CONSTRAINT [FK_Animales_Colores]
GO
ALTER TABLE [dbo].[Animales]  WITH CHECK ADD  CONSTRAINT [FK_Animales_Generos] FOREIGN KEY([Id_Genero])
REFERENCES [dbo].[Generos] ([Id_Genero])
GO
ALTER TABLE [dbo].[Animales] CHECK CONSTRAINT [FK_Animales_Generos]
GO
ALTER TABLE [dbo].[Animales]  WITH CHECK ADD  CONSTRAINT [FK_Animales_Razas] FOREIGN KEY([Id_Raza])
REFERENCES [dbo].[Razas] ([Id_Raza])
GO
ALTER TABLE [dbo].[Animales] CHECK CONSTRAINT [FK_Animales_Razas]
GO
ALTER TABLE [dbo].[Citas]  WITH CHECK ADD  CONSTRAINT [FK_Citas_Animales] FOREIGN KEY([Id_Animal])
REFERENCES [dbo].[Animales] ([Id_Animal])
GO
ALTER TABLE [dbo].[Citas] CHECK CONSTRAINT [FK_Citas_Animales]
GO
ALTER TABLE [dbo].[Citas]  WITH CHECK ADD  CONSTRAINT [FK_Citas_Empleados] FOREIGN KEY([Id_Empleado])
REFERENCES [dbo].[Empleados] ([Id_Empleado])
GO
ALTER TABLE [dbo].[Citas] CHECK CONSTRAINT [FK_Citas_Empleados]
GO
ALTER TABLE [dbo].[Citas]  WITH CHECK ADD  CONSTRAINT [FK_Citas_Estados_Cita] FOREIGN KEY([Id_Estado])
REFERENCES [dbo].[Estados_Cita] ([Id_Estado_Cita])
GO
ALTER TABLE [dbo].[Citas] CHECK CONSTRAINT [FK_Citas_Estados_Cita]
GO
ALTER TABLE [dbo].[Citas]  WITH CHECK ADD  CONSTRAINT [FK_Citas_Tipos_Cita] FOREIGN KEY([Id_Tipo_Cita])
REFERENCES [dbo].[Tipos_Cita] ([Id_Tipo_Cita])
GO
ALTER TABLE [dbo].[Citas] CHECK CONSTRAINT [FK_Citas_Tipos_Cita]
GO
ALTER TABLE [dbo].[Ciudades]  WITH CHECK ADD  CONSTRAINT [FK_Ciudades_Departamentos] FOREIGN KEY([Id_Departamento])
REFERENCES [dbo].[Departamentos] ([Id_Departamento])
GO
ALTER TABLE [dbo].[Ciudades] CHECK CONSTRAINT [FK_Ciudades_Departamentos]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_Ciudades] FOREIGN KEY([Id_Ciudad])
REFERENCES [dbo].[Ciudades] ([Id_Ciudad])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_Clientes_Ciudades]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_Generos] FOREIGN KEY([Id_Genero])
REFERENCES [dbo].[Generos] ([Id_Genero])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_Clientes_Generos]
GO
ALTER TABLE [dbo].[Clientes_Correos]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_Correos_Clientes] FOREIGN KEY([Id_Cliente])
REFERENCES [dbo].[Clientes] ([Id_Cliente])
GO
ALTER TABLE [dbo].[Clientes_Correos] CHECK CONSTRAINT [FK_Clientes_Correos_Clientes]
GO
ALTER TABLE [dbo].[Clientes_Telefonos]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_Telefonos_Clientes] FOREIGN KEY([Id_Cliente])
REFERENCES [dbo].[Clientes] ([Id_Cliente])
GO
ALTER TABLE [dbo].[Clientes_Telefonos] CHECK CONSTRAINT [FK_Clientes_Telefonos_Clientes]
GO
ALTER TABLE [dbo].[Conceptos_Facturacion]  WITH CHECK ADD  CONSTRAINT [FK_Conceptos_Facturacion_Tipos_Concepto] FOREIGN KEY([Id_Tipo_Concepto])
REFERENCES [dbo].[Tipos_Concepto] ([Id_Tipo_Concepto])
GO
ALTER TABLE [dbo].[Conceptos_Facturacion] CHECK CONSTRAINT [FK_Conceptos_Facturacion_Tipos_Concepto]
GO
ALTER TABLE [dbo].[Departamentos]  WITH CHECK ADD  CONSTRAINT [FK_Departamentos_Paises] FOREIGN KEY([Id_Pais])
REFERENCES [dbo].[Paises] ([Id_Pais])
GO
ALTER TABLE [dbo].[Departamentos] CHECK CONSTRAINT [FK_Departamentos_Paises]
GO
ALTER TABLE [dbo].[Detalles_Factura]  WITH CHECK ADD  CONSTRAINT [FK_Detalles_Factura_Conceptos_Facturacion] FOREIGN KEY([Id_Concepto_Facturacion])
REFERENCES [dbo].[Conceptos_Facturacion] ([Id_Concepto])
GO
ALTER TABLE [dbo].[Detalles_Factura] CHECK CONSTRAINT [FK_Detalles_Factura_Conceptos_Facturacion]
GO
ALTER TABLE [dbo].[Detalles_Factura]  WITH CHECK ADD  CONSTRAINT [FK_Detalles_Factura_Descuentos] FOREIGN KEY([Id_Descuento])
REFERENCES [dbo].[Descuentos] ([Id_Descuento])
GO
ALTER TABLE [dbo].[Detalles_Factura] CHECK CONSTRAINT [FK_Detalles_Factura_Descuentos]
GO
ALTER TABLE [dbo].[Detalles_Factura]  WITH CHECK ADD  CONSTRAINT [FK_Detalles_Factura_Facturas] FOREIGN KEY([Id_Factura])
REFERENCES [dbo].[Facturas] ([Id_Factura])
GO
ALTER TABLE [dbo].[Detalles_Factura] CHECK CONSTRAINT [FK_Detalles_Factura_Facturas]
GO
ALTER TABLE [dbo].[Detalles_Factura]  WITH CHECK ADD  CONSTRAINT [FK_Detalles_Factura_Impuestos] FOREIGN KEY([Id_Impuesto])
REFERENCES [dbo].[Impuestos] ([Id_Impuesto])
GO
ALTER TABLE [dbo].[Detalles_Factura] CHECK CONSTRAINT [FK_Detalles_Factura_Impuestos]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [FK_Empleados_Cargos] FOREIGN KEY([Id_Cargo])
REFERENCES [dbo].[Cargos] ([Id_Cargo])
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [FK_Empleados_Cargos]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [FK_Empleados_Ciudades] FOREIGN KEY([Id_Ciudad])
REFERENCES [dbo].[Ciudades] ([Id_Ciudad])
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [FK_Empleados_Ciudades]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [FK_Empleados_Empleados] FOREIGN KEY([Reporta_A])
REFERENCES [dbo].[Empleados] ([Id_Empleado])
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [FK_Empleados_Empleados]
GO
ALTER TABLE [dbo].[Facturas]  WITH CHECK ADD  CONSTRAINT [FK_Facturas_Citas] FOREIGN KEY([Id_Cita])
REFERENCES [dbo].[Citas] ([Id_Cita])
GO
ALTER TABLE [dbo].[Facturas] CHECK CONSTRAINT [FK_Facturas_Citas]
GO
ALTER TABLE [dbo].[Facturas]  WITH CHECK ADD  CONSTRAINT [FK_Facturas_Metodo_Pago] FOREIGN KEY([Id_Metodo_Pago])
REFERENCES [dbo].[Metodo_Pago] ([Id_Metodo_Pago])
GO
ALTER TABLE [dbo].[Facturas] CHECK CONSTRAINT [FK_Facturas_Metodo_Pago]
GO
ALTER TABLE [dbo].[Historico_Precios_Impuestos]  WITH CHECK ADD  CONSTRAINT [FK_Historico_Precios_Impuestos_Impuestos] FOREIGN KEY([Id_Impuesto])
REFERENCES [dbo].[Impuestos] ([Id_Impuesto])
GO
ALTER TABLE [dbo].[Historico_Precios_Impuestos] CHECK CONSTRAINT [FK_Historico_Precios_Impuestos_Impuestos]
GO
ALTER TABLE [dbo].[Historico_Precios_Productos]  WITH CHECK ADD  CONSTRAINT [FK_Historico_Precios_Productos_Productos] FOREIGN KEY([Id_Producto])
REFERENCES [dbo].[Productos] ([Id_Producto])
GO
ALTER TABLE [dbo].[Historico_Precios_Productos] CHECK CONSTRAINT [FK_Historico_Precios_Productos_Productos]
GO
ALTER TABLE [dbo].[Historico_Precios_Servicios]  WITH CHECK ADD  CONSTRAINT [FK_Historico_Precios_Servicios_Servicios] FOREIGN KEY([Id_Servicio])
REFERENCES [dbo].[Servicios] ([Id_Servicio])
GO
ALTER TABLE [dbo].[Historico_Precios_Servicios] CHECK CONSTRAINT [FK_Historico_Precios_Servicios_Servicios]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Categorias] FOREIGN KEY([Id_Categoria])
REFERENCES [dbo].[Categorias] ([Id_Categoria])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Categorias]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Conceptos_Facturacion] FOREIGN KEY([Id_Producto])
REFERENCES [dbo].[Conceptos_Facturacion] ([Id_Concepto])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Conceptos_Facturacion]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Estados_Conceptos] FOREIGN KEY([Id_Estado_Concepto])
REFERENCES [dbo].[Estados_Conceptos] ([Id_Estado])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Estados_Conceptos]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Proveedor] FOREIGN KEY([Id_Proveedor])
REFERENCES [dbo].[Proveedor] ([Id_Proveedor])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Proveedor]
GO
ALTER TABLE [dbo].[Proveedor]  WITH CHECK ADD  CONSTRAINT [FK_Proveedor_Ciudades] FOREIGN KEY([Id_Ciudad])
REFERENCES [dbo].[Ciudades] ([Id_Ciudad])
GO
ALTER TABLE [dbo].[Proveedor] CHECK CONSTRAINT [FK_Proveedor_Ciudades]
GO
ALTER TABLE [dbo].[Proveedor_Correos]  WITH CHECK ADD  CONSTRAINT [FK_Proveedor_Correos_Proveedor] FOREIGN KEY([Id_Proveedor])
REFERENCES [dbo].[Proveedor] ([Id_Proveedor])
GO
ALTER TABLE [dbo].[Proveedor_Correos] CHECK CONSTRAINT [FK_Proveedor_Correos_Proveedor]
GO
ALTER TABLE [dbo].[Proveedor_Telefonos]  WITH CHECK ADD  CONSTRAINT [FK_Proveedor_Telefonos_Proveedor] FOREIGN KEY([Id_Proveedor])
REFERENCES [dbo].[Proveedor] ([Id_Proveedor])
GO
ALTER TABLE [dbo].[Proveedor_Telefonos] CHECK CONSTRAINT [FK_Proveedor_Telefonos_Proveedor]
GO
ALTER TABLE [dbo].[Razas]  WITH CHECK ADD  CONSTRAINT [FK_Razas_Especies] FOREIGN KEY([Id_Especie])
REFERENCES [dbo].[Especies] ([Id_Especie])
GO
ALTER TABLE [dbo].[Razas] CHECK CONSTRAINT [FK_Razas_Especies]
GO
ALTER TABLE [dbo].[Servicios]  WITH CHECK ADD  CONSTRAINT [FK_Servicios_Conceptos_Facturacion] FOREIGN KEY([Id_Servicio])
REFERENCES [dbo].[Conceptos_Facturacion] ([Id_Concepto])
GO
ALTER TABLE [dbo].[Servicios] CHECK CONSTRAINT [FK_Servicios_Conceptos_Facturacion]
GO
ALTER TABLE [dbo].[Servicios]  WITH CHECK ADD  CONSTRAINT [FK_Servicios_Estados_Conceptos] FOREIGN KEY([Id_Estado])
REFERENCES [dbo].[Estados_Conceptos] ([Id_Estado])
GO
ALTER TABLE [dbo].[Servicios] CHECK CONSTRAINT [FK_Servicios_Estados_Conceptos]
GO
ALTER TABLE [dbo].[Servicios_Personal]  WITH CHECK ADD  CONSTRAINT [FK_Servicios_Personal_Empleados] FOREIGN KEY([Id_Empleado])
REFERENCES [dbo].[Empleados] ([Id_Empleado])
GO
ALTER TABLE [dbo].[Servicios_Personal] CHECK CONSTRAINT [FK_Servicios_Personal_Empleados]
GO
ALTER TABLE [dbo].[Servicios_Personal]  WITH CHECK ADD  CONSTRAINT [FK_Servicios_Personal_Servicios] FOREIGN KEY([Id_Servicio])
REFERENCES [dbo].[Servicios] ([Id_Servicio])
GO
ALTER TABLE [dbo].[Servicios_Personal] CHECK CONSTRAINT [FK_Servicios_Personal_Servicios]
GO
ALTER TABLE [dbo].[Telefonos_Empleados]  WITH CHECK ADD  CONSTRAINT [FK_Telefonos_Empleados_Empleados] FOREIGN KEY([Id_Empleado])
REFERENCES [dbo].[Empleados] ([Id_Empleado])
GO
ALTER TABLE [dbo].[Telefonos_Empleados] CHECK CONSTRAINT [FK_Telefonos_Empleados_Empleados]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Empleados] FOREIGN KEY([Id_Empleado])
REFERENCES [dbo].[Empleados] ([Id_Empleado])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Empleados]
GO
/****** Object:  StoredProcedure [dbo].[ACTUALIZAR_CLIENTE]    Script Date: 7/21/2020 11:27:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ACTUALIZAR_CLIENTE]
@ID NVARCHAR(50),
@NOMBRES NVARCHAR(50),
@APELLIDOS NVARCHAR(50),
@FECHAREGISTRO DATE,
@FECHANACIMIENTO DATE,
@IDGENERO INT,
@DIRECCION NVARCHAR(50),
@IDCIUDAD INT, 
@ACTIVO INT,
@RUTAFOTO NVARCHAR(100),
@TELEFONOS NVARCHAR(100),
@CORREOS NVARCHAR (100)
AS
DECLARE @VN_CONTEO INT
BEGIN TRY
	IF @ID IS NULL OR @ACTIVO IS NULL
	   BEGIN
			RAISERROR('Algunos parámetros no pueden ser nulos', 16, 1)
		END
	UPDATE Clientes
	SET Nombres = COALESCE(@NOMBRES, Nombres), 
		Apellidos = COALESCE(@APELLIDOS, Apellidos), 
		Fecha_Registro = COALESCE(@FECHAREGISTRO, Fecha_Registro),
		Fecha_Nacimiento = COALESCE(@FECHANACIMIENTO, Fecha_Nacimiento),
		Id_Genero = COALESCE(@IDGENERO, Id_Genero),
		Direccion = COALESCE(@DIRECCION, Direccion),
		Id_Ciudad = COALESCE(@IDCIUDAD, Id_Ciudad), 
		Activo = COALESCE(@ACTIVO, Activo),
		Ruta_Foto = COALESCE(@RUTAFOTO, Ruta_Foto)
	WHERE Id_Cliente = @ID

	SET @VN_CONTEO = @@ROWCOUNT;

	IF @TELEFONOS IS NOT NULL
	BEGIN
		DELETE FROM Clientes_Telefonos
		WHERE Id_Cliente = @ID
		IF @TELEFONOS <> ''
		INSERT INTO Clientes_Telefonos(Id_Cliente, Telefono)
		(
			SELECT * FROM dbo.SPLITSTRING(@ID, @TELEFONOS)
		)
	END

	IF @CORREOS IS NOT NULL
	BEGIN
		DELETE FROM Clientes_Correos
		WHERE Id_Cliente = @ID
		IF @CORREOS <> ''
		INSERT INTO Clientes_Correos(Id_Cliente, Correo)
		(
			SELECT * FROM dbo.SPLITSTRING(@ID, @CORREOS)
		)
	END
	
	IF @VN_CONTEO = 0
		RAISERROR ('No se actualizó ningún registro, pues el registro solicitado no existe', 16, 1)
	ELSE
		PRINT 'Registro actualizado correctamente'
END TRY
BEGIN CATCH
	PRINT 'Se ha producido el error: ' + ERROR_MESSAGE()
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[ACTUALIZAR_EMPLEADO]    Script Date: 7/21/2020 11:27:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ACTUALIZAR_EMPLEADO]
@ID INT,
@NOMBRE NVARCHAR(50),
@APELLIDO NVARCHAR(50),
@FECHANACIMIENTO DATE,
@FECHACONTRATACION DATE,
@FECHAFINALIZACIONCONTRATO DATE,
@IDCARGO INT,
@REPORTA_A INT,
@DIRECCION NVARCHAR(50),
@IDCIUDAD INT, 
@ACTIVO BIT, 
@RUTAFOTO NVARCHAR(100),
@NOTAS NTEXT,
@TELEFONOS NVARCHAR(100)
AS
DECLARE @VN_CONTEO INT
BEGIN TRY
	IF @ID IS NULL OR @ACTIVO IS NULL
	   BEGIN
			RAISERROR('Algunos parámetros no pueden ser nulos', 16, 1)
		END
	UPDATE Empleados
	SET Nombres = COALESCE(@NOMBRE, Nombres), 
		Apellidos = COALESCE(@APELLIDO, Apellidos), 
		Fecha_Nacimiento = COALESCE(@FECHANACIMIENTO, Fecha_Nacimiento),
		Fecha_Contratacion = COALESCE(@FECHACONTRATACION, Fecha_Contratacion),
		Fecha_Finalizacion_Contrato = COALESCE(@FECHAFINALIZACIONCONTRATO, Fecha_Finalizacion_Contrato),
		Id_Cargo = COALESCE(@IDCARGO, Id_Cargo),
		Reporta_A = COALESCE(@REPORTA_A, Reporta_A), 
		Direccion = COALESCE(@DIRECCION, Direccion),
		Id_Ciudad = COALESCE(@IDCIUDAD, Id_Ciudad),
		Activo = COALESCE(@ACTIVO, Activo),
		Ruta_Foto = COALESCE(@RUTAFOTO, Ruta_Foto), 
		Notas = COALESCE(@NOTAS, Notas)
	WHERE Id_Empleado = @ID
	
	SET @VN_CONTEO = @@ROWCOUNT;

	IF @TELEFONOS IS NOT NULL
	BEGIN
		DELETE FROM Telefonos_Empleados
		WHERE Id_Empleado = @ID
		IF @TELEFONOS <> ''
		INSERT INTO Telefonos_Empleados(Id_Empleado, Telefono)
		(
			SELECT * FROM dbo.SPLITSTRING(@ID, @TELEFONOS)
		)
	END
	

	IF @VN_CONTEO = 0
		RAISERROR ('No se actualizó ningún registro, pues el registro solicitado no existe', 16, 1)
	ELSE
		PRINT 'Registro actualizado correctamente'
END TRY
BEGIN CATCH
	PRINT 'Se ha producido el error: ' + ERROR_MESSAGE()
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[ACTUALIZAR_SERVICIO]    Script Date: 7/21/2020 11:27:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ACTUALIZAR_SERVICIO]
@ID INT,
@NOMBRE NVARCHAR(50),
@IDESTADO INT,
@PRECIO MONEY
AS
DECLARE @VN_CONTEO INT
BEGIN TRANSACTION T1;
BEGIN TRY
	IF @IDESTADO IS NULL
	   BEGIN
			RAISERROR('Los parámetros no pueden ser nulos', 16, 1)
		END
	
	UPDATE Servicios
	SET Nombre_Servicio = COALESCE(@NOMBRE, Nombre_Servicio), 
		Id_Estado = COALESCE(@IDESTADO, Id_Estado)
	WHERE Id_Servicio = @ID
	
	SET @VN_CONTEO = @@ROWCOUNT;

	IF @PRECIO IS NOT NULL
	BEGIN
	UPDATE Historico_Precios_Servicios
	SET Fecha_Fin = COALESCE(CONVERT(DATE, GETDATE()), Fecha_Fin)
	WHERE Id_Servicio = @ID AND Fecha_Fin IS NULL

	INSERT INTO Historico_Precios_Servicios(Id_Servicio, Precio, Fecha_Inicio, Fecha_Fin)
	VALUES(@ID, @PRECIO, CONVERT(DATE, GETDATE()), NULL)
	END

	PRINT 'Registro insertado correctamente'

	COMMIT TRANSACTION T1;

END TRY
BEGIN CATCH
	PRINT 'Se ha producido el error: ' + ERROR_MESSAGE();
	ROLLBACK TRANSACTION T1;
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[CONSULTAR_CLIENTE]    Script Date: 7/21/2020 11:27:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CONSULTAR_CLIENTE]
@ID NVARCHAR(50)
AS
BEGIN TRY
	SELECT *
	FROM Clientes
	WHERE Id_Cliente = @ID
	IF @@ROWCOUNT = 0
		RAISERROR ('No se encontró un registro con el ID especificado', 16, 1)
	ELSE
		PRINT 'Se encontró el registro'
END TRY
BEGIN CATCH
	PRINT 'Se ha producido el error: ' + ERROR_MESSAGE()
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[CONSULTAR_EMPLEADO]    Script Date: 7/21/2020 11:27:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CONSULTAR_EMPLEADO]
@ID INT
AS
BEGIN TRY
	SELECT *
	FROM Empleados
	WHERE Id_Empleado = @ID
	IF @@ROWCOUNT = 0
		RAISERROR ('No se encontró un registro con el ID especificado', 16, 1)
	ELSE
		PRINT 'Se encontró el registro'
END TRY
BEGIN CATCH
	PRINT 'Se ha producido el error: ' + ERROR_MESSAGE()
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[CONSULTAR_SERVICIO]    Script Date: 7/21/2020 11:27:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CONSULTAR_SERVICIO]
@ID INT
AS
BEGIN TRY
	SELECT S.Id_Servicio, S.Nombre_Servicio, S.Id_Estado, HPS.Precio 
	FROM Servicios AS S INNER JOIN Historico_Precios_Servicios AS HPS ON S.Id_Servicio = HPS.Id_Servicio
	WHERE S.Id_Servicio = @ID AND HPS.Fecha_Fin IS NULL
	IF @@ROWCOUNT = 0
		RAISERROR ('No se encontró un registro con el ID especificado', 16, 1)
	ELSE
		PRINT 'Se encontró el registro'
END TRY
BEGIN CATCH
	PRINT 'Se ha producido el error: ' + ERROR_MESSAGE()
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[INSERTAR_CLIENTE]    Script Date: 7/21/2020 11:27:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[INSERTAR_CLIENTE]
@ID NVARCHAR(50),
@NOMBRES NVARCHAR(50),
@APELLIDOS NVARCHAR(50),
@FECHAREGISTRO DATE,
@FECHANACIMIENTO DATE,
@IDGENERO INT,
@DIRECCION NVARCHAR(50),
@IDCIUDAD INT,
--Activo se pone solo como 1 (0 es inactivo)
@RUTAFOTO NVARCHAR(100),
@TELEFONOS NVARCHAR(50),
@CORREOS NVARCHAR(100)
AS
BEGIN TRY
	IF @ID IS NULL OR @NOMBRES IS NULL OR @APELLIDOS IS NULL OR @FECHAREGISTRO IS NULL OR @FECHANACIMIENTO IS NULL
	   OR @IDGENERO IS NULL OR @IDCIUDAD IS NULL
	   BEGIN
			RAISERROR('Algunos parámetros no pueden ser nulos', 16, 1)
		END
	INSERT INTO Clientes(Id_Cliente, Nombres, Apellidos, Fecha_Registro, Fecha_Nacimiento, Id_Genero, Direccion, Id_Ciudad, Activo, Ruta_Foto)
	VALUES(@ID, @NOMBRES, @APELLIDOS, @FECHAREGISTRO, @FECHANACIMIENTO, @IDGENERO, @DIRECCION, @IDCIUDAD, 1, @RUTAFOTO)

	--INSERCION EN LA TABLA TELEFONOS
	IF @TELEFONOS <> '' OR @TELEFONOS IS NOT NULL
	INSERT INTO Clientes_Telefonos(Id_Cliente, Telefono)
	(
		SELECT * FROM dbo.SPLITSTRING(@ID, @TELEFONOS)
	)

	--INSERCION EN LA TABLA CORREOS
	IF @CORREOS <> '' OR @CORREOS IS NOT NULL
	INSERT INTO Clientes_Correos(Id_Cliente, Correo)
	(
		SELECT * FROM dbo.SPLITSTRING(@ID, @CORREOS)
	)

	PRINT 'Registro insertado correctamente'
END TRY
BEGIN CATCH
	PRINT 'Se ha producido el error: ' + ERROR_MESSAGE()
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[INSERTAR_EMPLEADO]    Script Date: 7/21/2020 11:27:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[INSERTAR_EMPLEADO]
@NOMBRE NVARCHAR(50),
@APELLIDO NVARCHAR(50),
@FECHANACIMIENTO DATE,
@FECHACONTRATACION DATE,
@FECHAFINALIZACIONCONTRATO DATE,
@IDCARGO INT,
@REPORTA_A INT,
@DIRECCION NVARCHAR(50),
@IDCIUDAD INT,  
--Activo se pone solo como 1 (0 es inactivo)
@RUTAFOTO NVARCHAR(100),
@NOTAS NTEXT,
@TELEFONOS NVARCHAR(100),
@ID INT OUTPUT
AS
BEGIN TRY
	IF @NOMBRE IS NULL OR @APELLIDO IS NULL OR @FECHANACIMIENTO IS NULL OR @FECHACONTRATACION IS NULL OR @FECHAFINALIZACIONCONTRATO IS NULL
	   OR @IDCARGO IS NULL OR @IDCIUDAD IS NULL
	   BEGIN
			RAISERROR('Algunos parámetros no pueden ser nulos', 16, 1)
		END
	INSERT INTO Empleados(Nombres, Apellidos, Fecha_Nacimiento, Fecha_Contratacion, Fecha_Finalizacion_Contrato, Id_Cargo, Reporta_A,
	Direccion, Id_Ciudad, Activo, Ruta_Foto, Notas)
	VALUES(@NOMBRE, @APELLIDO, @FECHANACIMIENTO, @FECHACONTRATACION, @FECHAFINALIZACIONCONTRATO, @IDCARGO, @REPORTA_A, @DIRECCION, 
		   @IDCIUDAD, 1, @RUTAFOTO, @NOTAS);
		   SET @ID = @@IDENTITY;

	--INSERCION EN LA TABLA TELEFONOS
	IF @TELEFONOS <> '' OR @TELEFONOS IS NOT NULL
	INSERT INTO Telefonos_Empleados(Id_Empleado, Telefono)
	(
		SELECT * FROM dbo.SPLITSTRING(@ID, @TELEFONOS)
	)

	--INSERCION EN LA TABLA DE PERSONAL_SERVICIO
	IF @IDCARGO = 1
	INSERT INTO Servicios_Personal(Id_Empleado, Id_Servicio)
	(
		SELECT @ID, 3 UNION ALL
		SELECT @ID, 7
	)
	IF @IDCARGO = 2
	INSERT INTO Servicios_Personal(Id_Empleado, Id_Servicio)
	(
		SELECT @ID, 3 UNION ALL
		SELECT @ID, 4
	)
	IF @IDCARGO = 3
	INSERT INTO Servicios_Personal(Id_Empleado, Id_Servicio)
	(
		SELECT @ID, 1
	)
	IF @IDCARGO = 5
	INSERT INTO Servicios_Personal(Id_Empleado, Id_Servicio)
	(
		SELECT @ID, 2 UNION ALL
		SELECT @ID, 3
	)
	IF @IDCARGO = 6
	INSERT INTO Servicios_Personal(Id_Empleado, Id_Servicio)
	(
		SELECT @ID, 3 UNION ALL
		SELECT @ID, 6
	)
	IF @IDCARGO = 7
	INSERT INTO Servicios_Personal(Id_Empleado, Id_Servicio)
	(
		SELECT @ID, 5
	)

	PRINT 'Registro insertado correctamente'
END TRY
BEGIN CATCH
	PRINT 'Se ha producido el error: ' + ERROR_MESSAGE()
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[INSERTAR_SERVICIO]    Script Date: 7/21/2020 11:27:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[INSERTAR_SERVICIO]
@NOMBRE NVARCHAR(50),
@IDESTADO INT, --SETEAR COMO SIN PERSONAL
@PRECIO MONEY
AS
DECLARE @MAYORID INT
BEGIN TRANSACTION T1;
BEGIN TRY
	IF @NOMBRE IS NULL OR @IDESTADO IS NULL OR @PRECIO IS NULL OR @NOMBRE = ''
	   BEGIN
			RAISERROR('Los parámetros no pueden ser nulos ni vacios', 16, 1)
		END
	SELECT @MAYORID = MAX(Id_Concepto) FROM Conceptos_Facturacion;

	IF @MAYORID IS NULL
		SET @MAYORID = 1;
	ELSE
		SET @MAYORID = @MAYORID + 1;

	INSERT INTO Conceptos_Facturacion(Nombre, Id_Tipo_Concepto, Id_Concepto)
	VALUES(@NOMBRE, 1, @MAYORID)

	INSERT INTO Servicios(Nombre_Servicio, Id_Estado, Id_Servicio)
	VALUES(@NOMBRE, @IDESTADO, @MAYORID)
	
	INSERT INTO Historico_Precios_Servicios(Id_Servicio, Precio, Fecha_Inicio, Fecha_Fin)
	VALUES(@MAYORID, @PRECIO, CONVERT(DATE, GETDATE()), NULL)
	PRINT 'Registro insertado correctamente'

	COMMIT TRANSACTION T1;

END TRY
BEGIN CATCH
	PRINT 'Se ha producido el error: ' + ERROR_MESSAGE();
	ROLLBACK TRANSACTION T1;
END CATCH
GO
USE [master]
GO
ALTER DATABASE [BD2_Veterinaria] SET  READ_WRITE 
GO
