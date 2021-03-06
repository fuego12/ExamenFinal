USE [master]
GO
/****** Object:  Database [BD_ExamenFinal]    Script Date: 16/03/2020 22:40:58 ******/
CREATE DATABASE [BD_ExamenFinal]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BD_ExamenFinal', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQL2017\MSSQL\DATA\BD_ExamenFinal.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BD_ExamenFinal_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQL2017\MSSQL\DATA\BD_ExamenFinal_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BD_ExamenFinal] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BD_ExamenFinal].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BD_ExamenFinal] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BD_ExamenFinal] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BD_ExamenFinal] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BD_ExamenFinal] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BD_ExamenFinal] SET ARITHABORT OFF 
GO
ALTER DATABASE [BD_ExamenFinal] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BD_ExamenFinal] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BD_ExamenFinal] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BD_ExamenFinal] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BD_ExamenFinal] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BD_ExamenFinal] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BD_ExamenFinal] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BD_ExamenFinal] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BD_ExamenFinal] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BD_ExamenFinal] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BD_ExamenFinal] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BD_ExamenFinal] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BD_ExamenFinal] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BD_ExamenFinal] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BD_ExamenFinal] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BD_ExamenFinal] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BD_ExamenFinal] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BD_ExamenFinal] SET RECOVERY FULL 
GO
ALTER DATABASE [BD_ExamenFinal] SET  MULTI_USER 
GO
ALTER DATABASE [BD_ExamenFinal] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BD_ExamenFinal] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BD_ExamenFinal] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BD_ExamenFinal] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BD_ExamenFinal] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BD_ExamenFinal', N'ON'
GO
ALTER DATABASE [BD_ExamenFinal] SET QUERY_STORE = OFF
GO
USE [BD_ExamenFinal]
GO
/****** Object:  Table [dbo].[tbAtencionCliente]    Script Date: 16/03/2020 22:40:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbAtencionCliente](
	[IdCliente] [int] NOT NULL,
	[IdTipoAtencion] [int] NOT NULL,
	[FechaRegistro] [date] NOT NULL,
	[Estado] [char](1) NOT NULL,
 CONSTRAINT [PK_dbo.tbAtencionCliente] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC,
	[IdTipoAtencion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbCliente]    Script Date: 16/03/2020 22:40:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbCliente](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Apellido] [nvarchar](50) NOT NULL,
	[NumDocumento] [int] NOT NULL,
	[Estado] [char](1) NOT NULL,
 CONSTRAINT [PK_dbo.tbCliente] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbTipoAtencion]    Script Date: 16/03/2020 22:40:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbTipoAtencion](
	[IdTipoAtencion] [int] IDENTITY(1,1) NOT NULL,
	[Detalle] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_dbo.tbTipoAtencion] PRIMARY KEY CLUSTERED 
(
	[IdTipoAtencion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbAtencionCliente]  WITH CHECK ADD  CONSTRAINT [FK_dbo.tbAtencionCliente_dbo.tbCliente_IdCliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[tbCliente] ([IdCliente])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbAtencionCliente] CHECK CONSTRAINT [FK_dbo.tbAtencionCliente_dbo.tbCliente_IdCliente]
GO
ALTER TABLE [dbo].[tbAtencionCliente]  WITH CHECK ADD  CONSTRAINT [FK_dbo.tbAtencionCliente_dbo.tbTipoAtencion_IdTipoAtencion] FOREIGN KEY([IdTipoAtencion])
REFERENCES [dbo].[tbTipoAtencion] ([IdTipoAtencion])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbAtencionCliente] CHECK CONSTRAINT [FK_dbo.tbAtencionCliente_dbo.tbTipoAtencion_IdTipoAtencion]
GO
/****** Object:  StoredProcedure [dbo].[sp_atencion_list]    Script Date: 16/03/2020 22:40:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_atencion_list]
AS
BEGIN
	SELECT 
		c.Nombre,
		c.Apellido,
		t.Detalle,
		a.FechaRegistro
	FROM tbAtencionCliente a
	INNER JOIN tbCliente c ON A.IdCliente = c.IdCliente
	INNER JOIN tbTipoAtencion t ON A.IdTipoAtencion = T.IdTipoAtencion
	WHERE a.Estado = 'A'
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_create_atencion]    Script Date: 16/03/2020 22:40:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_create_atencion]
@idCliente INT,
@idTipoAtencion INT
AS
BEGIN
	INSERT INTO tbAtencionCliente(IdCliente, IdTipoAtencion, FechaRegistro, Estado)
	VALUES (@idCliente, @idTipoAtencion, GETDATE(), 'A')
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_atencion]    Script Date: 16/03/2020 22:40:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_delete_atencion]
@IdCliente INT,
@IdTipoAtencion INT,
@state CHAR(1)
AS
BEGIN
	UPDATE tbAtencionCliente
	SET Estado = @state
	WHERE IdCliente = @IdCliente AND IdTipoAtencion = @IdTipoAtencion
END;
GO
USE [master]
GO
ALTER DATABASE [BD_ExamenFinal] SET  READ_WRITE 
GO
