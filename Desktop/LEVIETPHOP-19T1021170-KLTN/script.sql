USE [master]
GO
/****** Object:  Database [LeVietPhop_DoAn]    Script Date: 19/5/2023 11:04:45 PM ******/
CREATE DATABASE [LeVietPhop_DoAn]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LeNgocKien_19T1021111_ThiHK_JavaNangCao', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\LeNgocKien_19T1021111_ThiHK_JavaNangCao.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LeNgocKien_19T1021111_ThiHK_JavaNangCao_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\LeNgocKien_19T1021111_ThiHK_JavaNangCao_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LeVietPhop_DoAn] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LeVietPhop_DoAn].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LeVietPhop_DoAn] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LeVietPhop_DoAn] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LeVietPhop_DoAn] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LeVietPhop_DoAn] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LeVietPhop_DoAn] SET ARITHABORT OFF 
GO
ALTER DATABASE [LeVietPhop_DoAn] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LeVietPhop_DoAn] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LeVietPhop_DoAn] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LeVietPhop_DoAn] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LeVietPhop_DoAn] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LeVietPhop_DoAn] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LeVietPhop_DoAn] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LeVietPhop_DoAn] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LeVietPhop_DoAn] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LeVietPhop_DoAn] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LeVietPhop_DoAn] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LeVietPhop_DoAn] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LeVietPhop_DoAn] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LeVietPhop_DoAn] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LeVietPhop_DoAn] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LeVietPhop_DoAn] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LeVietPhop_DoAn] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LeVietPhop_DoAn] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LeVietPhop_DoAn] SET  MULTI_USER 
GO
ALTER DATABASE [LeVietPhop_DoAn] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LeVietPhop_DoAn] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LeVietPhop_DoAn] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LeVietPhop_DoAn] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [LeVietPhop_DoAn] SET DELAYED_DURABILITY = DISABLED 
GO
USE [LeVietPhop_DoAn]
GO
/****** Object:  UserDefinedFunction [dbo].[fuChuyenCoDauThanhKhongDau]    Script Date: 19/5/2023 11:04:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fuChuyenCoDauThanhKhongDau]
(
      @strInput NVARCHAR(4000)
)
RETURNS NVARCHAR(4000)
AS
BEGIN    
    IF @strInput IS NULL RETURN @strInput
    IF @strInput = '' RETURN @strInput
    DECLARE @RT NVARCHAR(4000)
    DECLARE @SIGN_CHARS NCHAR(136)
    DECLARE @UNSIGN_CHARS NCHAR (136)
 
    SET @SIGN_CHARS = N'ăâđêôơưàảãạáằẳẵặắầẩẫậấèẻẽẹéềểễệế
                 ìỉĩịíòỏõọóồổỗộốờởỡợớùủũụúừửữựứỳỷỹỵý
                 ĂÂĐÊÔƠƯÀẢÃẠÁẰẲẴẶẮẦẨẪẬẤÈẺẼẸÉỀỂỄỆẾÌỈĨỊÍ
                 ÒỎÕỌÓỒỔỖỘỐỜỞỠỢỚÙỦŨỤÚỪỬỮỰỨỲỶỸỴÝ'
                  +NCHAR(272)+ NCHAR(208)
    SET @UNSIGN_CHARS = N'aadeoouaaaaaaaaaaaaaaaeeeeeeeeee
                 iiiiiooooooooooooooouuuuuuuuuuyyyyy
                 AADEOOUAAAAAAAAAAAAAAAEEEEEEEEEEIIIII
                 OOOOOOOOOOOOOOOUUUUUUUUUUYYYYYDD'
 
    DECLARE @COUNTER INT
    DECLARE @COUNTER1 INT
    SET @COUNTER = 1
 
    WHILE (@COUNTER <=LEN(@strInput))
    BEGIN  
      SET @COUNTER1 = 1
      --Tìm trong chuỗi mẫu
       WHILE (@COUNTER1 <=LEN(@SIGN_CHARS)+1)
       BEGIN
     IF UNICODE(SUBSTRING(@SIGN_CHARS, @COUNTER1,1))
            = UNICODE(SUBSTRING(@strInput,@COUNTER ,1) )
     BEGIN          
          IF @COUNTER=1
              SET @strInput = SUBSTRING(@UNSIGN_CHARS, @COUNTER1,1)
              + SUBSTRING(@strInput, @COUNTER+1,LEN(@strInput)-1)                  
          ELSE
              SET @strInput = SUBSTRING(@strInput, 1, @COUNTER-1)
              +SUBSTRING(@UNSIGN_CHARS, @COUNTER1,1)
              + SUBSTRING(@strInput, @COUNTER+1,LEN(@strInput)- @COUNTER)
              BREAK
               END
             SET @COUNTER1 = @COUNTER1 +1
       END
      --Tìm tiếp
       SET @COUNTER = @COUNTER +1
    END
    SET @strInput = REPLACE(@strInput,' ','-')
    RETURN @strInput
END

GO
/****** Object:  Table [dbo].[AdminLogin]    Script Date: 19/5/2023 11:04:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminLogin](
	[TenDangNhap] [nvarchar](50) NOT NULL,
	[MatKhau] [nvarchar](50) NULL,
	[Quyen] [bit] NOT NULL,
 CONSTRAINT [PK_DangNhap] PRIMARY KEY CLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 19/5/2023 11:04:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[MaChiTietHD] [bigint] IDENTITY(1,1) NOT NULL,
	[MaHang] [nvarchar](50) NOT NULL,
	[SoLuongMua] [int] NOT NULL,
	[MaHoaDon] [bigint] NOT NULL,
	[damua] [bit] NULL,
 CONSTRAINT [PK_ChiTietHoaDon] PRIMARY KEY CLUSTERED 
(
	[MaChiTietHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HangDienTu]    Script Date: 19/5/2023 11:04:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HangDienTu](
	[MaHang] [nvarchar](50) NOT NULL,
	[TenHang] [nvarchar](100) NULL,
	[SoLuong] [bigint] NULL,
	[Gia] [bigint] NULL,
	[MaLoai] [nvarchar](50) NULL,
	[BaoHanh] [nvarchar](50) NULL,
	[Image] [nvarchar](500) NULL,
	[NgayNhap] [datetime] NULL,
	[HangSX] [nvarchar](50) NULL,
 CONSTRAINT [PK_sach] PRIMARY KEY CLUSTERED 
(
	[MaHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 19/5/2023 11:04:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHoaDon] [bigint] IDENTITY(1,1) NOT NULL,
	[MaKhachHang] [bigint] NULL,
	[NgayMua] [datetime] NOT NULL,
	[damua] [bit] NULL,
 CONSTRAINT [PK_hoadon] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 19/5/2023 11:04:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKhachHang] [bigint] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SoDienThoai] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[TenDangNhap] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhuyenMai]    Script Date: 19/5/2023 11:04:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhuyenMai](
	[MaKhuyenMai] [nvarchar](50) NULL,
	[Discount] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiHangDienTu]    Script Date: 19/5/2023 11:04:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiHangDienTu](
	[maloai] [nvarchar](50) NOT NULL,
	[tenloai] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_loai] PRIMARY KEY CLUSTERED 
(
	[maloai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VLichsu]    Script Date: 19/5/2023 11:04:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VLichsu]
AS
SELECT dbo.ChiTietHoaDon.damua, dbo.ChiTietHoaDon.MaHoaDon, dbo.ChiTietHoaDon.SoLuongMua, dbo.ChiTietHoaDon.MaHang, dbo.HoaDon.NgayMua, dbo.KhachHang.TenDangNhap, dbo.KhachHang.MaKhachHang, dbo.HangDienTu.Image, 
                  dbo.HangDienTu.TenHang, dbo.HangDienTu.Gia * dbo.ChiTietHoaDon.SoLuongMua AS ThanhTien
FROM     dbo.ChiTietHoaDon INNER JOIN
                  dbo.HoaDon ON dbo.ChiTietHoaDon.MaHoaDon = dbo.HoaDon.MaHoaDon INNER JOIN
                  dbo.KhachHang ON dbo.HoaDon.MaKhachHang = dbo.KhachHang.MaKhachHang INNER JOIN
                  dbo.HangDienTu ON dbo.ChiTietHoaDon.MaHang = dbo.HangDienTu.MaHang

GO
/****** Object:  View [dbo].[Vxacnhan]    Script Date: 19/5/2023 11:04:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Vxacnhan]
AS
SELECT dbo.ChiTietHoaDon.MaChiTietHD, dbo.HoaDon.MaHoaDon, dbo.KhachHang.HoTen, dbo.HangDienTu.TenHang, dbo.ChiTietHoaDon.SoLuongMua, dbo.HangDienTu.Gia, 
                  dbo.HangDienTu.Gia * dbo.ChiTietHoaDon.SoLuongMua AS ThanhTien, dbo.ChiTietHoaDon.damua
FROM     dbo.ChiTietHoaDon INNER JOIN
                  dbo.HoaDon ON dbo.ChiTietHoaDon.MaHoaDon = dbo.HoaDon.MaHoaDon INNER JOIN
                  dbo.KhachHang ON dbo.HoaDon.MaKhachHang = dbo.KhachHang.MaKhachHang INNER JOIN
                  dbo.HangDienTu ON dbo.ChiTietHoaDon.MaHang = dbo.HangDienTu.MaHang

GO
/****** Object:  View [dbo].[VxacnhanHoaDon]    Script Date: 19/5/2023 11:04:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VxacnhanHoaDon]
AS
SELECT dbo.HoaDon.MaHoaDon, dbo.HoaDon.NgayMua, SUM(dbo.HangDienTu.Gia * dbo.ChiTietHoaDon.SoLuongMua) AS ThanhTien, dbo.KhachHang.HoTen, dbo.ChiTietHoaDon.damua, dbo.ChiTietHoaDon.MaChiTietHD, 
                  dbo.ChiTietHoaDon.MaHang, dbo.ChiTietHoaDon.SoLuongMua
FROM     dbo.ChiTietHoaDon INNER JOIN
                  dbo.HoaDon ON dbo.ChiTietHoaDon.MaHoaDon = dbo.HoaDon.MaHoaDon INNER JOIN
                  dbo.KhachHang ON dbo.HoaDon.MaKhachHang = dbo.KhachHang.MaKhachHang INNER JOIN
                  dbo.HangDienTu ON dbo.ChiTietHoaDon.MaHang = dbo.HangDienTu.MaHang
GROUP BY dbo.HoaDon.MaHoaDon, dbo.HoaDon.NgayMua, dbo.KhachHang.HoTen, dbo.ChiTietHoaDon.MaChiTietHD, dbo.ChiTietHoaDon.MaHang, dbo.ChiTietHoaDon.SoLuongMua, dbo.ChiTietHoaDon.damua

GO
INSERT [dbo].[AdminLogin] ([TenDangNhap], [MatKhau], [Quyen]) VALUES (N'1', N'1', 1)
INSERT [dbo].[AdminLogin] ([TenDangNhap], [MatKhau], [Quyen]) VALUES (N'lnk', N'1', 1)
GO
SET IDENTITY_INSERT [dbo].[ChiTietHoaDon] ON 

INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (39, N'acernitro5', 1, 28, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (40, N'acera315', 2, 28, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (41, N'acernitro5', 1, 29, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (42, N'acera315', 2, 29, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (43, N'acernitro5', 1, 30, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (44, N'acera315', 2, 30, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (45, N'acera315', 3, 31, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (46, N'fan2', 3, 31, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (47, N'asusvivobook', 3, 31, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (48, N'acera315', 4, 32, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (49, N'fan2', 3, 32, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (50, N'asusvivobook', 3, 32, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (52, N'acera315', 3, 34, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (53, N'hp2', 1, 34, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (54, N'case3', 3, 37, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (55, N'balo1', 3, 37, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (56, N'gigabytegm', 3, 37, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (58, N'acera315', 1, 38, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (59, N'asusgaming', 3, 39, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (60, N'webcam3', 2, 39, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (62, N'acernitro5', 3, 41, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (63, N'acera315', 2, 41, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (64, N'case1', 1, 42, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (65, N'acernitro5', 4, 43, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (66, N'asusgaming', 1, 43, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (67, N'acera315', 1, 44, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (68, N'acernitro5', 1, 44, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (69, N'mouse1', 1, 44, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (70, N'asusgaming', 4, 45, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (71, N'mouse1', 2, 46, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (72, N'asusgaming', 1, 46, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (73, N'acera315', 2, 47, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (74, N'acernitro5', 3, 47, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (75, N'asusvivobook', 3, 48, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (76, N'acernitro5', 1, 48, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (77, N'balo1', 4, 49, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (78, N'asusgaming', 1, 50, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (79, N'chair3', 55, 51, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (10077, N'acera315', 1, 10049, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (20077, N'acernitro5', 33, 20049, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (20078, N'asusgaming', 2, 20050, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (20079, N'asusvivobook', 2, 20051, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (20080, N'balo1', 1, 20052, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (20081, N'acernitro5', 2, 20052, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (20082, N'case2', 1, 20052, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (20083, N'acernitro5', 33, 20053, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (20084, N'balo1', 12, 20054, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (20085, N'asusgaming', 1, 20055, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (20086, N'case1', 1, 20055, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (20087, N'case2', 1, 20056, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (20088, N'case1', 1, 20056, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (20089, N'acernitro5', 1, 20057, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (20090, N'acera315', 1, 20058, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (20091, N'asusgaming', 1, 20059, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (20092, N'acera315', 1, 20060, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (20093, N'acernitro5', 9, 20061, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (20094, N'acera315', 1, 20062, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (20095, N'acernitro5', 1, 20063, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (20096, N'acera315', 1, 20064, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (20097, N'asusgaming', 1, 20065, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (20098, N'acernitro5', 1, 20065, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (20099, N'asusgaming', 1, 20066, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (20100, N'asusvivobook', 1, 20066, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (20101, N'acera315', 1, 20067, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (30077, N'acernitro5', 3, 30049, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (30078, N'acera315', 1, 30049, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (40077, N'chair1', 1, 40049, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (50077, N'asusgaming', 1, 50049, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (60077, N'acera315', 2, 60049, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (60078, N'acera315', 2, 60050, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (60079, N'acera315', 3, 60051, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (60080, N'acernitro5', 1, 60052, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (60081, N'acernitro5', 1, 60053, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (60082, N'balo3', 1, 60054, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (60083, N'ram2', 1, 60054, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (70077, N'acera315', 1, 70049, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (70078, N'case2', 1, 70049, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (80078, N'fan1', 3, 80050, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (80079, N'fan1', 3, 80051, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (80080, N'balo1', 1, 80052, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (80081, N'acera315', 1, 80052, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (90079, N'balo1', 1, 90051, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (90080, N'acernitro5', 1, 90052, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (100077, N'fan2', 1, 100049, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (100078, N'acera315', 2, 100049, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (100079, N'acera315', 2, 100050, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (110077, N'hp2', 4, 110049, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (110078, N'acernitro5', 1, 110050, 0)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaHang], [SoLuongMua], [MaHoaDon], [damua]) VALUES (120077, N'asusgaming', 1, 120049, 1)
SET IDENTITY_INSERT [dbo].[ChiTietHoaDon] OFF
GO
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'acera315', N'Laptop Acer Aspire 3 A315 59 381F', 3, 3456789, N'laptopvp', N'12 tháng', N'image_gear/acer-aspire-3-a315-59.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'ACER')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'acernitro5', N'Laptop gaming Acer Nitro 555 AN515 45 R86D', 55, 3, N'laptopgaming', N'12 tháng', N'image_gear/acernitro5.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'ACER')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'asusgaming', N'Laptop Gaming Asus Tuf FA506IHRB HN019W', 8, 17990000, N'laptopgaming', N'24 tháng', N'image_gear/asusgm.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'ASUS')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'asusvivobook', N'Laptop ASUS Vivobook 15X OLED A1503ZA L1421W', 15, 18590000, N'laptopgaming', N'12 tháng', N'image_gear/asusvivobook.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'ASUS')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'balo1', N'TOMTOC Lightweight Camping Tralvel - A72-E01X01', 12, 1340000, N'balo', N'12 tháng', N'image_gear/balochongtrom.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'TOMTOC ')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'balo2', N'Tomtoc (USA) 360* Protective Macbook Pro', 690000, 690000, N'balo', N'12 tháng', N'image_gear/balochongsoc.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'TOMTOC ')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'balo3', N'Razer Keyboard Bag V2', 15, 840000, N'balo', N'12 tháng', N'image_gear/razerkeyboard.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'Razer')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'case1', N'Case INWIN N515 Nebula', 3999000, 2, N'case', N'12 thán', N'image_gear/case1.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'InWin')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'case2', N'Case 1st Player Fire Dancing V2-A (4 fan RGB)', 3, 690000, N'case', N'12 tháng', N'image_gear/case2.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'1st Player')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'case3', N'Case Thermaltake View 51 Tempered Glass Snow ARGB Edition', 4, 4790000, N'case', N'12 tháng', N'image_gear/case3.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'Thermaltake')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'chair1', N'Ghế chơi game E-dra Draco EGC2029 LUX', 4, 6999000, N'chair', N'12 tháng', N'image_gear/chair1.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'E-Dra')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'chair2', N'Bàn nâng hạ E-DRA ELT1675 - Gaming Master', 4, 4890000, N'chair', N'12 tháng', N'image_gear/chair2.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'E-Dra')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'chair3', N'Ghế Corsair TC60 Fabric - Black', 4, 3990000, N'chair', N'24 Tháng', N'image_gear/chair3.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'Corsair ')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'cpu1', N'AMD Ryzen 9 7950X', 4, 16590000, N'cpu', N'36 Tháng', N'image_gear/cpu1.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'AMD')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'cpu2', N'Intel Core i9 10900X ', 5, 15490000, N'cpu', N'36 Tháng', N'image_gear/cpu2.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'Intel')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'cpu3', N'AMD Ryzen 9 5900X ', 5, 10690000, N'cpu', N'36 Tháng
', N'image_gear/cpu3.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'AMD')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'dellgm', N'Laptop gaming Dell G15 5520 i7H165W11GR3050T', 7, 35490000, N'laptopgaming', N'12 tháng', N'image_gear/dellgm.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'DELL')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'dellxps13', N'Laptop Dell XPS 13 Plus 9320 5CG56', 20, 57990000, N'laptopvp', N'12 tháng', N'image_gear/dellxps13.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'DELL')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'dl1', N'Ổ cứng SSD Kingston KC2500 250GB PCIe Gen 3.0', 235, 1290000, N'ssd_hdd', N'60 tháng', N'image_gear/dl1.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'Kingston')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'dl2', N'SSD TeamGroup CX2 240GB 2.5" Sata 3', 353, 690000, N'ssd_hdd', N'36 tháng', N'image_gear/dl2.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'TeamGroup')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'dl3', N'SSD GIGABYTE NVMe 512Gb', 235, 1490000, N'ssd_hdd', N'36 tháng', N'image_gear/dl3.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'GIGABYTE')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'fan1', N'Tản nhiệt DEEPCOOL AK620', 5, 1890000, N'fan', N'12 tháng', N'image_gear/fan1.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'Deepcool')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'fan2', N'Keo tản nhiệt NOCTUA NT-H1 10gram', 100, 310000, N'fan', NULL, N'image_gear/fan2.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'Noctua')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'fan3', N'Fan Cooler Master SICKLEFLOW 120 ARGB WHITE EDITION 3 IN 1', 20, 1990000, N'fan', N'12 Tháng', N'image_gear/fan3.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'Cooler Master')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'gigabyte', N'Laptop GIGABYTE U4 UD 70S1823SO', 1, 25390000, N'laptopvp', N'24 tháng', N'image_gear/gigabyte.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'GIGABYTE')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'gigabytegm', N'Laptop gaming GIGABYTE G5 KD 52VN123SO', 7, 26990000, N'laptopgaming', N'12 tháng', N'image_gear/gigabytegm.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'GIGABYTE')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'hp1', N'Tai nghe HyperX Cloud Earbuds Pink', 4, 890000, N'headphone', N'24 Tháng ', N'image_gear/hp1.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'HyperX')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'hp2', N'Tai nghe Logitech G535 LIGHTSPEED Wireless Black', 5, 3290000, N'headphone', N'24 Tháng', N'image_gear/hp2.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'Logitech')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'hp3', N'Tai nghe gaming Rapoo VM700 True Wireless', 10, 1420000, N'headphone', N'24 tháng ', N'image_gear/hp3.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'Rapoo')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'hp4', N'Loa SoundMax A2126', 10, 1540000, N'headphone', N'12 Tháng', N'image_gear/hp4.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'SoundMax ')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'hpenvy13', N'Laptop HP Envy 13 BA1536TU 4U6M5PA', 2, 21900000, N'laptopvp', N'12 tháng', N'image_gear/hpenvy13.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'HP')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'hpgm', N'Laptop Gaming HP VICTUS 16 d0197TX 4R0T9PA', 6, 36900000, N'laptopgaming', N'24 tháng', N'image_gear/hpgm.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'HP')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'kb1', N'Bàn phím cơ AKKO PC98B Plus Black Gold', 5, 3090000, N'keyboard', N'12 Tháng', N'image_gear/kb1.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'Akko')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'kb2', N'Bàn phím Leopold FC660R Bluetooth Sweden White Case', 4, 3050000, N'keyboard', N'24 Tháng', N'image_gear/kb2.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'Leopold')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'kb3', N'Bàn phím Logitech K120 (chuyên văn phòng)', 10, 170000, N'keyboard', N'36 tháng', N'image_gear/kb3.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'Logitech')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'led1', N'Bộ LED dây thông minh Wi-Fi Tapo L920-5', 14, 699000, N'led', N'24 Tháng', N'image_gear/led1.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'TP- Link')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'led2', N'Đèn Led trang trí Govee Neon LED Strip Light - H61A0', 4, 4368000, N'led', N'12 tháng', N'image_gear/led2.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'Govee')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'led3', N'Bộ LED dây thông minh Wi-Fi Tapo L900-5', 14, 499000, N'led', N'24 Tháng', N'image_gear/led3.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'TP- Link')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'lenovogm', N'Lenovo IdeaPad Gaming 3 15ARH7 82SB007MVN', 6, 29790000, N'laptopgaming', N'12 tháng', N'image_gear/lenovogm.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'LENOVO')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'lenovoscreen', N'Màn hình Lenovo Legion Y25-30 25" IPS 240Hz G-Sync 1ms', 2, 7890000, N'screen', N'36 tháng', N'image_gear/lenovoscreen.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'LENOVO')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'lenovov14', N'Laptop Lenovo V14 G2 ITL 82KA00RRVN', 8, 10990000, N'laptopvp', N'12 tháng', N'image_gear/lenovov14.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'LENOVO')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'mouse1', N'Chuột Logitech G502 X Plus LightSpeed White', 56, 3890000, N'mouse', N'24 tháng', N'image_gear/mouse1.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'Logitech')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'mouse2', N'Chuột Logitech POP with Emoji Button Blast Yellow', 123, 590000, N'mouse', N'24 Tháng', N'image_gear/mouse2.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'Logitech')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'mouse3', N'Chuột Razer Viper Ultimate Wireless', 12, 2290000, N'mouse', N'24 tháng', N'image_gear/mouse3.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'Razer')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'msigm', N'Laptop gaming MSI GF63 Thin 11UD 473VN', 8, 18490000, N'laptopgaming', N'12 tháng', N'image_gear/msigm.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'MSI')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'msimodern14', N'Laptop MSI Modern 14 B11MOU 1030VN', 10, 9999000, N'laptopvp', N'12 tháng', N'image_gear/msimodern14.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'MSI')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'msisc', N'Màn hình MSI OPTIX G242 24" IPS 144Hz chuyên game', 3, 6050000, N'screen', N'24 tháng', N'image_gear/msisc.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'MSI')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'psu1', N'( 650W ) Nguồn SilverStone ST65F-ES230 - 80 Plus', 5, 1480000, N'psu', N' 36 Tháng', N'image_gear/psu1.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N' SliverStone ')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'psu2', N'( 750W ) Nguồn CoolerMaster MWE 750 BRONZE - V2 230V', 12, 1890000, N'psu', N'60 Tháng', N'image_gear/psu2.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'Cooler Master ')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'psu3', N'FSP Dagger Pro 650W SFX - 80 Plus Gold - Full Modular', 513, 2790000, N'psu', N'60 tháng', N'image_gear/psu3.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'FSP')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'r1', N'Bộ định tuyến WiFi 6 ASUS RT-AX56U Wifi Chuẩn AX1800', 123, 2999000, N'network', N'36 tháng', N'image_gear/r1.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N' Asus')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'r2', N'USB thu sóng WiFi 5 ASUS USB-AC53 Chuẩn AC1200', 123, 750000, N'network', N'36 tháng', N'image_gear/r2.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N' Asus')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'r3', N'Card mạng PCIe WiFi 5 MSI HERALD-AC INTEL AC8265 Wi-Fi', 1234, 400000, N'network', N'12 tháng', N'image_gear/r3.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N' MSI')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'ram1', N'RAM G.Skill Trident Z5 RGB 32GB (2x16GB) 5600 DDR5 Silver', 235, 7990000, N'ram', N'36 tháng', N'image_gear/ram1.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'G.Skill')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'ram2', N'Ram Corsair Dominator Platinum 16GB (2x8GB) RGB 3200 ', 235, 4090000, N'ram', N'36 Tháng', N'image_gear/ram2.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'CORSAIR')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'ram3', N'RAM Gigabyte Aorus RGB Memory 32GB (2x16GB) 6000 DDR5
', 235, 11990000, N'ram', N'36 tháng', N'image_gear/ram3.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'Gigabyte')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'samsungscreen', N'Màn hình cong SAMSUNG QLED LC49G95 49" VA 2K 240Hz Gsync', 3, 27940000, N'screen', N'24 tháng', N'image_gear/samsungscreen.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'SAMSUNG')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'vga1', N'ASROCK Radeon RX 6600 Challenger D 8GB', 66, 12990000, N'vga', N'36 Tháng', N'image_gear/vga1.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N' ASROCK')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'vga2', N'ASUS Dual GeForce RTX 2060 OC EVO 6GB GDDR6', 453, 3290000, N'vga', N'36 tháng', N'image_gear/vga2.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'ASUS')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'vga3', N'ASUS ROG Strix GeForce RTX 3050 8GB', 123, 8690000, N'vga', N'36 Tháng', N'image_gear/vga3.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'ASUS')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'viewsonicsc', N'ViewSonic VX3418-2KPC 34" 2K 144Hz', 5, 9790000, N'screen', N'24 tháng', N'image_gear/viewsonicsc.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'VIEWSONIC')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'webcam1', N'Webcam Rapoo C200 HD 720p', 123123, 590000, N'webcam', N'24 Tháng', N'image_gear/webcam1.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N' Rapoo')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'webcam2', N'Webcam Razer Kiyo Pro', 75, 5890000, N'webcam', N'12 Tháng', N'image_gear/webcam2.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'Razer')
INSERT [dbo].[HangDienTu] ([MaHang], [TenHang], [SoLuong], [Gia], [MaLoai], [BaoHanh], [Image], [NgayNhap], [HangSX]) VALUES (N'webcam3', N'Webcam Razer Kiyo', 75785, 2590000, N'webcam', N'12 tháng', N'image_gear/webcam3.png', CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'Razer')
GO
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (28, 44, CAST(N'2022-12-17T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (29, 44, CAST(N'2022-12-17T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (30, 44, CAST(N'2022-12-17T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (31, 44, CAST(N'2022-12-17T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (32, 44, CAST(N'2022-12-17T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (33, 44, CAST(N'2022-12-17T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (34, 43, CAST(N'2022-12-17T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (35, 43, CAST(N'2022-12-18T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (36, 43, CAST(N'2022-12-18T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (37, 43, CAST(N'2022-12-18T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (38, 43, CAST(N'2022-12-19T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (39, 43, CAST(N'2022-12-20T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (40, 43, CAST(N'2022-12-20T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (41, 43, CAST(N'2022-12-21T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (42, 43, CAST(N'2022-12-21T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (43, 43, CAST(N'2022-12-21T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (44, 43, CAST(N'2022-12-21T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (45, 43, CAST(N'2022-12-21T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (46, 43, CAST(N'2022-12-21T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (47, 43, CAST(N'2022-12-21T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (48, 43, CAST(N'2022-12-21T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (49, 43, CAST(N'2023-02-09T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (50, 43, CAST(N'2023-02-09T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (51, 43, CAST(N'2023-02-09T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (10049, 43, CAST(N'2023-02-19T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (20049, 43, CAST(N'2023-02-23T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (20050, 43, CAST(N'2023-02-23T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (20051, 43, CAST(N'2023-02-23T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (20052, 43, CAST(N'2023-02-23T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (20053, 43, CAST(N'2023-02-23T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (20054, 43, CAST(N'2023-02-23T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (20055, 43, CAST(N'2023-02-23T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (20056, 43, CAST(N'2023-02-23T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (20057, 43, CAST(N'2023-02-23T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (20058, 43, CAST(N'2023-02-23T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (20059, 43, CAST(N'2023-02-23T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (20060, 43, CAST(N'2023-02-23T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (20061, 43, CAST(N'2023-02-23T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (20062, 43, CAST(N'2023-02-23T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (20063, 43, CAST(N'2023-02-23T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (20064, 43, CAST(N'2023-02-23T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (20065, 43, CAST(N'2023-02-23T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (20066, 43, CAST(N'2023-02-23T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (20067, 43, CAST(N'2023-02-23T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (30049, 43, CAST(N'2023-02-25T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (40049, 43, CAST(N'2023-03-16T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (50049, 43, CAST(N'2023-04-07T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (60049, 43, CAST(N'2023-04-22T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (60050, 46, CAST(N'2023-04-22T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (60051, 43, CAST(N'2023-04-22T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (60052, 46, CAST(N'2023-04-22T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (60053, 43, CAST(N'2023-04-22T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (60054, 43, CAST(N'2023-04-22T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (70049, 46, CAST(N'2023-04-24T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (80049, 46, CAST(N'2023-04-28T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (80050, 43, CAST(N'2023-04-28T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (80051, 43, CAST(N'2023-04-28T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (80052, 46, CAST(N'2023-04-28T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (90049, 46, CAST(N'2023-05-03T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (90050, 46, CAST(N'2023-05-03T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (90051, 46, CAST(N'2023-05-03T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (90052, 46, CAST(N'2023-05-03T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (100049, 43, CAST(N'2023-05-04T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (100050, 43, CAST(N'2023-05-05T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (100051, 43, CAST(N'2023-05-05T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (110049, 46, CAST(N'2023-05-11T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (110050, 46, CAST(N'2023-05-11T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayMua], [damua]) VALUES (120049, 43, CAST(N'2023-05-19T00:00:00.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [DiaChi], [SoDienThoai], [Email], [TenDangNhap], [MatKhau]) VALUES (41, N'Lê Ngọc Kiên', N'Huế', N'0123456789', N'lnk@gmail.com', N'kine1609', N'kine1609')
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [DiaChi], [SoDienThoai], [Email], [TenDangNhap], [MatKhau]) VALUES (43, N'Le Ngoc Kien', N'Thua Thien Hue', N'0987456123', N'lengockienphuvang@gmail.com', N'1', N'1')
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [DiaChi], [SoDienThoai], [Email], [TenDangNhap], [MatKhau]) VALUES (44, N'Le Viet Phop', N'Phu Vang', N'0123456789', N'Phopnonhand@gmail.com', N'2', N'2')
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [DiaChi], [SoDienThoai], [Email], [TenDangNhap], [MatKhau]) VALUES (46, N'LVP', NULL, NULL, N'anhphop1@gmail.com', N'hahana8', N'1')
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [DiaChi], [SoDienThoai], [Email], [TenDangNhap], [MatKhau]) VALUES (10047, N'lê viết phốp', N'kế sung, huế', N'0853666655', N'phop1@gmail.com', N'lvp1', N'lvp1')
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
INSERT [dbo].[KhuyenMai] ([MaKhuyenMai], [Discount]) VALUES (N'KMLT001', 5)
INSERT [dbo].[KhuyenMai] ([MaKhuyenMai], [Discount]) VALUES (N'KMLTXin', 20)
GO
INSERT [dbo].[LoaiHangDienTu] ([maloai], [tenloai]) VALUES (N'1', N'1')
INSERT [dbo].[LoaiHangDienTu] ([maloai], [tenloai]) VALUES (N'balo', N'Balo & túi sách')
INSERT [dbo].[LoaiHangDienTu] ([maloai], [tenloai]) VALUES (N'case', N'Vỏ máy tính')
INSERT [dbo].[LoaiHangDienTu] ([maloai], [tenloai]) VALUES (N'chair', N'Ghế')
INSERT [dbo].[LoaiHangDienTu] ([maloai], [tenloai]) VALUES (N'cpu', N'Bộ vi xử lý')
INSERT [dbo].[LoaiHangDienTu] ([maloai], [tenloai]) VALUES (N'fan', N'Tản nhiệt')
INSERT [dbo].[LoaiHangDienTu] ([maloai], [tenloai]) VALUES (N'HDMI', N'HDMI')
INSERT [dbo].[LoaiHangDienTu] ([maloai], [tenloai]) VALUES (N'headphone', N'Tai nghe - Loa')
INSERT [dbo].[LoaiHangDienTu] ([maloai], [tenloai]) VALUES (N'keyboard', N'Bàn phím')
INSERT [dbo].[LoaiHangDienTu] ([maloai], [tenloai]) VALUES (N'laptopgaming', N'Laptop Gaming')
INSERT [dbo].[LoaiHangDienTu] ([maloai], [tenloai]) VALUES (N'laptopvp', N'Laptop văn phòng')
INSERT [dbo].[LoaiHangDienTu] ([maloai], [tenloai]) VALUES (N'led', N'Đèn Led trang trí')
INSERT [dbo].[LoaiHangDienTu] ([maloai], [tenloai]) VALUES (N'mouse', N'Chuột')
INSERT [dbo].[LoaiHangDienTu] ([maloai], [tenloai]) VALUES (N'network', N'Router Wifi')
INSERT [dbo].[LoaiHangDienTu] ([maloai], [tenloai]) VALUES (N'psu', N'Nguồn máy tính')
INSERT [dbo].[LoaiHangDienTu] ([maloai], [tenloai]) VALUES (N'ram', N'Bộ nhớ trong')
INSERT [dbo].[LoaiHangDienTu] ([maloai], [tenloai]) VALUES (N'screen', N'Màn hình')
INSERT [dbo].[LoaiHangDienTu] ([maloai], [tenloai]) VALUES (N'ssd_hdd', N'Lưu trữ SSD_HDD')
INSERT [dbo].[LoaiHangDienTu] ([maloai], [tenloai]) VALUES (N'vga', N'Card màn hình')
INSERT [dbo].[LoaiHangDienTu] ([maloai], [tenloai]) VALUES (N'webcam', N'Webcam')
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_hoadon] FOREIGN KEY([MaHoaDon])
REFERENCES [dbo].[HoaDon] ([MaHoaDon])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_hoadon]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_sach] FOREIGN KEY([MaHang])
REFERENCES [dbo].[HangDienTu] ([MaHang])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_sach]
GO
ALTER TABLE [dbo].[HangDienTu]  WITH CHECK ADD  CONSTRAINT [FK_sach_loai] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[LoaiHangDienTu] ([maloai])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HangDienTu] CHECK CONSTRAINT [FK_sach_loai]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_hoadon_KhachHang] FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[KhachHang] ([MaKhachHang])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_hoadon_KhachHang]
GO
/****** Object:  StoredProcedure [dbo].[TimKiem]    Script Date: 19/5/2023 11:04:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[TimKiem](@bien nvarchar(5))
as
  select * from sach where maloai =@bien


GO
/****** Object:  StoredProcedure [dbo].[TimMaLoai]    Script Date: 19/5/2023 11:04:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[TimMaLoai]( @maloai nvarchar(50))
as
select * from sach where maloai=@maloai


GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ChiTietHoaDon"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 257
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HoaDon"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 170
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "KhachHang"
            Begin Extent = 
               Top = 7
               Left = 532
               Bottom = 293
               Right = 726
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HangDienTu"
            Begin Extent = 
               Top = 7
               Left = 774
               Bottom = 259
               Right = 968
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VLichsu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VLichsu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ChiTietHoaDon"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "HoaDon"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 170
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "KhachHang"
            Begin Extent = 
               Top = 7
               Left = 532
               Bottom = 170
               Right = 726
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HangDienTu"
            Begin Extent = 
               Top = 7
               Left = 774
               Bottom = 170
               Right = 968
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vxacnhan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vxacnhan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vxacnhan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ChiTietHoaDon"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 195
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HoaDon"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 170
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "KhachHang"
            Begin Extent = 
               Top = 7
               Left = 532
               Bottom = 170
               Right = 726
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HangDienTu"
            Begin Extent = 
               Top = 7
               Left = 774
               Bottom = 170
               Right = 968
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VxacnhanHoaDon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VxacnhanHoaDon'
GO
USE [master]
GO
ALTER DATABASE [LeVietPhop_DoAn] SET  READ_WRITE 
GO
