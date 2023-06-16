USE [master]
GO
/****** Object:  Database [SatayimSanaDB]    Script Date: 14.06.2023 13:58:21 ******/
CREATE DATABASE [SatayimSanaDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SatayimSanaDB', FILENAME = N'C:\Users\taham\SatayimSanaDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SatayimSanaDB_log', FILENAME = N'C:\Users\taham\SatayimSanaDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SatayimSanaDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SatayimSanaDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SatayimSanaDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SatayimSanaDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SatayimSanaDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SatayimSanaDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SatayimSanaDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SatayimSanaDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SatayimSanaDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SatayimSanaDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SatayimSanaDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SatayimSanaDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SatayimSanaDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SatayimSanaDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SatayimSanaDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SatayimSanaDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SatayimSanaDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SatayimSanaDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SatayimSanaDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SatayimSanaDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SatayimSanaDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SatayimSanaDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SatayimSanaDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [SatayimSanaDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SatayimSanaDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SatayimSanaDB] SET  MULTI_USER 
GO
ALTER DATABASE [SatayimSanaDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SatayimSanaDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SatayimSanaDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SatayimSanaDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SatayimSanaDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SatayimSanaDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SatayimSanaDB] SET QUERY_STORE = OFF
GO
USE [SatayimSanaDB]
GO
/****** Object:  Table [dbo].[CategoryFeatureItems]    Script Date: 14.06.2023 13:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryFeatureItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[CategoryFeatureId] [int] NOT NULL,
 CONSTRAINT [PK_CategoryFeatureItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryFeatures]    Script Date: 14.06.2023 13:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryFeatures](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[SubCategoryId] [int] NOT NULL,
 CONSTRAINT [PK_CategoryFeatures] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MainCategories]    Script Date: 14.06.2023 13:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MainCategories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_MainCategories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductFeatures]    Script Date: 14.06.2023 13:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductFeatures](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[FeatureId] [int] NOT NULL,
 CONSTRAINT [PK_ProductFeatures] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 14.06.2023 13:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Describtions] [varchar](250) NOT NULL,
	[Price] [float] NOT NULL,
	[ImageURl] [varchar](100) NOT NULL,
	[SubCategoryId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Situations]    Script Date: 14.06.2023 13:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Situations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Situations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCategories]    Script Date: 14.06.2023 13:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[MainCategoryId] [int] NOT NULL,
 CONSTRAINT [PK_SubCategories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 14.06.2023 13:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Surname] [varchar](50) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[IdentificationNumber] [varchar](11) NOT NULL,
	[Phone] [varchar](11) NOT NULL,
	[Password] [varchar](64) NOT NULL,
	[StatusId] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MainCategories] ON 
GO
INSERT [dbo].[MainCategories] ([Id], [Name]) VALUES (1, N'Elektronik')
GO
INSERT [dbo].[MainCategories] ([Id], [Name]) VALUES (2, N'Moda')
GO
INSERT [dbo].[MainCategories] ([Id], [Name]) VALUES (3, N'Kirtasiye')
GO
INSERT [dbo].[MainCategories] ([Id], [Name]) VALUES (4, N'Oyuncak')
GO
SET IDENTITY_INSERT [dbo].[MainCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[SubCategories] ON 
GO
INSERT [dbo].[SubCategories] ([Id], [Name], [MainCategoryId]) VALUES (1, N'Bilgisayar', 1)
GO
INSERT [dbo].[SubCategories] ([Id], [Name], [MainCategoryId]) VALUES (2, N'Telefon', 1)
GO
INSERT [dbo].[SubCategories] ([Id], [Name], [MainCategoryId]) VALUES (3, N'Kıyafet', 2)
GO
INSERT [dbo].[SubCategories] ([Id], [Name], [MainCategoryId]) VALUES (4, N'Ayakkabı', 2)
GO
INSERT [dbo].[SubCategories] ([Id], [Name], [MainCategoryId]) VALUES (5, N'Kalem', 3)
GO
INSERT [dbo].[SubCategories] ([Id], [Name], [MainCategoryId]) VALUES (6, N'Defter', 3)
GO
INSERT [dbo].[SubCategories] ([Id], [Name], [MainCategoryId]) VALUES (7, N'Araba', 4)
GO
INSERT [dbo].[SubCategories] ([Id], [Name], [MainCategoryId]) VALUES (8, N'Top', 4)
GO
SET IDENTITY_INSERT [dbo].[SubCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[CategoryFeatures] ON 
GO
INSERT [dbo].[CategoryFeatures] ([Id], [Name], [SubCategoryId]) VALUES (1, N'CPU', 1)
GO
INSERT [dbo].[CategoryFeatures] ([Id], [Name], [SubCategoryId]) VALUES (2, N'GPU', 1)
GO
INSERT [dbo].[CategoryFeatures] ([Id], [Name], [SubCategoryId]) VALUES (3, N'RAM', 1)
GO
INSERT [dbo].[CategoryFeatures] ([Id], [Name], [SubCategoryId]) VALUES (4, N'Hafıza', 2)
GO
INSERT [dbo].[CategoryFeatures] ([Id], [Name], [SubCategoryId]) VALUES (5, N'Ekran', 2)
GO
INSERT [dbo].[CategoryFeatures] ([Id], [Name], [SubCategoryId]) VALUES (6, N'Marka', 2)
GO
INSERT [dbo].[CategoryFeatures] ([Id], [Name], [SubCategoryId]) VALUES (7, N'Beden', 3)
GO
INSERT [dbo].[CategoryFeatures] ([Id], [Name], [SubCategoryId]) VALUES (8, N'Renk', 3)
GO
INSERT [dbo].[CategoryFeatures] ([Id], [Name], [SubCategoryId]) VALUES (9, N'Tur', 4)
GO
INSERT [dbo].[CategoryFeatures] ([Id], [Name], [SubCategoryId]) VALUES (10, N'Topuk', 4)
GO
INSERT [dbo].[CategoryFeatures] ([Id], [Name], [SubCategoryId]) VALUES (11, N'Uç', 5)
GO
INSERT [dbo].[CategoryFeatures] ([Id], [Name], [SubCategoryId]) VALUES (12, N'Renk', 5)
GO
INSERT [dbo].[CategoryFeatures] ([Id], [Name], [SubCategoryId]) VALUES (13, N'Sayfa Sayisi', 6)
GO
INSERT [dbo].[CategoryFeatures] ([Id], [Name], [SubCategoryId]) VALUES (14, N'Tip', 6)
GO
INSERT [dbo].[CategoryFeatures] ([Id], [Name], [SubCategoryId]) VALUES (15, N'Kullanis', 7)
GO
INSERT [dbo].[CategoryFeatures] ([Id], [Name], [SubCategoryId]) VALUES (16, N'Boyut', 7)
GO
INSERT [dbo].[CategoryFeatures] ([Id], [Name], [SubCategoryId]) VALUES (17, N'Alan', 8)
GO
SET IDENTITY_INSERT [dbo].[CategoryFeatures] OFF
GO
SET IDENTITY_INSERT [dbo].[CategoryFeatureItems] ON 
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (1, N'Intel i3', 1)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (2, N'Intel i5', 1)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (3, N'Intel i7', 1)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (4, N'Intel i9', 1)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (5, N'Amd 1', 1)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (6, N'Amd 2', 1)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (7, N'Amd 3', 1)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (8, N'Amd 4', 1)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (9, N'Amd 1', 2)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (10, N'Amd 2', 2)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (11, N'Amd 3', 2)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (12, N'Amd 4', 2)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (13, N'Nvidia 4050', 2)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (14, N'Nvidia 4060', 2)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (15, N'Nvidia 4070', 2)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (16, N'Nvidia 4080', 2)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (17, N'Samsung 16 GB', 3)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (18, N'Samsung 32 GB', 3)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (19, N'Samsung 64 GB', 3)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (20, N'Kingston 16 GB', 3)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (21, N'Kingston 32 GB', 3)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (22, N'64 GB', 4)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (23, N'128 GB', 4)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (24, N'256 GB', 4)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (25, N'512 GB', 4)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (26, N'1024 GB', 4)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (27, N'5 INCH', 5)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (28, N'6 INCH', 5)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (29, N'7 INCH', 5)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (30, N'8 INCH', 5)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (31, N'Samsung', 6)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (32, N'IPhone', 6)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (33, N'Huweai', 6)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (34, N'Xioami', 6)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (35, N'XXL', 7)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (36, N'XL', 7)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (37, N'M', 7)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (38, N'XS', 7)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (39, N'XXS', 7)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (40, N'Beyaz', 8)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (41, N'Siyah', 8)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (42, N'Kırmızı', 8)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (43, N'Yeşil', 8)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (44, N'Mavi', 8)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (45, N'Gri', 8)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (46, N'Bot', 9)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (47, N'Sandalet', 9)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (48, N'Terlik', 9)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (49, N'Spor', 9)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (50, N'Çizme', 9)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (51, N'Var 5 CM', 10)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (52, N'Var 10 CM', 10)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (53, N'Var 15 CM', 10)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (54, N'Var 20 CM', 10)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (55, N'YOK', 10)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (56, N'0.9', 11)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (57, N'0.7', 11)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (58, N'0.5', 11)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (59, N'0.3', 11)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (60, N'Beyaz', 12)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (61, N'Siyah', 12)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (62, N'Kırmızı', 12)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (63, N'80', 13)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (64, N'100', 13)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (65, N'120', 13)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (66, N'Kareli', 14)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (67, N'Çizgili', 14)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (68, N'Desensiz', 14)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (69, N'Çek Bırak', 15)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (70, N'Uzaktan Kumandalı', 15)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (71, N'15 CM', 16)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (72, N'50 CM', 16)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (73, N'Basketbol', 17)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (74, N'Futbol', 17)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (75, N'Tenis', 17)
GO
INSERT [dbo].[CategoryFeatureItems] ([Id], [Name], [CategoryFeatureId]) VALUES (76, N'Voleybol', 17)
GO
SET IDENTITY_INSERT [dbo].[CategoryFeatureItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Situations] ON 
GO
INSERT [dbo].[Situations] ([Id], [Name]) VALUES (1, N'Admin')
GO
INSERT [dbo].[Situations] ([Id], [Name]) VALUES (2, N'Satıcı')
GO
INSERT [dbo].[Situations] ([Id], [Name]) VALUES (3, N'Normal')
GO
SET IDENTITY_INSERT [dbo].[Situations] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (1, N'Kullanıcı - 1', N'Soyisim - 1', N'kullanici1@gmail.com', N'40393330608', N'05721757169', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', 1)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (2, N'Kullanıcı - 2', N'Soyisim - 2', N'kullanici2@gmail.com', N'91761781407', N'05504319386', N'd4735e3a265e16eee03f59718b9b5d03019c07d8b6c51f90da3a666eec13ab35', 1)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (3, N'Kullanıcı - 3', N'Soyisim - 3', N'kullanici3@gmail.com', N'52396635650', N'05265595552', N'4e07408562bedb8b60ce05c1decfe3ad16b72230967de01f640b7e4729b49fce', 1)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (4, N'Kullanıcı - 4', N'Soyisim - 4', N'kullanici4@gmail.com', N'38338970816', N'05522467953', N'4b227777d4dd1fc61c6f884f48641d02b4d121d3fd328cb08b5531fcacdabf8a', 1)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (5, N'Kullanıcı - 5', N'Soyisim - 5', N'kullanici5@gmail.com', N'23193359930', N'05689285514', N'ef2d127de37b942baad06145e54b0c619a1f22327b2ebbcfbec78f5564afe39d', 2)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (6, N'Kullanıcı - 6', N'Soyisim - 6', N'kullanici6@gmail.com', N'27491542945', N'05208036372', N'e7f6c011776e8db7cd330b54174fd76f7d0216b612387a5ffcfb81e6f0919683', 2)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (7, N'Kullanıcı - 7', N'Soyisim - 7', N'kullanici7@gmail.com', N'44618285189', N'05521895282', N'7902699be42c8a8e46fbbb4501726517e86b22c56a189f7625a6da49081b2451', 2)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (8, N'Kullanıcı - 8', N'Soyisim - 8', N'kullanici8@gmail.com', N'76674103434', N'05972006349', N'2c624232cdd221771294dfbb310aca000a0df6ac8b66b696d90ef06fdefb64a3', 2)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (9, N'Kullanıcı - 9', N'Soyisim - 9', N'kullanici9@gmail.com', N'46268386454', N'05115738968', N'19581e27de7ced00ff1ce50b2047e7a567c76b1cbaebabe5ef03f7c3017bb5b7', 2)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (10, N'Kullanıcı - 10', N'Soyisim - 10', N'kullanici10@gmail.com', N'36345841253', N'05968192980', N'4a44dc15364204a80fe80e9039455cc1608281820fe2b24f1e5233ade6af1dd5', 2)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (11, N'Kullanıcı - 11', N'Soyisim - 11', N'kullanici11@gmail.com', N'50861049228', N'05464394345', N'4fc82b26aecb47d2868c4efbe3581732a3e7cbcc6c2efb32062c08170a05eeb8', 2)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (12, N'Kullanıcı - 12', N'Soyisim - 12', N'kullanici12@gmail.com', N'63162122120', N'05694764670', N'6b51d431df5d7f141cbececcf79edf3dd861c3b4069f0b11661a3eefacbba918', 2)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (13, N'Kullanıcı - 13', N'Soyisim - 13', N'kullanici13@gmail.com', N'67577014844', N'06002307354', N'3fdba35f04dc8c462986c992bcf875546257113072a909c162f7e470e581e278', 2)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (14, N'Kullanıcı - 14', N'Soyisim - 14', N'kullanici14@gmail.com', N'24612814599', N'05009362554', N'8527a891e224136950ff32ca212b45bc93f69fbb801c3b1ebedac52775f99e61', 2)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (15, N'Kullanıcı - 15', N'Soyisim - 15', N'kullanici15@gmail.com', N'28977570343', N'05014316696', N'e629fa6598d732768f7c726b4b621285f9c3b85303900aa912017db7617d8bdb', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (16, N'Kullanıcı - 16', N'Soyisim - 16', N'kullanici16@gmail.com', N'28181524597', N'05388462437', N'b17ef6d19c7a5b1ee83b907c595526dcb1eb06db8227d650d5dda0a9f4ce8cd9', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (17, N'Kullanıcı - 17', N'Soyisim - 17', N'kullanici17@gmail.com', N'60325358252', N'05026683017', N'4523540f1504cd17100c4835e85b7eefd49911580f8efff0599a8f283be6b9e3', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (18, N'Kullanıcı - 18', N'Soyisim - 18', N'kullanici18@gmail.com', N'60216515210', N'05182716177', N'4ec9599fc203d176a301536c2e091a19bc852759b255bd6818810a42c5fed14a', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (19, N'Kullanıcı - 19', N'Soyisim - 19', N'kullanici19@gmail.com', N'45102428804', N'05338971327', N'9400f1b21cb527d7fa3d3eabba93557a18ebe7a2ca4e471cfe5e4c5b4ca7f767', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (20, N'Kullanıcı - 20', N'Soyisim - 20', N'kullanici20@gmail.com', N'66843175359', N'05652183662', N'f5ca38f748a1d6eaf726b8a42fb575c3c71f1864a8143301782de13da2d9202b', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (21, N'Kullanıcı - 21', N'Soyisim - 21', N'kullanici21@gmail.com', N'48815698495', N'05394664798', N'6f4b6612125fb3a0daecd2799dfd6c9c299424fd920f9b308110a2c1fbd8f443', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (22, N'Kullanıcı - 22', N'Soyisim - 22', N'kullanici22@gmail.com', N'41897326498', N'05969249698', N'785f3ec7eb32f30b90cd0fcf3657d388b5ff4297f2f9716ff66e9b69c05ddd09', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (23, N'Kullanıcı - 23', N'Soyisim - 23', N'kullanici23@gmail.com', N'40068353780', N'05596067961', N'535fa30d7e25dd8a49f1536779734ec8286108d115da5045d77f3b4185d8f790', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (24, N'Kullanıcı - 24', N'Soyisim - 24', N'kullanici24@gmail.com', N'49222393637', N'05192412142', N'c2356069e9d1e79ca924378153cfbbfb4d4416b1f99d41a2940bfdb66c5319db', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (25, N'Kullanıcı - 25', N'Soyisim - 25', N'kullanici25@gmail.com', N'64225841463', N'05044001658', N'b7a56873cd771f2c446d369b649430b65a756ba278ff97ec81bb6f55b2e73569', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (26, N'Kullanıcı - 26', N'Soyisim - 26', N'kullanici26@gmail.com', N'27513559333', N'05987653044', N'5f9c4ab08cac7457e9111a30e4664920607ea2c115a1433d7be98e97e64244ca', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (27, N'Kullanıcı - 27', N'Soyisim - 27', N'kullanici27@gmail.com', N'37169441949', N'05062068219', N'670671cd97404156226e507973f2ab8330d3022ca96e0c93bdbdb320c41adcaf', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (28, N'Kullanıcı - 28', N'Soyisim - 28', N'kullanici28@gmail.com', N'94839729792', N'05165808958', N'59e19706d51d39f66711c2653cd7eb1291c94d9b55eb14bda74ce4dc636d015a', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (29, N'Kullanıcı - 29', N'Soyisim - 29', N'kullanici29@gmail.com', N'33886126232', N'05817689387', N'35135aaa6cc23891b40cb3f378c53a17a1127210ce60e125ccf03efcfdaec458', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (30, N'Kullanıcı - 30', N'Soyisim - 30', N'kullanici30@gmail.com', N'84807160790', N'05705985073', N'624b60c58c9d8bfb6ff1886c2fd605d2adeb6ea4da576068201b6c6958ce93f4', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (31, N'Kullanıcı - 31', N'Soyisim - 31', N'kullanici31@gmail.com', N'11069596323', N'05526727327', N'eb1e33e8a81b697b75855af6bfcdbcbf7cbbde9f94962ceaec1ed8af21f5a50f', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (32, N'Kullanıcı - 32', N'Soyisim - 32', N'kullanici32@gmail.com', N'26737868965', N'05426842285', N'e29c9c180c6279b0b02abd6a1801c7c04082cf486ec027aa13515e4f3884bb6b', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (33, N'Kullanıcı - 33', N'Soyisim - 33', N'kullanici33@gmail.com', N'22466813755', N'05943166478', N'c6f3ac57944a531490cd39902d0f777715fd005efac9a30622d5f5205e7f6894', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (34, N'Kullanıcı - 34', N'Soyisim - 34', N'kullanici34@gmail.com', N'97976637881', N'05948249813', N'86e50149658661312a9e0b35558d84f6c6d3da797f552a9657fe0558ca40cdef', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (35, N'Kullanıcı - 35', N'Soyisim - 35', N'kullanici35@gmail.com', N'89924635836', N'05483012162', N'9f14025af0065b30e47e23ebb3b491d39ae8ed17d33739e5ff3827ffb3634953', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (36, N'Kullanıcı - 36', N'Soyisim - 36', N'kullanici36@gmail.com', N'89901833296', N'05727763026', N'76a50887d8f1c2e9301755428990ad81479ee21c25b43215cf524541e0503269', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (37, N'Kullanıcı - 37', N'Soyisim - 37', N'kullanici37@gmail.com', N'39747353865', N'05939388354', N'7a61b53701befdae0eeeffaecc73f14e20b537bb0f8b91ad7c2936dc63562b25', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (38, N'Kullanıcı - 38', N'Soyisim - 38', N'kullanici38@gmail.com', N'12189626445', N'05836148441', N'aea92132c4cbeb263e6ac2bf6c183b5d81737f179f21efdc5863739672f0f470', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (39, N'Kullanıcı - 39', N'Soyisim - 39', N'kullanici39@gmail.com', N'58459175232', N'05028194654', N'0b918943df0962bc7a1824c0555a389347b4febdc7cf9d1254406d80ce44e3f9', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (40, N'Kullanıcı - 40', N'Soyisim - 40', N'kullanici40@gmail.com', N'63969585867', N'05946658350', N'd59eced1ded07f84c145592f65bdf854358e009c5cd705f5215bf18697fed103', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (41, N'Kullanıcı - 41', N'Soyisim - 41', N'kullanici41@gmail.com', N'50445381939', N'05657262515', N'3d914f9348c9cc0ff8a79716700b9fcd4d2f3e711608004eb8f138bcba7f14d9', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (42, N'Kullanıcı - 42', N'Soyisim - 42', N'kullanici42@gmail.com', N'52313692561', N'05355957391', N'73475cb40a568e8da8a045ced110137e159f890ac4da883b6b17dc651b3a8049', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (43, N'Kullanıcı - 43', N'Soyisim - 43', N'kullanici43@gmail.com', N'57543132139', N'05882857990', N'44cb730c420480a0477b505ae68af508fb90f96cf0ec54c6ad16949dd427f13a', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (44, N'Kullanıcı - 44', N'Soyisim - 44', N'kullanici44@gmail.com', N'74776509682', N'05854519480', N'71ee45a3c0db9a9865f7313dd3372cf60dca6479d46261f3542eb9346e4a04d6', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (45, N'Kullanıcı - 45', N'Soyisim - 45', N'kullanici45@gmail.com', N'79902309266', N'05456053268', N'811786ad1ae74adfdd20dd0372abaaebc6246e343aebd01da0bfc4c02bf0106c', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (46, N'Kullanıcı - 46', N'Soyisim - 46', N'kullanici46@gmail.com', N'94808590480', N'05582533675', N'25fc0e7096fc653718202dc30b0c580b8ab87eac11a700cba03a7c021bc35b0c', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (47, N'Kullanıcı - 47', N'Soyisim - 47', N'kullanici47@gmail.com', N'28246150288', N'05034236139', N'31489056e0916d59fe3add79e63f095af3ffb81604691f21cad442a85c7be617', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (48, N'Kullanıcı - 48', N'Soyisim - 48', N'kullanici48@gmail.com', N'96442356924', N'05133181083', N'98010bd9270f9b100b6214a21754fd33bdc8d41b2bc9f9dd16ff54d3c34ffd71', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (49, N'Kullanıcı - 49', N'Soyisim - 49', N'kullanici49@gmail.com', N'47997342428', N'05917373913', N'0e17daca5f3e175f448bacace3bc0da47d0655a74c8dd0dc497a3afbdad95f1f', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (50, N'Kullanıcı - 50', N'Soyisim - 50', N'kullanici50@gmail.com', N'53039312509', N'05666268398', N'1a6562590ef19d1045d06c4055742d38288e9e6dcd71ccde5cee80f1d5a774eb', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (51, N'Kullanıcı - 51', N'Soyisim - 51', N'kullanici51@gmail.com', N'64977186796', N'05635645137', N'031b4af5197ec30a926f48cf40e11a7dbc470048a21e4003b7a3c07c5dab1baa', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (52, N'Kullanıcı - 52', N'Soyisim - 52', N'kullanici52@gmail.com', N'49509383957', N'05436153879', N'41cfc0d1f2d127b04555b7246d84019b4d27710a3f3aff6e7764375b1e06e05d', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (53, N'Kullanıcı - 53', N'Soyisim - 53', N'kullanici53@gmail.com', N'38978466955', N'05671954726', N'2858dcd1057d3eae7f7d5f782167e24b61153c01551450a628cee722509f6529', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (54, N'Kullanıcı - 54', N'Soyisim - 54', N'kullanici54@gmail.com', N'38664945693', N'05774113915', N'2fca346db656187102ce806ac732e06a62df0dbb2829e511a770556d398e1a6e', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (55, N'Kullanıcı - 55', N'Soyisim - 55', N'kullanici55@gmail.com', N'33005501424', N'05467019767', N'02d20bbd7e394ad5999a4cebabac9619732c343a4cac99470c03e23ba2bdc2bc', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (56, N'Kullanıcı - 56', N'Soyisim - 56', N'kullanici56@gmail.com', N'36127262366', N'05497532276', N'7688b6ef52555962d008fff894223582c484517cea7da49ee67800adc7fc8866', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (57, N'Kullanıcı - 57', N'Soyisim - 57', N'kullanici57@gmail.com', N'58507030205', N'05472926024', N'c837649cce43f2729138e72cc315207057ac82599a59be72765a477f22d14a54', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (58, N'Kullanıcı - 58', N'Soyisim - 58', N'kullanici58@gmail.com', N'15258636500', N'05427392888', N'6208ef0f7750c111548cf90b6ea1d0d0a66f6bff40dbef07cb45ec436263c7d6', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (59, N'Kullanıcı - 59', N'Soyisim - 59', N'kullanici59@gmail.com', N'42914279532', N'05265018344', N'3e1e967e9b793e908f8eae83c74dba9bcccce6a5535b4b462bd9994537bfe15c', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (60, N'Kullanıcı - 60', N'Soyisim - 60', N'kullanici60@gmail.com', N'81544760645', N'05689038732', N'39fa9ec190eee7b6f4dff1100d6343e10918d044c75eac8f9e9a2596173f80c9', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (61, N'Kullanıcı - 61', N'Soyisim - 61', N'kullanici61@gmail.com', N'69324491503', N'05795579090', N'd029fa3a95e174a19934857f535eb9427d967218a36ea014b70ad704bc6c8d1c', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (62, N'Kullanıcı - 62', N'Soyisim - 62', N'kullanici62@gmail.com', N'57617555364', N'05015384357', N'81b8a03f97e8787c53fe1a86bda042b6f0de9b0ec9c09357e107c99ba4d6948a', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (63, N'Kullanıcı - 63', N'Soyisim - 63', N'kullanici63@gmail.com', N'18157351924', N'05222907054', N'da4ea2a5506f2693eae190d9360a1f31793c98a1adade51d93533a6f520ace1c', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (64, N'Kullanıcı - 64', N'Soyisim - 64', N'kullanici64@gmail.com', N'27407726223', N'05642882958', N'a68b412c4282555f15546cf6e1fc42893b7e07f271557ceb021821098dd66c1b', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (65, N'Kullanıcı - 65', N'Soyisim - 65', N'kullanici65@gmail.com', N'11324682999', N'05128312673', N'108c995b953c8a35561103e2014cf828eb654a99e310f87fab94c2f4b7d2a04f', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (66, N'Kullanıcı - 66', N'Soyisim - 66', N'kullanici66@gmail.com', N'51823358508', N'05867029437', N'3ada92f28b4ceda38562ebf047c6ff05400d4c572352a1142eedfef67d21e662', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (67, N'Kullanıcı - 67', N'Soyisim - 67', N'kullanici67@gmail.com', N'51326011376', N'06006558342', N'49d180ecf56132819571bf39d9b7b342522a2ac6d23c1418d3338251bfe469c8', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (68, N'Kullanıcı - 68', N'Soyisim - 68', N'kullanici68@gmail.com', N'59725697941', N'05569164882', N'a21855da08cb102d1d217c53dc5824a3a795c1c1a44e971bf01ab9da3a2acbbf', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (69, N'Kullanıcı - 69', N'Soyisim - 69', N'kullanici69@gmail.com', N'10087080646', N'05541849531', N'c75cb66ae28d8ebc6eded002c28a8ba0d06d3a78c6b5cbf9b2ade051f0775ac4', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (70, N'Kullanıcı - 70', N'Soyisim - 70', N'kullanici70@gmail.com', N'85882745609', N'05794443192', N'ff5a1ae012afa5d4c889c50ad427aaf545d31a4fac04ffc1c4d03d403ba4250a', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (71, N'Kullanıcı - 71', N'Soyisim - 71', N'kullanici71@gmail.com', N'73152632640', N'06009299131', N'7f2253d7e228b22a08bda1f09c516f6fead81df6536eb02fa991a34bb38d9be8', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (72, N'Kullanıcı - 72', N'Soyisim - 72', N'kullanici72@gmail.com', N'29179307627', N'05112104865', N'8722616204217eddb39e7df969e0698aed8e599ba62ed2de1ce49b03ade0fede', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (73, N'Kullanıcı - 73', N'Soyisim - 73', N'kullanici73@gmail.com', N'12287803737', N'05359124628', N'96061e92f58e4bdcdee73df36183fe3ac64747c81c26f6c83aada8d2aabb1864', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (74, N'Kullanıcı - 74', N'Soyisim - 74', N'kullanici74@gmail.com', N'30014618125', N'05924199996', N'eb624dbe56eb6620ae62080c10a273cab73ae8eca98ab17b731446a31c79393a', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (75, N'Kullanıcı - 75', N'Soyisim - 75', N'kullanici75@gmail.com', N'42197463220', N'05655042011', N'f369cb89fc627e668987007d121ed1eacdc01db9e28f8bb26f358b7d8c4f08ac', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (76, N'Kullanıcı - 76', N'Soyisim - 76', N'kullanici76@gmail.com', N'65229880539', N'05159056233', N'f74efabef12ea619e30b79bddef89cffa9dda494761681ca862cff2871a85980', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (77, N'Kullanıcı - 77', N'Soyisim - 77', N'kullanici77@gmail.com', N'86559492994', N'05511877480', N'a88a7902cb4ef697ba0b6759c50e8c10297ff58f942243de19b984841bfe1f73', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (78, N'Kullanıcı - 78', N'Soyisim - 78', N'kullanici78@gmail.com', N'10135269133', N'05217688449', N'349c41201b62db851192665c504b350ff98c6b45fb62a8a2161f78b6534d8de9', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (79, N'Kullanıcı - 79', N'Soyisim - 79', N'kullanici79@gmail.com', N'50897079602', N'05177831920', N'98a3ab7c340e8a033e7b37b6ef9428751581760af67bbab2b9e05d4964a8874a', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (80, N'Kullanıcı - 80', N'Soyisim - 80', N'kullanici80@gmail.com', N'15345634459', N'05544863295', N'48449a14a4ff7d79bb7a1b6f3d488eba397c36ef25634c111b49baf362511afc', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (81, N'Kullanıcı - 81', N'Soyisim - 81', N'kullanici81@gmail.com', N'14521420190', N'05634284394', N'5316ca1c5ddca8e6ceccfce58f3b8540e540ee22f6180fb89492904051b3d531', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (82, N'Kullanıcı - 82', N'Soyisim - 82', N'kullanici82@gmail.com', N'56686913349', N'05542313730', N'a46e37632fa6ca51a13fe39a567b3c23b28c2f47d8af6be9bd63e030e214ba38', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (83, N'Kullanıcı - 83', N'Soyisim - 83', N'kullanici83@gmail.com', N'91477125314', N'05284795395', N'bbb965ab0c80d6538cf2184babad2a564a010376712012bd07b0af92dcd3097d', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (84, N'Kullanıcı - 84', N'Soyisim - 84', N'kullanici84@gmail.com', N'26441919288', N'05931613026', N'44c8031cb036a7350d8b9b8603af662a4b9cdbd2f96e8d5de5af435c9c35da69', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (85, N'Kullanıcı - 85', N'Soyisim - 85', N'kullanici85@gmail.com', N'93464390337', N'05875347967', N'b4944c6ff08dc6f43da2e9c824669b7d927dd1fa976fadc7b456881f51bf5ccc', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (86, N'Kullanıcı - 86', N'Soyisim - 86', N'kullanici86@gmail.com', N'69136653787', N'05359131454', N'434c9b5ae514646bbd91b50032ca579efec8f22bf0b4aac12e65997c418e0dd6', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (87, N'Kullanıcı - 87', N'Soyisim - 87', N'kullanici87@gmail.com', N'63146807253', N'05834041769', N'bdd2d3af3a5a1213497d4f1f7bfcda898274fe9cb5401bbc0190885664708fc2', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (88, N'Kullanıcı - 88', N'Soyisim - 88', N'kullanici88@gmail.com', N'70948856974', N'05397129797', N'8b940be7fb78aaa6b6567dd7a3987996947460df1c668e698eb92ca77e425349', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (89, N'Kullanıcı - 89', N'Soyisim - 89', N'kullanici89@gmail.com', N'24439711969', N'05143353215', N'cd70bea023f752a0564abb6ed08d42c1440f2e33e29914e55e0be1595e24f45a', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (90, N'Kullanıcı - 90', N'Soyisim - 90', N'kullanici90@gmail.com', N'78344402648', N'05013482623', N'69f59c273b6e669ac32a6dd5e1b2cb63333d8b004f9696447aee2d422ce63763', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (91, N'Kullanıcı - 91', N'Soyisim - 91', N'kullanici91@gmail.com', N'50143300421', N'05689787593', N'1da51b8d8ff98f6a48f80ae79fe3ca6c26e1abb7b7d125259255d6d2b875ea08', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (92, N'Kullanıcı - 92', N'Soyisim - 92', N'kullanici92@gmail.com', N'70319313389', N'05859105656', N'8241649609f88ccd2a0a5b233a07a538ec313ff6adf695aa44a969dbca39f67d', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (93, N'Kullanıcı - 93', N'Soyisim - 93', N'kullanici93@gmail.com', N'37858881742', N'05642867952', N'6e4001871c0cf27c7634ef1dc478408f642410fd3a444e2a88e301f5c4a35a4d', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (94, N'Kullanıcı - 94', N'Soyisim - 94', N'kullanici94@gmail.com', N'70365433139', N'05762302280', N'e3d6c4d4599e00882384ca981ee287ed961fa5f3828e2adb5e9ea890ab0d0525', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (95, N'Kullanıcı - 95', N'Soyisim - 95', N'kullanici95@gmail.com', N'10681796759', N'05658754581', N'ad48ff99415b2f007dc35b7eb553fd1eb35ebfa2f2f308acd9488eeb86f71fa8', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (96, N'Kullanıcı - 96', N'Soyisim - 96', N'kullanici96@gmail.com', N'50893500399', N'05135195839', N'7b1a278f5abe8e9da907fc9c29dfd432d60dc76e17b0fabab659d2a508bc65c4', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (97, N'Kullanıcı - 97', N'Soyisim - 97', N'kullanici97@gmail.com', N'46831141139', N'05643767686', N'd6d824abba4afde81129c71dea75b8100e96338da5f416d2f69088f1960cb091', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (98, N'Kullanıcı - 98', N'Soyisim - 98', N'kullanici98@gmail.com', N'42193132980', N'05186348810', N'29db0c6782dbd5000559ef4d9e953e300e2b479eed26d887ef3f92b921c06a67', 3)
GO
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [IdentificationNumber], [Phone], [Password], [StatusId]) VALUES (99, N'Kullanıcı - 99', N'Soyisim - 99', N'kullanici99@gmail.com', N'74262131432', N'05194908988', N'8c1f1046219ddd216a023f792356ddf127fce372a72ec9b4cdac989ee5b0b455', 3)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (1, N'Ürün - 1', N'Açıklama - 1', 798842, N'https://picsum.photos/200', 6, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (2, N'Ürün - 2', N'Açıklama - 2', 345103, N'https://picsum.photos/200', 6, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (3, N'Ürün - 3', N'Açıklama - 3', 849616, N'https://picsum.photos/200', 7, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (4, N'Ürün - 4', N'Açıklama - 4', 506314, N'https://picsum.photos/200', 8, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (5, N'Ürün - 5', N'Açıklama - 5', 128155, N'https://picsum.photos/200', 3, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (6, N'Ürün - 6', N'Açıklama - 6', 403150, N'https://picsum.photos/200', 3, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (7, N'Ürün - 7', N'Açıklama - 7', 377147, N'https://picsum.photos/200', 4, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (8, N'Ürün - 8', N'Açıklama - 8', 140107, N'https://picsum.photos/200', 4, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (9, N'Ürün - 9', N'Açıklama - 9', 942651, N'https://picsum.photos/200', 5, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (10, N'Ürün - 10', N'Açıklama - 10', 945365, N'https://picsum.photos/200', 8, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (11, N'Ürün - 11', N'Açıklama - 11', 914868, N'https://picsum.photos/200', 6, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (12, N'Ürün - 12', N'Açıklama - 12', 424313, N'https://picsum.photos/200', 8, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (13, N'Ürün - 13', N'Açıklama - 13', 738208, N'https://picsum.photos/200', 6, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (14, N'Ürün - 14', N'Açıklama - 14', 147478, N'https://picsum.photos/200', 3, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (15, N'Ürün - 15', N'Açıklama - 15', 850856, N'https://picsum.photos/200', 6, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (16, N'Ürün - 16', N'Açıklama - 16', 412856, N'https://picsum.photos/200', 2, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (17, N'Ürün - 17', N'Açıklama - 17', 937140, N'https://picsum.photos/200', 3, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (18, N'Ürün - 18', N'Açıklama - 18', 172496, N'https://picsum.photos/200', 6, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (19, N'Ürün - 19', N'Açıklama - 19', 198009, N'https://picsum.photos/200', 2, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (20, N'Ürün - 20', N'Açıklama - 20', 358351, N'https://picsum.photos/200', 6, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (21, N'Ürün - 21', N'Açıklama - 21', 86520, N'https://picsum.photos/200', 3, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (22, N'Ürün - 22', N'Açıklama - 22', 445100, N'https://picsum.photos/200', 7, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (23, N'Ürün - 23', N'Açıklama - 23', 101114, N'https://picsum.photos/200', 1, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (24, N'Ürün - 24', N'Açıklama - 24', 87789, N'https://picsum.photos/200', 1, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (25, N'Ürün - 25', N'Açıklama - 25', 875158, N'https://picsum.photos/200', 4, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (26, N'Ürün - 26', N'Açıklama - 26', 982103, N'https://picsum.photos/200', 1, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (27, N'Ürün - 27', N'Açıklama - 27', 99728, N'https://picsum.photos/200', 2, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (28, N'Ürün - 28', N'Açıklama - 28', 146635, N'https://picsum.photos/200', 7, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (29, N'Ürün - 29', N'Açıklama - 29', 216469, N'https://picsum.photos/200', 3, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (30, N'Ürün - 30', N'Açıklama - 30', 999127, N'https://picsum.photos/200', 4, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (31, N'Ürün - 31', N'Açıklama - 31', 650871, N'https://picsum.photos/200', 6, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (32, N'Ürün - 32', N'Açıklama - 32', 501620, N'https://picsum.photos/200', 1, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (33, N'Ürün - 33', N'Açıklama - 33', 470610, N'https://picsum.photos/200', 2, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (34, N'Ürün - 34', N'Açıklama - 34', 479829, N'https://picsum.photos/200', 2, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (35, N'Ürün - 35', N'Açıklama - 35', 714296, N'https://picsum.photos/200', 3, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (36, N'Ürün - 36', N'Açıklama - 36', 431898, N'https://picsum.photos/200', 2, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (37, N'Ürün - 37', N'Açıklama - 37', 999200, N'https://picsum.photos/200', 7, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (38, N'Ürün - 38', N'Açıklama - 38', 577360, N'https://picsum.photos/200', 1, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (39, N'Ürün - 39', N'Açıklama - 39', 508039, N'https://picsum.photos/200', 4, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (40, N'Ürün - 40', N'Açıklama - 40', 226219, N'https://picsum.photos/200', 8, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (41, N'Ürün - 41', N'Açıklama - 41', 941956, N'https://picsum.photos/200', 3, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (42, N'Ürün - 42', N'Açıklama - 42', 59488, N'https://picsum.photos/200', 7, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (43, N'Ürün - 43', N'Açıklama - 43', 496878, N'https://picsum.photos/200', 2, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (44, N'Ürün - 44', N'Açıklama - 44', 407712, N'https://picsum.photos/200', 4, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (45, N'Ürün - 45', N'Açıklama - 45', 144545, N'https://picsum.photos/200', 5, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (46, N'Ürün - 46', N'Açıklama - 46', 247049, N'https://picsum.photos/200', 6, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (47, N'Ürün - 47', N'Açıklama - 47', 515233, N'https://picsum.photos/200', 5, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (48, N'Ürün - 48', N'Açıklama - 48', 825431, N'https://picsum.photos/200', 6, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (49, N'Ürün - 49', N'Açıklama - 49', 125744, N'https://picsum.photos/200', 4, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (50, N'Ürün - 50', N'Açıklama - 50', 960299, N'https://picsum.photos/200', 8, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (51, N'Ürün - 51', N'Açıklama - 51', 767262, N'https://picsum.photos/200', 6, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (52, N'Ürün - 52', N'Açıklama - 52', 681644, N'https://picsum.photos/200', 1, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (53, N'Ürün - 53', N'Açıklama - 53', 64939, N'https://picsum.photos/200', 6, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (54, N'Ürün - 54', N'Açıklama - 54', 128194, N'https://picsum.photos/200', 7, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (55, N'Ürün - 55', N'Açıklama - 55', 356189, N'https://picsum.photos/200', 6, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (56, N'Ürün - 56', N'Açıklama - 56', 696344, N'https://picsum.photos/200', 4, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (57, N'Ürün - 57', N'Açıklama - 57', 944184, N'https://picsum.photos/200', 2, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (58, N'Ürün - 58', N'Açıklama - 58', 688962, N'https://picsum.photos/200', 3, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (59, N'Ürün - 59', N'Açıklama - 59', 55464, N'https://picsum.photos/200', 6, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (60, N'Ürün - 60', N'Açıklama - 60', 615021, N'https://picsum.photos/200', 2, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (61, N'Ürün - 61', N'Açıklama - 61', 435851, N'https://picsum.photos/200', 4, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (62, N'Ürün - 62', N'Açıklama - 62', 175667, N'https://picsum.photos/200', 3, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (63, N'Ürün - 63', N'Açıklama - 63', 708932, N'https://picsum.photos/200', 2, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (64, N'Ürün - 64', N'Açıklama - 64', 962600, N'https://picsum.photos/200', 1, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (65, N'Ürün - 65', N'Açıklama - 65', 576683, N'https://picsum.photos/200', 8, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (66, N'Ürün - 66', N'Açıklama - 66', 444528, N'https://picsum.photos/200', 8, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (67, N'Ürün - 67', N'Açıklama - 67', 760176, N'https://picsum.photos/200', 1, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (68, N'Ürün - 68', N'Açıklama - 68', 475656, N'https://picsum.photos/200', 6, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (69, N'Ürün - 69', N'Açıklama - 69', 468694, N'https://picsum.photos/200', 5, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (70, N'Ürün - 70', N'Açıklama - 70', 241411, N'https://picsum.photos/200', 2, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (71, N'Ürün - 71', N'Açıklama - 71', 530427, N'https://picsum.photos/200', 1, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (72, N'Ürün - 72', N'Açıklama - 72', 922423, N'https://picsum.photos/200', 4, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (73, N'Ürün - 73', N'Açıklama - 73', 753420, N'https://picsum.photos/200', 2, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (74, N'Ürün - 74', N'Açıklama - 74', 884363, N'https://picsum.photos/200', 5, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (75, N'Ürün - 75', N'Açıklama - 75', 121803, N'https://picsum.photos/200', 6, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (76, N'Ürün - 76', N'Açıklama - 76', 348995, N'https://picsum.photos/200', 2, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (77, N'Ürün - 77', N'Açıklama - 77', 427920, N'https://picsum.photos/200', 5, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (78, N'Ürün - 78', N'Açıklama - 78', 747582, N'https://picsum.photos/200', 1, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (79, N'Ürün - 79', N'Açıklama - 79', 85226, N'https://picsum.photos/200', 5, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (80, N'Ürün - 80', N'Açıklama - 80', 147426, N'https://picsum.photos/200', 2, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (81, N'Ürün - 81', N'Açıklama - 81', 876033, N'https://picsum.photos/200', 8, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (82, N'Ürün - 82', N'Açıklama - 82', 17635, N'https://picsum.photos/200', 1, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (83, N'Ürün - 83', N'Açıklama - 83', 351970, N'https://picsum.photos/200', 8, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (84, N'Ürün - 84', N'Açıklama - 84', 533392, N'https://picsum.photos/200', 2, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (85, N'Ürün - 85', N'Açıklama - 85', 243704, N'https://picsum.photos/200', 8, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (86, N'Ürün - 86', N'Açıklama - 86', 740833, N'https://picsum.photos/200', 1, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (87, N'Ürün - 87', N'Açıklama - 87', 175966, N'https://picsum.photos/200', 8, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (88, N'Ürün - 88', N'Açıklama - 88', 480229, N'https://picsum.photos/200', 7, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (89, N'Ürün - 89', N'Açıklama - 89', 383303, N'https://picsum.photos/200', 6, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (90, N'Ürün - 90', N'Açıklama - 90', 959472, N'https://picsum.photos/200', 7, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (91, N'Ürün - 91', N'Açıklama - 91', 625706, N'https://picsum.photos/200', 8, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (92, N'Ürün - 92', N'Açıklama - 92', 548280, N'https://picsum.photos/200', 1, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (93, N'Ürün - 93', N'Açıklama - 93', 6488, N'https://picsum.photos/200', 7, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (94, N'Ürün - 94', N'Açıklama - 94', 376792, N'https://picsum.photos/200', 1, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (95, N'Ürün - 95', N'Açıklama - 95', 802501, N'https://picsum.photos/200', 7, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (96, N'Ürün - 96', N'Açıklama - 96', 635116, N'https://picsum.photos/200', 7, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (97, N'Ürün - 97', N'Açıklama - 97', 124534, N'https://picsum.photos/200', 7, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (98, N'Ürün - 98', N'Açıklama - 98', 874322, N'https://picsum.photos/200', 1, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (99, N'Ürün - 99', N'Açıklama - 99', 511049, N'https://picsum.photos/200', 8, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (100, N'Ürün - 100', N'Açıklama - 100', 97524, N'https://picsum.photos/200', 5, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (101, N'Ürün - 101', N'Açıklama - 101', 299846, N'https://picsum.photos/200', 6, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (102, N'Ürün - 102', N'Açıklama - 102', 797442, N'https://picsum.photos/200', 2, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (103, N'Ürün - 103', N'Açıklama - 103', 84572, N'https://picsum.photos/200', 5, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (104, N'Ürün - 104', N'Açıklama - 104', 437062, N'https://picsum.photos/200', 3, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (105, N'Ürün - 105', N'Açıklama - 105', 523858, N'https://picsum.photos/200', 4, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (106, N'Ürün - 106', N'Açıklama - 106', 329574, N'https://picsum.photos/200', 8, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (107, N'Ürün - 107', N'Açıklama - 107', 724782, N'https://picsum.photos/200', 7, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (108, N'Ürün - 108', N'Açıklama - 108', 42043, N'https://picsum.photos/200', 5, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (109, N'Ürün - 109', N'Açıklama - 109', 775874, N'https://picsum.photos/200', 4, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (110, N'Ürün - 110', N'Açıklama - 110', 260623, N'https://picsum.photos/200', 1, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (111, N'Ürün - 111', N'Açıklama - 111', 503317, N'https://picsum.photos/200', 8, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (112, N'Ürün - 112', N'Açıklama - 112', 348996, N'https://picsum.photos/200', 2, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (113, N'Ürün - 113', N'Açıklama - 113', 981882, N'https://picsum.photos/200', 1, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (114, N'Ürün - 114', N'Açıklama - 114', 64738, N'https://picsum.photos/200', 1, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (115, N'Ürün - 115', N'Açıklama - 115', 102765, N'https://picsum.photos/200', 7, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (116, N'Ürün - 116', N'Açıklama - 116', 239453, N'https://picsum.photos/200', 5, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (117, N'Ürün - 117', N'Açıklama - 117', 443831, N'https://picsum.photos/200', 5, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (118, N'Ürün - 118', N'Açıklama - 118', 882093, N'https://picsum.photos/200', 1, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (119, N'Ürün - 119', N'Açıklama - 119', 204412, N'https://picsum.photos/200', 6, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (120, N'Ürün - 120', N'Açıklama - 120', 940683, N'https://picsum.photos/200', 1, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (121, N'Ürün - 121', N'Açıklama - 121', 951034, N'https://picsum.photos/200', 2, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (122, N'Ürün - 122', N'Açıklama - 122', 7362, N'https://picsum.photos/200', 2, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (123, N'Ürün - 123', N'Açıklama - 123', 956084, N'https://picsum.photos/200', 2, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (124, N'Ürün - 124', N'Açıklama - 124', 332362, N'https://picsum.photos/200', 7, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (125, N'Ürün - 125', N'Açıklama - 125', 472489, N'https://picsum.photos/200', 1, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (126, N'Ürün - 126', N'Açıklama - 126', 430350, N'https://picsum.photos/200', 2, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (127, N'Ürün - 127', N'Açıklama - 127', 659343, N'https://picsum.photos/200', 8, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (128, N'Ürün - 128', N'Açıklama - 128', 4990, N'https://picsum.photos/200', 1, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (129, N'Ürün - 129', N'Açıklama - 129', 602212, N'https://picsum.photos/200', 5, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (130, N'Ürün - 130', N'Açıklama - 130', 64630, N'https://picsum.photos/200', 7, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (131, N'Ürün - 131', N'Açıklama - 131', 913165, N'https://picsum.photos/200', 1, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (132, N'Ürün - 132', N'Açıklama - 132', 424551, N'https://picsum.photos/200', 8, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (133, N'Ürün - 133', N'Açıklama - 133', 277021, N'https://picsum.photos/200', 7, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (134, N'Ürün - 134', N'Açıklama - 134', 2486, N'https://picsum.photos/200', 2, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (135, N'Ürün - 135', N'Açıklama - 135', 621918, N'https://picsum.photos/200', 6, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (136, N'Ürün - 136', N'Açıklama - 136', 629886, N'https://picsum.photos/200', 6, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (137, N'Ürün - 137', N'Açıklama - 137', 211728, N'https://picsum.photos/200', 1, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (138, N'Ürün - 138', N'Açıklama - 138', 593031, N'https://picsum.photos/200', 8, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (139, N'Ürün - 139', N'Açıklama - 139', 896622, N'https://picsum.photos/200', 4, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (140, N'Ürün - 140', N'Açıklama - 140', 105853, N'https://picsum.photos/200', 4, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (141, N'Ürün - 141', N'Açıklama - 141', 973064, N'https://picsum.photos/200', 8, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (142, N'Ürün - 142', N'Açıklama - 142', 19870, N'https://picsum.photos/200', 6, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (143, N'Ürün - 143', N'Açıklama - 143', 959326, N'https://picsum.photos/200', 4, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (144, N'Ürün - 144', N'Açıklama - 144', 912620, N'https://picsum.photos/200', 8, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (145, N'Ürün - 145', N'Açıklama - 145', 313135, N'https://picsum.photos/200', 1, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (146, N'Ürün - 146', N'Açıklama - 146', 197551, N'https://picsum.photos/200', 2, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (147, N'Ürün - 147', N'Açıklama - 147', 661340, N'https://picsum.photos/200', 2, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (148, N'Ürün - 148', N'Açıklama - 148', 781533, N'https://picsum.photos/200', 6, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (149, N'Ürün - 149', N'Açıklama - 149', 577728, N'https://picsum.photos/200', 7, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (150, N'Ürün - 150', N'Açıklama - 150', 236381, N'https://picsum.photos/200', 1, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (151, N'Ürün - 151', N'Açıklama - 151', 769731, N'https://picsum.photos/200', 2, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (152, N'Ürün - 152', N'Açıklama - 152', 919025, N'https://picsum.photos/200', 1, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (153, N'Ürün - 153', N'Açıklama - 153', 456124, N'https://picsum.photos/200', 3, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (154, N'Ürün - 154', N'Açıklama - 154', 765900, N'https://picsum.photos/200', 2, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (155, N'Ürün - 155', N'Açıklama - 155', 522605, N'https://picsum.photos/200', 4, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (156, N'Ürün - 156', N'Açıklama - 156', 871773, N'https://picsum.photos/200', 5, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (157, N'Ürün - 157', N'Açıklama - 157', 859869, N'https://picsum.photos/200', 3, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (158, N'Ürün - 158', N'Açıklama - 158', 685363, N'https://picsum.photos/200', 4, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (159, N'Ürün - 159', N'Açıklama - 159', 779989, N'https://picsum.photos/200', 5, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (160, N'Ürün - 160', N'Açıklama - 160', 102167, N'https://picsum.photos/200', 5, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (161, N'Ürün - 161', N'Açıklama - 161', 55605, N'https://picsum.photos/200', 1, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (162, N'Ürün - 162', N'Açıklama - 162', 380299, N'https://picsum.photos/200', 8, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (163, N'Ürün - 163', N'Açıklama - 163', 808940, N'https://picsum.photos/200', 4, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (164, N'Ürün - 164', N'Açıklama - 164', 460643, N'https://picsum.photos/200', 6, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (165, N'Ürün - 165', N'Açıklama - 165', 623509, N'https://picsum.photos/200', 2, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (166, N'Ürün - 166', N'Açıklama - 166', 7959, N'https://picsum.photos/200', 8, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (167, N'Ürün - 167', N'Açıklama - 167', 55179, N'https://picsum.photos/200', 2, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (168, N'Ürün - 168', N'Açıklama - 168', 705387, N'https://picsum.photos/200', 2, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (169, N'Ürün - 169', N'Açıklama - 169', 400823, N'https://picsum.photos/200', 7, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (170, N'Ürün - 170', N'Açıklama - 170', 323145, N'https://picsum.photos/200', 7, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (171, N'Ürün - 171', N'Açıklama - 171', 285150, N'https://picsum.photos/200', 8, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (172, N'Ürün - 172', N'Açıklama - 172', 737533, N'https://picsum.photos/200', 5, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (173, N'Ürün - 173', N'Açıklama - 173', 206563, N'https://picsum.photos/200', 2, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (174, N'Ürün - 174', N'Açıklama - 174', 935913, N'https://picsum.photos/200', 2, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (175, N'Ürün - 175', N'Açıklama - 175', 609146, N'https://picsum.photos/200', 8, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (176, N'Ürün - 176', N'Açıklama - 176', 25606, N'https://picsum.photos/200', 2, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (177, N'Ürün - 177', N'Açıklama - 177', 135508, N'https://picsum.photos/200', 8, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (178, N'Ürün - 178', N'Açıklama - 178', 282104, N'https://picsum.photos/200', 7, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (179, N'Ürün - 179', N'Açıklama - 179', 708369, N'https://picsum.photos/200', 7, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (180, N'Ürün - 180', N'Açıklama - 180', 293622, N'https://picsum.photos/200', 3, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (181, N'Ürün - 181', N'Açıklama - 181', 493333, N'https://picsum.photos/200', 7, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (182, N'Ürün - 182', N'Açıklama - 182', 684210, N'https://picsum.photos/200', 7, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (183, N'Ürün - 183', N'Açıklama - 183', 490248, N'https://picsum.photos/200', 1, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (184, N'Ürün - 184', N'Açıklama - 184', 684652, N'https://picsum.photos/200', 2, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (185, N'Ürün - 185', N'Açıklama - 185', 415585, N'https://picsum.photos/200', 5, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (186, N'Ürün - 186', N'Açıklama - 186', 853983, N'https://picsum.photos/200', 1, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (187, N'Ürün - 187', N'Açıklama - 187', 708437, N'https://picsum.photos/200', 6, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (188, N'Ürün - 188', N'Açıklama - 188', 522172, N'https://picsum.photos/200', 7, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (189, N'Ürün - 189', N'Açıklama - 189', 366727, N'https://picsum.photos/200', 8, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (190, N'Ürün - 190', N'Açıklama - 190', 911479, N'https://picsum.photos/200', 3, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (191, N'Ürün - 191', N'Açıklama - 191', 736789, N'https://picsum.photos/200', 8, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (192, N'Ürün - 192', N'Açıklama - 192', 203226, N'https://picsum.photos/200', 1, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (193, N'Ürün - 193', N'Açıklama - 193', 62213, N'https://picsum.photos/200', 6, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (194, N'Ürün - 194', N'Açıklama - 194', 159216, N'https://picsum.photos/200', 4, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (195, N'Ürün - 195', N'Açıklama - 195', 863377, N'https://picsum.photos/200', 8, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (196, N'Ürün - 196', N'Açıklama - 196', 313299, N'https://picsum.photos/200', 4, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (197, N'Ürün - 197', N'Açıklama - 197', 313339, N'https://picsum.photos/200', 2, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (198, N'Ürün - 198', N'Açıklama - 198', 57654, N'https://picsum.photos/200', 1, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (199, N'Ürün - 199', N'Açıklama - 199', 840881, N'https://picsum.photos/200', 7, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (200, N'Ürün - 200', N'Açıklama - 200', 821095, N'https://picsum.photos/200', 3, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (201, N'Ürün - 201', N'Açıklama - 201', 827050, N'https://picsum.photos/200', 5, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (202, N'Ürün - 202', N'Açıklama - 202', 145231, N'https://picsum.photos/200', 5, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (203, N'Ürün - 203', N'Açıklama - 203', 780207, N'https://picsum.photos/200', 1, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (204, N'Ürün - 204', N'Açıklama - 204', 39906, N'https://picsum.photos/200', 1, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (205, N'Ürün - 205', N'Açıklama - 205', 456150, N'https://picsum.photos/200', 2, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (206, N'Ürün - 206', N'Açıklama - 206', 825630, N'https://picsum.photos/200', 4, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (207, N'Ürün - 207', N'Açıklama - 207', 411491, N'https://picsum.photos/200', 5, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (208, N'Ürün - 208', N'Açıklama - 208', 273775, N'https://picsum.photos/200', 4, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (209, N'Ürün - 209', N'Açıklama - 209', 852593, N'https://picsum.photos/200', 6, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (210, N'Ürün - 210', N'Açıklama - 210', 811398, N'https://picsum.photos/200', 8, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (211, N'Ürün - 211', N'Açıklama - 211', 394128, N'https://picsum.photos/200', 3, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (212, N'Ürün - 212', N'Açıklama - 212', 145524, N'https://picsum.photos/200', 5, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (213, N'Ürün - 213', N'Açıklama - 213', 360010, N'https://picsum.photos/200', 2, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (214, N'Ürün - 214', N'Açıklama - 214', 707705, N'https://picsum.photos/200', 1, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (215, N'Ürün - 215', N'Açıklama - 215', 678481, N'https://picsum.photos/200', 5, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (216, N'Ürün - 216', N'Açıklama - 216', 269703, N'https://picsum.photos/200', 2, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (217, N'Ürün - 217', N'Açıklama - 217', 918686, N'https://picsum.photos/200', 6, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (218, N'Ürün - 218', N'Açıklama - 218', 398585, N'https://picsum.photos/200', 6, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (219, N'Ürün - 219', N'Açıklama - 219', 88331, N'https://picsum.photos/200', 6, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (220, N'Ürün - 220', N'Açıklama - 220', 30938, N'https://picsum.photos/200', 1, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (221, N'Ürün - 221', N'Açıklama - 221', 164190, N'https://picsum.photos/200', 5, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (222, N'Ürün - 222', N'Açıklama - 222', 171956, N'https://picsum.photos/200', 3, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (223, N'Ürün - 223', N'Açıklama - 223', 256808, N'https://picsum.photos/200', 2, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (224, N'Ürün - 224', N'Açıklama - 224', 648538, N'https://picsum.photos/200', 7, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (225, N'Ürün - 225', N'Açıklama - 225', 406919, N'https://picsum.photos/200', 3, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (226, N'Ürün - 226', N'Açıklama - 226', 486486, N'https://picsum.photos/200', 5, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (227, N'Ürün - 227', N'Açıklama - 227', 16697, N'https://picsum.photos/200', 1, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (228, N'Ürün - 228', N'Açıklama - 228', 321898, N'https://picsum.photos/200', 1, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (229, N'Ürün - 229', N'Açıklama - 229', 577567, N'https://picsum.photos/200', 4, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (230, N'Ürün - 230', N'Açıklama - 230', 72492, N'https://picsum.photos/200', 5, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (231, N'Ürün - 231', N'Açıklama - 231', 696660, N'https://picsum.photos/200', 7, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (232, N'Ürün - 232', N'Açıklama - 232', 74848, N'https://picsum.photos/200', 6, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (233, N'Ürün - 233', N'Açıklama - 233', 61943, N'https://picsum.photos/200', 7, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (234, N'Ürün - 234', N'Açıklama - 234', 197483, N'https://picsum.photos/200', 4, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (235, N'Ürün - 235', N'Açıklama - 235', 643062, N'https://picsum.photos/200', 6, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (236, N'Ürün - 236', N'Açıklama - 236', 611910, N'https://picsum.photos/200', 8, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (237, N'Ürün - 237', N'Açıklama - 237', 920842, N'https://picsum.photos/200', 5, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (238, N'Ürün - 238', N'Açıklama - 238', 240020, N'https://picsum.photos/200', 4, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (239, N'Ürün - 239', N'Açıklama - 239', 693368, N'https://picsum.photos/200', 1, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (240, N'Ürün - 240', N'Açıklama - 240', 548189, N'https://picsum.photos/200', 3, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (241, N'Ürün - 241', N'Açıklama - 241', 553889, N'https://picsum.photos/200', 3, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (242, N'Ürün - 242', N'Açıklama - 242', 614233, N'https://picsum.photos/200', 3, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (243, N'Ürün - 243', N'Açıklama - 243', 602379, N'https://picsum.photos/200', 1, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (244, N'Ürün - 244', N'Açıklama - 244', 379701, N'https://picsum.photos/200', 8, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (245, N'Ürün - 245', N'Açıklama - 245', 626032, N'https://picsum.photos/200', 6, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (246, N'Ürün - 246', N'Açıklama - 246', 949878, N'https://picsum.photos/200', 1, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (247, N'Ürün - 247', N'Açıklama - 247', 764085, N'https://picsum.photos/200', 3, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (248, N'Ürün - 248', N'Açıklama - 248', 519955, N'https://picsum.photos/200', 6, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (249, N'Ürün - 249', N'Açıklama - 249', 693028, N'https://picsum.photos/200', 5, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (250, N'Ürün - 250', N'Açıklama - 250', 959935, N'https://picsum.photos/200', 2, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (251, N'Ürün - 251', N'Açıklama - 251', 929089, N'https://picsum.photos/200', 6, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (252, N'Ürün - 252', N'Açıklama - 252', 981050, N'https://picsum.photos/200', 6, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (253, N'Ürün - 253', N'Açıklama - 253', 112431, N'https://picsum.photos/200', 5, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (254, N'Ürün - 254', N'Açıklama - 254', 259911, N'https://picsum.photos/200', 4, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (255, N'Ürün - 255', N'Açıklama - 255', 323853, N'https://picsum.photos/200', 6, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (256, N'Ürün - 256', N'Açıklama - 256', 402071, N'https://picsum.photos/200', 5, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (257, N'Ürün - 257', N'Açıklama - 257', 864318, N'https://picsum.photos/200', 7, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (258, N'Ürün - 258', N'Açıklama - 258', 850674, N'https://picsum.photos/200', 7, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (259, N'Ürün - 259', N'Açıklama - 259', 868172, N'https://picsum.photos/200', 8, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (260, N'Ürün - 260', N'Açıklama - 260', 302103, N'https://picsum.photos/200', 3, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (261, N'Ürün - 261', N'Açıklama - 261', 957206, N'https://picsum.photos/200', 6, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (262, N'Ürün - 262', N'Açıklama - 262', 409345, N'https://picsum.photos/200', 7, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (263, N'Ürün - 263', N'Açıklama - 263', 382040, N'https://picsum.photos/200', 4, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (264, N'Ürün - 264', N'Açıklama - 264', 980133, N'https://picsum.photos/200', 8, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (265, N'Ürün - 265', N'Açıklama - 265', 944529, N'https://picsum.photos/200', 2, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (266, N'Ürün - 266', N'Açıklama - 266', 925516, N'https://picsum.photos/200', 4, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (267, N'Ürün - 267', N'Açıklama - 267', 625998, N'https://picsum.photos/200', 2, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (268, N'Ürün - 268', N'Açıklama - 268', 855061, N'https://picsum.photos/200', 3, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (269, N'Ürün - 269', N'Açıklama - 269', 111359, N'https://picsum.photos/200', 3, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (270, N'Ürün - 270', N'Açıklama - 270', 496112, N'https://picsum.photos/200', 4, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (271, N'Ürün - 271', N'Açıklama - 271', 823323, N'https://picsum.photos/200', 5, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (272, N'Ürün - 272', N'Açıklama - 272', 751124, N'https://picsum.photos/200', 3, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (273, N'Ürün - 273', N'Açıklama - 273', 854633, N'https://picsum.photos/200', 5, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (274, N'Ürün - 274', N'Açıklama - 274', 417767, N'https://picsum.photos/200', 6, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (275, N'Ürün - 275', N'Açıklama - 275', 921056, N'https://picsum.photos/200', 3, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (276, N'Ürün - 276', N'Açıklama - 276', 84291, N'https://picsum.photos/200', 5, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (277, N'Ürün - 277', N'Açıklama - 277', 839726, N'https://picsum.photos/200', 2, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (278, N'Ürün - 278', N'Açıklama - 278', 681510, N'https://picsum.photos/200', 6, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (279, N'Ürün - 279', N'Açıklama - 279', 514696, N'https://picsum.photos/200', 1, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (280, N'Ürün - 280', N'Açıklama - 280', 324591, N'https://picsum.photos/200', 5, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (281, N'Ürün - 281', N'Açıklama - 281', 395596, N'https://picsum.photos/200', 8, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (282, N'Ürün - 282', N'Açıklama - 282', 324390, N'https://picsum.photos/200', 3, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (283, N'Ürün - 283', N'Açıklama - 283', 590839, N'https://picsum.photos/200', 1, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (284, N'Ürün - 284', N'Açıklama - 284', 544803, N'https://picsum.photos/200', 5, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (285, N'Ürün - 285', N'Açıklama - 285', 971187, N'https://picsum.photos/200', 7, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (286, N'Ürün - 286', N'Açıklama - 286', 951051, N'https://picsum.photos/200', 2, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (287, N'Ürün - 287', N'Açıklama - 287', 756561, N'https://picsum.photos/200', 4, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (288, N'Ürün - 288', N'Açıklama - 288', 604384, N'https://picsum.photos/200', 2, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (289, N'Ürün - 289', N'Açıklama - 289', 6498, N'https://picsum.photos/200', 2, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (290, N'Ürün - 290', N'Açıklama - 290', 602834, N'https://picsum.photos/200', 5, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (291, N'Ürün - 291', N'Açıklama - 291', 858596, N'https://picsum.photos/200', 6, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (292, N'Ürün - 292', N'Açıklama - 292', 481240, N'https://picsum.photos/200', 4, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (293, N'Ürün - 293', N'Açıklama - 293', 275099, N'https://picsum.photos/200', 4, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (294, N'Ürün - 294', N'Açıklama - 294', 553027, N'https://picsum.photos/200', 3, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (295, N'Ürün - 295', N'Açıklama - 295', 9971, N'https://picsum.photos/200', 4, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (296, N'Ürün - 296', N'Açıklama - 296', 107362, N'https://picsum.photos/200', 3, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (297, N'Ürün - 297', N'Açıklama - 297', 339821, N'https://picsum.photos/200', 7, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (298, N'Ürün - 298', N'Açıklama - 298', 984617, N'https://picsum.photos/200', 1, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (299, N'Ürün - 299', N'Açıklama - 299', 46129, N'https://picsum.photos/200', 1, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (300, N'Ürün - 300', N'Açıklama - 300', 749079, N'https://picsum.photos/200', 8, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (301, N'Ürün - 301', N'Açıklama - 301', 71045, N'https://picsum.photos/200', 7, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (302, N'Ürün - 302', N'Açıklama - 302', 560999, N'https://picsum.photos/200', 7, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (303, N'Ürün - 303', N'Açıklama - 303', 131904, N'https://picsum.photos/200', 1, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (304, N'Ürün - 304', N'Açıklama - 304', 716606, N'https://picsum.photos/200', 2, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (305, N'Ürün - 305', N'Açıklama - 305', 665694, N'https://picsum.photos/200', 6, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (306, N'Ürün - 306', N'Açıklama - 306', 200017, N'https://picsum.photos/200', 1, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (307, N'Ürün - 307', N'Açıklama - 307', 364597, N'https://picsum.photos/200', 2, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (308, N'Ürün - 308', N'Açıklama - 308', 683146, N'https://picsum.photos/200', 3, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (309, N'Ürün - 309', N'Açıklama - 309', 127900, N'https://picsum.photos/200', 3, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (310, N'Ürün - 310', N'Açıklama - 310', 51868, N'https://picsum.photos/200', 8, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (311, N'Ürün - 311', N'Açıklama - 311', 112960, N'https://picsum.photos/200', 4, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (312, N'Ürün - 312', N'Açıklama - 312', 514102, N'https://picsum.photos/200', 1, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (313, N'Ürün - 313', N'Açıklama - 313', 993699, N'https://picsum.photos/200', 3, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (314, N'Ürün - 314', N'Açıklama - 314', 667821, N'https://picsum.photos/200', 8, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (315, N'Ürün - 315', N'Açıklama - 315', 44776, N'https://picsum.photos/200', 2, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (316, N'Ürün - 316', N'Açıklama - 316', 921813, N'https://picsum.photos/200', 2, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (317, N'Ürün - 317', N'Açıklama - 317', 987801, N'https://picsum.photos/200', 2, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (318, N'Ürün - 318', N'Açıklama - 318', 389540, N'https://picsum.photos/200', 7, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (319, N'Ürün - 319', N'Açıklama - 319', 153275, N'https://picsum.photos/200', 4, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (320, N'Ürün - 320', N'Açıklama - 320', 20130, N'https://picsum.photos/200', 3, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (321, N'Ürün - 321', N'Açıklama - 321', 553875, N'https://picsum.photos/200', 2, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (322, N'Ürün - 322', N'Açıklama - 322', 838845, N'https://picsum.photos/200', 6, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (323, N'Ürün - 323', N'Açıklama - 323', 535762, N'https://picsum.photos/200', 3, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (324, N'Ürün - 324', N'Açıklama - 324', 736807, N'https://picsum.photos/200', 3, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (325, N'Ürün - 325', N'Açıklama - 325', 723807, N'https://picsum.photos/200', 8, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (326, N'Ürün - 326', N'Açıklama - 326', 199955, N'https://picsum.photos/200', 7, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (327, N'Ürün - 327', N'Açıklama - 327', 173393, N'https://picsum.photos/200', 4, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (328, N'Ürün - 328', N'Açıklama - 328', 504617, N'https://picsum.photos/200', 2, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (329, N'Ürün - 329', N'Açıklama - 329', 94148, N'https://picsum.photos/200', 5, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (330, N'Ürün - 330', N'Açıklama - 330', 64586, N'https://picsum.photos/200', 2, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (331, N'Ürün - 331', N'Açıklama - 331', 850705, N'https://picsum.photos/200', 7, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (332, N'Ürün - 332', N'Açıklama - 332', 85096, N'https://picsum.photos/200', 8, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (333, N'Ürün - 333', N'Açıklama - 333', 28385, N'https://picsum.photos/200', 8, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (334, N'Ürün - 334', N'Açıklama - 334', 591178, N'https://picsum.photos/200', 5, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (335, N'Ürün - 335', N'Açıklama - 335', 342964, N'https://picsum.photos/200', 2, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (336, N'Ürün - 336', N'Açıklama - 336', 970859, N'https://picsum.photos/200', 1, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (337, N'Ürün - 337', N'Açıklama - 337', 487, N'https://picsum.photos/200', 2, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (338, N'Ürün - 338', N'Açıklama - 338', 94136, N'https://picsum.photos/200', 4, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (339, N'Ürün - 339', N'Açıklama - 339', 331470, N'https://picsum.photos/200', 1, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (340, N'Ürün - 340', N'Açıklama - 340', 183633, N'https://picsum.photos/200', 5, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (341, N'Ürün - 341', N'Açıklama - 341', 299140, N'https://picsum.photos/200', 6, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (342, N'Ürün - 342', N'Açıklama - 342', 774141, N'https://picsum.photos/200', 8, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (343, N'Ürün - 343', N'Açıklama - 343', 852902, N'https://picsum.photos/200', 8, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (344, N'Ürün - 344', N'Açıklama - 344', 906287, N'https://picsum.photos/200', 3, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (345, N'Ürün - 345', N'Açıklama - 345', 554705, N'https://picsum.photos/200', 6, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (346, N'Ürün - 346', N'Açıklama - 346', 290547, N'https://picsum.photos/200', 4, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (347, N'Ürün - 347', N'Açıklama - 347', 842328, N'https://picsum.photos/200', 3, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (348, N'Ürün - 348', N'Açıklama - 348', 903870, N'https://picsum.photos/200', 2, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (349, N'Ürün - 349', N'Açıklama - 349', 14216, N'https://picsum.photos/200', 7, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (350, N'Ürün - 350', N'Açıklama - 350', 184203, N'https://picsum.photos/200', 2, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (351, N'Ürün - 351', N'Açıklama - 351', 991286, N'https://picsum.photos/200', 3, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (352, N'Ürün - 352', N'Açıklama - 352', 216155, N'https://picsum.photos/200', 8, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (353, N'Ürün - 353', N'Açıklama - 353', 65207, N'https://picsum.photos/200', 1, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (354, N'Ürün - 354', N'Açıklama - 354', 299918, N'https://picsum.photos/200', 7, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (355, N'Ürün - 355', N'Açıklama - 355', 360531, N'https://picsum.photos/200', 8, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (356, N'Ürün - 356', N'Açıklama - 356', 365958, N'https://picsum.photos/200', 6, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (357, N'Ürün - 357', N'Açıklama - 357', 514530, N'https://picsum.photos/200', 3, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (358, N'Ürün - 358', N'Açıklama - 358', 77089, N'https://picsum.photos/200', 1, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (359, N'Ürün - 359', N'Açıklama - 359', 453967, N'https://picsum.photos/200', 4, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (360, N'Ürün - 360', N'Açıklama - 360', 505909, N'https://picsum.photos/200', 5, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (361, N'Ürün - 361', N'Açıklama - 361', 371007, N'https://picsum.photos/200', 7, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (362, N'Ürün - 362', N'Açıklama - 362', 552304, N'https://picsum.photos/200', 7, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (363, N'Ürün - 363', N'Açıklama - 363', 457534, N'https://picsum.photos/200', 1, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (364, N'Ürün - 364', N'Açıklama - 364', 427151, N'https://picsum.photos/200', 4, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (365, N'Ürün - 365', N'Açıklama - 365', 15590, N'https://picsum.photos/200', 7, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (366, N'Ürün - 366', N'Açıklama - 366', 539689, N'https://picsum.photos/200', 2, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (367, N'Ürün - 367', N'Açıklama - 367', 588629, N'https://picsum.photos/200', 6, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (368, N'Ürün - 368', N'Açıklama - 368', 148421, N'https://picsum.photos/200', 8, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (369, N'Ürün - 369', N'Açıklama - 369', 294580, N'https://picsum.photos/200', 8, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (370, N'Ürün - 370', N'Açıklama - 370', 900906, N'https://picsum.photos/200', 8, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (371, N'Ürün - 371', N'Açıklama - 371', 666683, N'https://picsum.photos/200', 1, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (372, N'Ürün - 372', N'Açıklama - 372', 186271, N'https://picsum.photos/200', 4, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (373, N'Ürün - 373', N'Açıklama - 373', 154378, N'https://picsum.photos/200', 6, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (374, N'Ürün - 374', N'Açıklama - 374', 135113, N'https://picsum.photos/200', 1, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (375, N'Ürün - 375', N'Açıklama - 375', 166203, N'https://picsum.photos/200', 3, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (376, N'Ürün - 376', N'Açıklama - 376', 308066, N'https://picsum.photos/200', 2, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (377, N'Ürün - 377', N'Açıklama - 377', 714436, N'https://picsum.photos/200', 8, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (378, N'Ürün - 378', N'Açıklama - 378', 151861, N'https://picsum.photos/200', 1, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (379, N'Ürün - 379', N'Açıklama - 379', 389323, N'https://picsum.photos/200', 2, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (380, N'Ürün - 380', N'Açıklama - 380', 267618, N'https://picsum.photos/200', 7, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (381, N'Ürün - 381', N'Açıklama - 381', 547145, N'https://picsum.photos/200', 2, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (382, N'Ürün - 382', N'Açıklama - 382', 166153, N'https://picsum.photos/200', 2, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (383, N'Ürün - 383', N'Açıklama - 383', 636403, N'https://picsum.photos/200', 4, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (384, N'Ürün - 384', N'Açıklama - 384', 233512, N'https://picsum.photos/200', 4, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (385, N'Ürün - 385', N'Açıklama - 385', 196817, N'https://picsum.photos/200', 8, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (386, N'Ürün - 386', N'Açıklama - 386', 187386, N'https://picsum.photos/200', 2, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (387, N'Ürün - 387', N'Açıklama - 387', 242870, N'https://picsum.photos/200', 6, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (388, N'Ürün - 388', N'Açıklama - 388', 116960, N'https://picsum.photos/200', 3, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (389, N'Ürün - 389', N'Açıklama - 389', 286405, N'https://picsum.photos/200', 7, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (390, N'Ürün - 390', N'Açıklama - 390', 624223, N'https://picsum.photos/200', 5, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (391, N'Ürün - 391', N'Açıklama - 391', 350829, N'https://picsum.photos/200', 3, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (392, N'Ürün - 392', N'Açıklama - 392', 293887, N'https://picsum.photos/200', 4, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (393, N'Ürün - 393', N'Açıklama - 393', 346438, N'https://picsum.photos/200', 1, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (394, N'Ürün - 394', N'Açıklama - 394', 107655, N'https://picsum.photos/200', 6, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (395, N'Ürün - 395', N'Açıklama - 395', 705813, N'https://picsum.photos/200', 2, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (396, N'Ürün - 396', N'Açıklama - 396', 96751, N'https://picsum.photos/200', 1, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (397, N'Ürün - 397', N'Açıklama - 397', 352762, N'https://picsum.photos/200', 5, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (398, N'Ürün - 398', N'Açıklama - 398', 890892, N'https://picsum.photos/200', 8, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (399, N'Ürün - 399', N'Açıklama - 399', 781529, N'https://picsum.photos/200', 2, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (400, N'Ürün - 400', N'Açıklama - 400', 843668, N'https://picsum.photos/200', 8, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (401, N'Ürün - 401', N'Açıklama - 401', 114193, N'https://picsum.photos/200', 5, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (402, N'Ürün - 402', N'Açıklama - 402', 454316, N'https://picsum.photos/200', 5, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (403, N'Ürün - 403', N'Açıklama - 403', 64540, N'https://picsum.photos/200', 8, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (404, N'Ürün - 404', N'Açıklama - 404', 426138, N'https://picsum.photos/200', 3, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (405, N'Ürün - 405', N'Açıklama - 405', 341424, N'https://picsum.photos/200', 3, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (406, N'Ürün - 406', N'Açıklama - 406', 458533, N'https://picsum.photos/200', 6, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (407, N'Ürün - 407', N'Açıklama - 407', 972577, N'https://picsum.photos/200', 3, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (408, N'Ürün - 408', N'Açıklama - 408', 947524, N'https://picsum.photos/200', 3, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (409, N'Ürün - 409', N'Açıklama - 409', 614442, N'https://picsum.photos/200', 7, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (410, N'Ürün - 410', N'Açıklama - 410', 640038, N'https://picsum.photos/200', 5, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (411, N'Ürün - 411', N'Açıklama - 411', 624319, N'https://picsum.photos/200', 8, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (412, N'Ürün - 412', N'Açıklama - 412', 309104, N'https://picsum.photos/200', 8, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (413, N'Ürün - 413', N'Açıklama - 413', 493791, N'https://picsum.photos/200', 5, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (414, N'Ürün - 414', N'Açıklama - 414', 585028, N'https://picsum.photos/200', 1, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (415, N'Ürün - 415', N'Açıklama - 415', 229175, N'https://picsum.photos/200', 1, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (416, N'Ürün - 416', N'Açıklama - 416', 707878, N'https://picsum.photos/200', 5, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (417, N'Ürün - 417', N'Açıklama - 417', 587499, N'https://picsum.photos/200', 7, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (418, N'Ürün - 418', N'Açıklama - 418', 143050, N'https://picsum.photos/200', 3, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (419, N'Ürün - 419', N'Açıklama - 419', 670078, N'https://picsum.photos/200', 6, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (420, N'Ürün - 420', N'Açıklama - 420', 661737, N'https://picsum.photos/200', 3, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (421, N'Ürün - 421', N'Açıklama - 421', 47033, N'https://picsum.photos/200', 1, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (422, N'Ürün - 422', N'Açıklama - 422', 911855, N'https://picsum.photos/200', 5, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (423, N'Ürün - 423', N'Açıklama - 423', 752246, N'https://picsum.photos/200', 4, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (424, N'Ürün - 424', N'Açıklama - 424', 229555, N'https://picsum.photos/200', 5, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (425, N'Ürün - 425', N'Açıklama - 425', 780462, N'https://picsum.photos/200', 1, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (426, N'Ürün - 426', N'Açıklama - 426', 813836, N'https://picsum.photos/200', 2, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (427, N'Ürün - 427', N'Açıklama - 427', 447269, N'https://picsum.photos/200', 7, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (428, N'Ürün - 428', N'Açıklama - 428', 622602, N'https://picsum.photos/200', 8, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (429, N'Ürün - 429', N'Açıklama - 429', 655996, N'https://picsum.photos/200', 2, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (430, N'Ürün - 430', N'Açıklama - 430', 433270, N'https://picsum.photos/200', 4, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (431, N'Ürün - 431', N'Açıklama - 431', 843692, N'https://picsum.photos/200', 7, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (432, N'Ürün - 432', N'Açıklama - 432', 132388, N'https://picsum.photos/200', 5, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (433, N'Ürün - 433', N'Açıklama - 433', 165480, N'https://picsum.photos/200', 5, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (434, N'Ürün - 434', N'Açıklama - 434', 269383, N'https://picsum.photos/200', 3, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (435, N'Ürün - 435', N'Açıklama - 435', 122277, N'https://picsum.photos/200', 2, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (436, N'Ürün - 436', N'Açıklama - 436', 506435, N'https://picsum.photos/200', 8, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (437, N'Ürün - 437', N'Açıklama - 437', 414140, N'https://picsum.photos/200', 5, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (438, N'Ürün - 438', N'Açıklama - 438', 943120, N'https://picsum.photos/200', 6, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (439, N'Ürün - 439', N'Açıklama - 439', 689237, N'https://picsum.photos/200', 7, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (440, N'Ürün - 440', N'Açıklama - 440', 640176, N'https://picsum.photos/200', 5, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (441, N'Ürün - 441', N'Açıklama - 441', 464411, N'https://picsum.photos/200', 6, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (442, N'Ürün - 442', N'Açıklama - 442', 50313, N'https://picsum.photos/200', 8, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (443, N'Ürün - 443', N'Açıklama - 443', 664261, N'https://picsum.photos/200', 8, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (444, N'Ürün - 444', N'Açıklama - 444', 229360, N'https://picsum.photos/200', 3, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (445, N'Ürün - 445', N'Açıklama - 445', 70850, N'https://picsum.photos/200', 4, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (446, N'Ürün - 446', N'Açıklama - 446', 797373, N'https://picsum.photos/200', 5, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (447, N'Ürün - 447', N'Açıklama - 447', 789092, N'https://picsum.photos/200', 4, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (448, N'Ürün - 448', N'Açıklama - 448', 182639, N'https://picsum.photos/200', 7, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (449, N'Ürün - 449', N'Açıklama - 449', 649524, N'https://picsum.photos/200', 1, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (450, N'Ürün - 450', N'Açıklama - 450', 76695, N'https://picsum.photos/200', 7, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (451, N'Ürün - 451', N'Açıklama - 451', 151723, N'https://picsum.photos/200', 2, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (452, N'Ürün - 452', N'Açıklama - 452', 763393, N'https://picsum.photos/200', 6, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (453, N'Ürün - 453', N'Açıklama - 453', 308596, N'https://picsum.photos/200', 7, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (454, N'Ürün - 454', N'Açıklama - 454', 252592, N'https://picsum.photos/200', 2, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (455, N'Ürün - 455', N'Açıklama - 455', 718647, N'https://picsum.photos/200', 6, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (456, N'Ürün - 456', N'Açıklama - 456', 36409, N'https://picsum.photos/200', 2, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (457, N'Ürün - 457', N'Açıklama - 457', 537215, N'https://picsum.photos/200', 8, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (458, N'Ürün - 458', N'Açıklama - 458', 111853, N'https://picsum.photos/200', 7, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (459, N'Ürün - 459', N'Açıklama - 459', 608632, N'https://picsum.photos/200', 6, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (460, N'Ürün - 460', N'Açıklama - 460', 233610, N'https://picsum.photos/200', 6, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (461, N'Ürün - 461', N'Açıklama - 461', 318641, N'https://picsum.photos/200', 7, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (462, N'Ürün - 462', N'Açıklama - 462', 621744, N'https://picsum.photos/200', 2, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (463, N'Ürün - 463', N'Açıklama - 463', 209558, N'https://picsum.photos/200', 8, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (464, N'Ürün - 464', N'Açıklama - 464', 444774, N'https://picsum.photos/200', 3, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (465, N'Ürün - 465', N'Açıklama - 465', 189264, N'https://picsum.photos/200', 1, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (466, N'Ürün - 466', N'Açıklama - 466', 69781, N'https://picsum.photos/200', 7, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (467, N'Ürün - 467', N'Açıklama - 467', 917724, N'https://picsum.photos/200', 5, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (468, N'Ürün - 468', N'Açıklama - 468', 12324, N'https://picsum.photos/200', 2, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (469, N'Ürün - 469', N'Açıklama - 469', 451515, N'https://picsum.photos/200', 7, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (470, N'Ürün - 470', N'Açıklama - 470', 225061, N'https://picsum.photos/200', 6, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (471, N'Ürün - 471', N'Açıklama - 471', 838712, N'https://picsum.photos/200', 8, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (472, N'Ürün - 472', N'Açıklama - 472', 291103, N'https://picsum.photos/200', 4, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (473, N'Ürün - 473', N'Açıklama - 473', 55542, N'https://picsum.photos/200', 4, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (474, N'Ürün - 474', N'Açıklama - 474', 576231, N'https://picsum.photos/200', 6, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (475, N'Ürün - 475', N'Açıklama - 475', 184621, N'https://picsum.photos/200', 5, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (476, N'Ürün - 476', N'Açıklama - 476', 20782, N'https://picsum.photos/200', 1, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (477, N'Ürün - 477', N'Açıklama - 477', 891084, N'https://picsum.photos/200', 8, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (478, N'Ürün - 478', N'Açıklama - 478', 148331, N'https://picsum.photos/200', 6, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (479, N'Ürün - 479', N'Açıklama - 479', 721309, N'https://picsum.photos/200', 8, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (480, N'Ürün - 480', N'Açıklama - 480', 553241, N'https://picsum.photos/200', 8, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (481, N'Ürün - 481', N'Açıklama - 481', 554767, N'https://picsum.photos/200', 5, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (482, N'Ürün - 482', N'Açıklama - 482', 873370, N'https://picsum.photos/200', 4, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (483, N'Ürün - 483', N'Açıklama - 483', 121971, N'https://picsum.photos/200', 4, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (484, N'Ürün - 484', N'Açıklama - 484', 740468, N'https://picsum.photos/200', 1, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (485, N'Ürün - 485', N'Açıklama - 485', 385500, N'https://picsum.photos/200', 6, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (486, N'Ürün - 486', N'Açıklama - 486', 697301, N'https://picsum.photos/200', 6, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (487, N'Ürün - 487', N'Açıklama - 487', 276134, N'https://picsum.photos/200', 5, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (488, N'Ürün - 488', N'Açıklama - 488', 654512, N'https://picsum.photos/200', 6, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (489, N'Ürün - 489', N'Açıklama - 489', 401431, N'https://picsum.photos/200', 5, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (490, N'Ürün - 490', N'Açıklama - 490', 930768, N'https://picsum.photos/200', 1, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (491, N'Ürün - 491', N'Açıklama - 491', 300301, N'https://picsum.photos/200', 4, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (492, N'Ürün - 492', N'Açıklama - 492', 160931, N'https://picsum.photos/200', 7, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (493, N'Ürün - 493', N'Açıklama - 493', 305657, N'https://picsum.photos/200', 8, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (494, N'Ürün - 494', N'Açıklama - 494', 723890, N'https://picsum.photos/200', 8, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (495, N'Ürün - 495', N'Açıklama - 495', 43406, N'https://picsum.photos/200', 2, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (496, N'Ürün - 496', N'Açıklama - 496', 389122, N'https://picsum.photos/200', 3, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (497, N'Ürün - 497', N'Açıklama - 497', 307658, N'https://picsum.photos/200', 2, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (498, N'Ürün - 498', N'Açıklama - 498', 576205, N'https://picsum.photos/200', 1, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (499, N'Ürün - 499', N'Açıklama - 499', 414027, N'https://picsum.photos/200', 3, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (500, N'Ürün - 500', N'Açıklama - 500', 25902, N'https://picsum.photos/200', 8, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (501, N'Ürün - 501', N'Açıklama - 501', 740384, N'https://picsum.photos/200', 1, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (502, N'Ürün - 502', N'Açıklama - 502', 700500, N'https://picsum.photos/200', 1, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (503, N'Ürün - 503', N'Açıklama - 503', 677441, N'https://picsum.photos/200', 4, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (504, N'Ürün - 504', N'Açıklama - 504', 301723, N'https://picsum.photos/200', 5, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (505, N'Ürün - 505', N'Açıklama - 505', 782167, N'https://picsum.photos/200', 6, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (506, N'Ürün - 506', N'Açıklama - 506', 783266, N'https://picsum.photos/200', 6, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (507, N'Ürün - 507', N'Açıklama - 507', 918634, N'https://picsum.photos/200', 7, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (508, N'Ürün - 508', N'Açıklama - 508', 248686, N'https://picsum.photos/200', 4, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (509, N'Ürün - 509', N'Açıklama - 509', 925290, N'https://picsum.photos/200', 8, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (510, N'Ürün - 510', N'Açıklama - 510', 234722, N'https://picsum.photos/200', 4, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (511, N'Ürün - 511', N'Açıklama - 511', 2448, N'https://picsum.photos/200', 3, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (512, N'Ürün - 512', N'Açıklama - 512', 306192, N'https://picsum.photos/200', 3, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (513, N'Ürün - 513', N'Açıklama - 513', 646150, N'https://picsum.photos/200', 1, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (514, N'Ürün - 514', N'Açıklama - 514', 332773, N'https://picsum.photos/200', 6, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (515, N'Ürün - 515', N'Açıklama - 515', 547231, N'https://picsum.photos/200', 5, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (516, N'Ürün - 516', N'Açıklama - 516', 863951, N'https://picsum.photos/200', 4, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (517, N'Ürün - 517', N'Açıklama - 517', 18580, N'https://picsum.photos/200', 4, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (518, N'Ürün - 518', N'Açıklama - 518', 23397, N'https://picsum.photos/200', 8, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (519, N'Ürün - 519', N'Açıklama - 519', 48923, N'https://picsum.photos/200', 1, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (520, N'Ürün - 520', N'Açıklama - 520', 559414, N'https://picsum.photos/200', 6, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (521, N'Ürün - 521', N'Açıklama - 521', 415655, N'https://picsum.photos/200', 6, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (522, N'Ürün - 522', N'Açıklama - 522', 972238, N'https://picsum.photos/200', 6, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (523, N'Ürün - 523', N'Açıklama - 523', 32290, N'https://picsum.photos/200', 2, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (524, N'Ürün - 524', N'Açıklama - 524', 79578, N'https://picsum.photos/200', 2, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (525, N'Ürün - 525', N'Açıklama - 525', 753419, N'https://picsum.photos/200', 6, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (526, N'Ürün - 526', N'Açıklama - 526', 464068, N'https://picsum.photos/200', 1, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (527, N'Ürün - 527', N'Açıklama - 527', 588367, N'https://picsum.photos/200', 2, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (528, N'Ürün - 528', N'Açıklama - 528', 652046, N'https://picsum.photos/200', 3, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (529, N'Ürün - 529', N'Açıklama - 529', 336262, N'https://picsum.photos/200', 8, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (530, N'Ürün - 530', N'Açıklama - 530', 775159, N'https://picsum.photos/200', 2, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (531, N'Ürün - 531', N'Açıklama - 531', 37027, N'https://picsum.photos/200', 4, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (532, N'Ürün - 532', N'Açıklama - 532', 437104, N'https://picsum.photos/200', 7, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (533, N'Ürün - 533', N'Açıklama - 533', 467878, N'https://picsum.photos/200', 7, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (534, N'Ürün - 534', N'Açıklama - 534', 296753, N'https://picsum.photos/200', 2, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (535, N'Ürün - 535', N'Açıklama - 535', 533916, N'https://picsum.photos/200', 5, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (536, N'Ürün - 536', N'Açıklama - 536', 920500, N'https://picsum.photos/200', 5, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (537, N'Ürün - 537', N'Açıklama - 537', 166881, N'https://picsum.photos/200', 8, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (538, N'Ürün - 538', N'Açıklama - 538', 505641, N'https://picsum.photos/200', 6, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (539, N'Ürün - 539', N'Açıklama - 539', 503111, N'https://picsum.photos/200', 8, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (540, N'Ürün - 540', N'Açıklama - 540', 855624, N'https://picsum.photos/200', 5, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (541, N'Ürün - 541', N'Açıklama - 541', 306428, N'https://picsum.photos/200', 6, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (542, N'Ürün - 542', N'Açıklama - 542', 900282, N'https://picsum.photos/200', 7, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (543, N'Ürün - 543', N'Açıklama - 543', 9521, N'https://picsum.photos/200', 4, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (544, N'Ürün - 544', N'Açıklama - 544', 117816, N'https://picsum.photos/200', 7, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (545, N'Ürün - 545', N'Açıklama - 545', 710526, N'https://picsum.photos/200', 2, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (546, N'Ürün - 546', N'Açıklama - 546', 572510, N'https://picsum.photos/200', 2, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (547, N'Ürün - 547', N'Açıklama - 547', 759646, N'https://picsum.photos/200', 8, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (548, N'Ürün - 548', N'Açıklama - 548', 203011, N'https://picsum.photos/200', 4, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (549, N'Ürün - 549', N'Açıklama - 549', 641161, N'https://picsum.photos/200', 6, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (550, N'Ürün - 550', N'Açıklama - 550', 650558, N'https://picsum.photos/200', 1, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (551, N'Ürün - 551', N'Açıklama - 551', 279376, N'https://picsum.photos/200', 3, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (552, N'Ürün - 552', N'Açıklama - 552', 172236, N'https://picsum.photos/200', 5, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (553, N'Ürün - 553', N'Açıklama - 553', 971589, N'https://picsum.photos/200', 6, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (554, N'Ürün - 554', N'Açıklama - 554', 868276, N'https://picsum.photos/200', 3, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (555, N'Ürün - 555', N'Açıklama - 555', 823651, N'https://picsum.photos/200', 5, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (556, N'Ürün - 556', N'Açıklama - 556', 666570, N'https://picsum.photos/200', 1, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (557, N'Ürün - 557', N'Açıklama - 557', 831078, N'https://picsum.photos/200', 4, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (558, N'Ürün - 558', N'Açıklama - 558', 176097, N'https://picsum.photos/200', 1, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (559, N'Ürün - 559', N'Açıklama - 559', 362867, N'https://picsum.photos/200', 1, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (560, N'Ürün - 560', N'Açıklama - 560', 285454, N'https://picsum.photos/200', 6, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (561, N'Ürün - 561', N'Açıklama - 561', 675918, N'https://picsum.photos/200', 8, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (562, N'Ürün - 562', N'Açıklama - 562', 619589, N'https://picsum.photos/200', 4, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (563, N'Ürün - 563', N'Açıklama - 563', 758985, N'https://picsum.photos/200', 6, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (564, N'Ürün - 564', N'Açıklama - 564', 448954, N'https://picsum.photos/200', 4, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (565, N'Ürün - 565', N'Açıklama - 565', 470031, N'https://picsum.photos/200', 8, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (566, N'Ürün - 566', N'Açıklama - 566', 193144, N'https://picsum.photos/200', 1, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (567, N'Ürün - 567', N'Açıklama - 567', 211558, N'https://picsum.photos/200', 7, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (568, N'Ürün - 568', N'Açıklama - 568', 360724, N'https://picsum.photos/200', 8, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (569, N'Ürün - 569', N'Açıklama - 569', 782158, N'https://picsum.photos/200', 5, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (570, N'Ürün - 570', N'Açıklama - 570', 136229, N'https://picsum.photos/200', 2, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (571, N'Ürün - 571', N'Açıklama - 571', 382000, N'https://picsum.photos/200', 3, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (572, N'Ürün - 572', N'Açıklama - 572', 902858, N'https://picsum.photos/200', 4, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (573, N'Ürün - 573', N'Açıklama - 573', 687501, N'https://picsum.photos/200', 6, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (574, N'Ürün - 574', N'Açıklama - 574', 577609, N'https://picsum.photos/200', 5, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (575, N'Ürün - 575', N'Açıklama - 575', 919730, N'https://picsum.photos/200', 2, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (576, N'Ürün - 576', N'Açıklama - 576', 86247, N'https://picsum.photos/200', 3, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (577, N'Ürün - 577', N'Açıklama - 577', 20257, N'https://picsum.photos/200', 8, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (578, N'Ürün - 578', N'Açıklama - 578', 403632, N'https://picsum.photos/200', 5, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (579, N'Ürün - 579', N'Açıklama - 579', 977981, N'https://picsum.photos/200', 5, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (580, N'Ürün - 580', N'Açıklama - 580', 826699, N'https://picsum.photos/200', 5, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (581, N'Ürün - 581', N'Açıklama - 581', 12692, N'https://picsum.photos/200', 1, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (582, N'Ürün - 582', N'Açıklama - 582', 719031, N'https://picsum.photos/200', 2, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (583, N'Ürün - 583', N'Açıklama - 583', 4549, N'https://picsum.photos/200', 7, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (584, N'Ürün - 584', N'Açıklama - 584', 144116, N'https://picsum.photos/200', 2, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (585, N'Ürün - 585', N'Açıklama - 585', 157987, N'https://picsum.photos/200', 2, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (586, N'Ürün - 586', N'Açıklama - 586', 218047, N'https://picsum.photos/200', 3, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (587, N'Ürün - 587', N'Açıklama - 587', 916193, N'https://picsum.photos/200', 8, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (588, N'Ürün - 588', N'Açıklama - 588', 915294, N'https://picsum.photos/200', 8, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (589, N'Ürün - 589', N'Açıklama - 589', 827668, N'https://picsum.photos/200', 3, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (590, N'Ürün - 590', N'Açıklama - 590', 725308, N'https://picsum.photos/200', 3, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (591, N'Ürün - 591', N'Açıklama - 591', 116654, N'https://picsum.photos/200', 4, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (592, N'Ürün - 592', N'Açıklama - 592', 600224, N'https://picsum.photos/200', 2, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (593, N'Ürün - 593', N'Açıklama - 593', 831642, N'https://picsum.photos/200', 2, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (594, N'Ürün - 594', N'Açıklama - 594', 58828, N'https://picsum.photos/200', 8, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (595, N'Ürün - 595', N'Açıklama - 595', 361010, N'https://picsum.photos/200', 1, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (596, N'Ürün - 596', N'Açıklama - 596', 599227, N'https://picsum.photos/200', 3, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (597, N'Ürün - 597', N'Açıklama - 597', 706126, N'https://picsum.photos/200', 2, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (598, N'Ürün - 598', N'Açıklama - 598', 536730, N'https://picsum.photos/200', 6, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (599, N'Ürün - 599', N'Açıklama - 599', 885209, N'https://picsum.photos/200', 2, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (600, N'Ürün - 600', N'Açıklama - 600', 328262, N'https://picsum.photos/200', 8, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (601, N'Ürün - 601', N'Açıklama - 601', 273, N'https://picsum.photos/200', 5, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (602, N'Ürün - 602', N'Açıklama - 602', 999175, N'https://picsum.photos/200', 2, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (603, N'Ürün - 603', N'Açıklama - 603', 356060, N'https://picsum.photos/200', 2, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (604, N'Ürün - 604', N'Açıklama - 604', 817337, N'https://picsum.photos/200', 6, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (605, N'Ürün - 605', N'Açıklama - 605', 294552, N'https://picsum.photos/200', 4, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (606, N'Ürün - 606', N'Açıklama - 606', 73850, N'https://picsum.photos/200', 1, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (607, N'Ürün - 607', N'Açıklama - 607', 389040, N'https://picsum.photos/200', 8, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (608, N'Ürün - 608', N'Açıklama - 608', 670757, N'https://picsum.photos/200', 3, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (609, N'Ürün - 609', N'Açıklama - 609', 728482, N'https://picsum.photos/200', 1, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (610, N'Ürün - 610', N'Açıklama - 610', 100293, N'https://picsum.photos/200', 1, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (611, N'Ürün - 611', N'Açıklama - 611', 106945, N'https://picsum.photos/200', 8, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (612, N'Ürün - 612', N'Açıklama - 612', 493844, N'https://picsum.photos/200', 2, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (613, N'Ürün - 613', N'Açıklama - 613', 958597, N'https://picsum.photos/200', 8, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (614, N'Ürün - 614', N'Açıklama - 614', 586332, N'https://picsum.photos/200', 7, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (615, N'Ürün - 615', N'Açıklama - 615', 893673, N'https://picsum.photos/200', 8, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (616, N'Ürün - 616', N'Açıklama - 616', 97460, N'https://picsum.photos/200', 7, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (617, N'Ürün - 617', N'Açıklama - 617', 125880, N'https://picsum.photos/200', 2, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (618, N'Ürün - 618', N'Açıklama - 618', 454492, N'https://picsum.photos/200', 4, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (619, N'Ürün - 619', N'Açıklama - 619', 891141, N'https://picsum.photos/200', 1, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (620, N'Ürün - 620', N'Açıklama - 620', 726959, N'https://picsum.photos/200', 6, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (621, N'Ürün - 621', N'Açıklama - 621', 88737, N'https://picsum.photos/200', 6, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (622, N'Ürün - 622', N'Açıklama - 622', 255929, N'https://picsum.photos/200', 5, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (623, N'Ürün - 623', N'Açıklama - 623', 155195, N'https://picsum.photos/200', 7, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (624, N'Ürün - 624', N'Açıklama - 624', 770245, N'https://picsum.photos/200', 3, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (625, N'Ürün - 625', N'Açıklama - 625', 468398, N'https://picsum.photos/200', 6, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (626, N'Ürün - 626', N'Açıklama - 626', 278118, N'https://picsum.photos/200', 1, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (627, N'Ürün - 627', N'Açıklama - 627', 108505, N'https://picsum.photos/200', 8, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (628, N'Ürün - 628', N'Açıklama - 628', 785002, N'https://picsum.photos/200', 4, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (629, N'Ürün - 629', N'Açıklama - 629', 225141, N'https://picsum.photos/200', 2, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (630, N'Ürün - 630', N'Açıklama - 630', 229478, N'https://picsum.photos/200', 7, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (631, N'Ürün - 631', N'Açıklama - 631', 618758, N'https://picsum.photos/200', 4, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (632, N'Ürün - 632', N'Açıklama - 632', 3510, N'https://picsum.photos/200', 2, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (633, N'Ürün - 633', N'Açıklama - 633', 719917, N'https://picsum.photos/200', 5, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (634, N'Ürün - 634', N'Açıklama - 634', 685922, N'https://picsum.photos/200', 6, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (635, N'Ürün - 635', N'Açıklama - 635', 590980, N'https://picsum.photos/200', 8, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (636, N'Ürün - 636', N'Açıklama - 636', 229508, N'https://picsum.photos/200', 4, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (637, N'Ürün - 637', N'Açıklama - 637', 858162, N'https://picsum.photos/200', 2, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (638, N'Ürün - 638', N'Açıklama - 638', 29477, N'https://picsum.photos/200', 2, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (639, N'Ürün - 639', N'Açıklama - 639', 294172, N'https://picsum.photos/200', 6, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (640, N'Ürün - 640', N'Açıklama - 640', 239711, N'https://picsum.photos/200', 4, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (641, N'Ürün - 641', N'Açıklama - 641', 663465, N'https://picsum.photos/200', 6, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (642, N'Ürün - 642', N'Açıklama - 642', 517255, N'https://picsum.photos/200', 1, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (643, N'Ürün - 643', N'Açıklama - 643', 772773, N'https://picsum.photos/200', 4, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (644, N'Ürün - 644', N'Açıklama - 644', 125028, N'https://picsum.photos/200', 7, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (645, N'Ürün - 645', N'Açıklama - 645', 293910, N'https://picsum.photos/200', 4, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (646, N'Ürün - 646', N'Açıklama - 646', 615457, N'https://picsum.photos/200', 2, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (647, N'Ürün - 647', N'Açıklama - 647', 984023, N'https://picsum.photos/200', 8, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (648, N'Ürün - 648', N'Açıklama - 648', 661238, N'https://picsum.photos/200', 3, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (649, N'Ürün - 649', N'Açıklama - 649', 141543, N'https://picsum.photos/200', 3, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (650, N'Ürün - 650', N'Açıklama - 650', 697876, N'https://picsum.photos/200', 4, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (651, N'Ürün - 651', N'Açıklama - 651', 856669, N'https://picsum.photos/200', 5, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (652, N'Ürün - 652', N'Açıklama - 652', 790608, N'https://picsum.photos/200', 8, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (653, N'Ürün - 653', N'Açıklama - 653', 340190, N'https://picsum.photos/200', 2, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (654, N'Ürün - 654', N'Açıklama - 654', 88500, N'https://picsum.photos/200', 8, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (655, N'Ürün - 655', N'Açıklama - 655', 691709, N'https://picsum.photos/200', 7, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (656, N'Ürün - 656', N'Açıklama - 656', 998126, N'https://picsum.photos/200', 7, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (657, N'Ürün - 657', N'Açıklama - 657', 345683, N'https://picsum.photos/200', 5, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (658, N'Ürün - 658', N'Açıklama - 658', 903248, N'https://picsum.photos/200', 8, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (659, N'Ürün - 659', N'Açıklama - 659', 585955, N'https://picsum.photos/200', 5, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (660, N'Ürün - 660', N'Açıklama - 660', 394815, N'https://picsum.photos/200', 7, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (661, N'Ürün - 661', N'Açıklama - 661', 429620, N'https://picsum.photos/200', 4, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (662, N'Ürün - 662', N'Açıklama - 662', 298663, N'https://picsum.photos/200', 6, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (663, N'Ürün - 663', N'Açıklama - 663', 254178, N'https://picsum.photos/200', 4, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (664, N'Ürün - 664', N'Açıklama - 664', 842820, N'https://picsum.photos/200', 1, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (665, N'Ürün - 665', N'Açıklama - 665', 899937, N'https://picsum.photos/200', 3, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (666, N'Ürün - 666', N'Açıklama - 666', 708558, N'https://picsum.photos/200', 3, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (667, N'Ürün - 667', N'Açıklama - 667', 522640, N'https://picsum.photos/200', 5, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (668, N'Ürün - 668', N'Açıklama - 668', 83247, N'https://picsum.photos/200', 8, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (669, N'Ürün - 669', N'Açıklama - 669', 907168, N'https://picsum.photos/200', 2, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (670, N'Ürün - 670', N'Açıklama - 670', 779965, N'https://picsum.photos/200', 3, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (671, N'Ürün - 671', N'Açıklama - 671', 722981, N'https://picsum.photos/200', 5, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (672, N'Ürün - 672', N'Açıklama - 672', 917317, N'https://picsum.photos/200', 5, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (673, N'Ürün - 673', N'Açıklama - 673', 18290, N'https://picsum.photos/200', 3, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (674, N'Ürün - 674', N'Açıklama - 674', 632281, N'https://picsum.photos/200', 1, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (675, N'Ürün - 675', N'Açıklama - 675', 164581, N'https://picsum.photos/200', 2, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (676, N'Ürün - 676', N'Açıklama - 676', 926249, N'https://picsum.photos/200', 7, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (677, N'Ürün - 677', N'Açıklama - 677', 846736, N'https://picsum.photos/200', 5, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (678, N'Ürün - 678', N'Açıklama - 678', 129995, N'https://picsum.photos/200', 5, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (679, N'Ürün - 679', N'Açıklama - 679', 588623, N'https://picsum.photos/200', 5, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (680, N'Ürün - 680', N'Açıklama - 680', 123116, N'https://picsum.photos/200', 4, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (681, N'Ürün - 681', N'Açıklama - 681', 15829, N'https://picsum.photos/200', 4, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (682, N'Ürün - 682', N'Açıklama - 682', 104354, N'https://picsum.photos/200', 1, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (683, N'Ürün - 683', N'Açıklama - 683', 97947, N'https://picsum.photos/200', 8, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (684, N'Ürün - 684', N'Açıklama - 684', 760359, N'https://picsum.photos/200', 7, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (685, N'Ürün - 685', N'Açıklama - 685', 531823, N'https://picsum.photos/200', 1, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (686, N'Ürün - 686', N'Açıklama - 686', 976703, N'https://picsum.photos/200', 6, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (687, N'Ürün - 687', N'Açıklama - 687', 329479, N'https://picsum.photos/200', 2, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (688, N'Ürün - 688', N'Açıklama - 688', 900754, N'https://picsum.photos/200', 3, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (689, N'Ürün - 689', N'Açıklama - 689', 344258, N'https://picsum.photos/200', 4, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (690, N'Ürün - 690', N'Açıklama - 690', 14423, N'https://picsum.photos/200', 8, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (691, N'Ürün - 691', N'Açıklama - 691', 282130, N'https://picsum.photos/200', 2, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (692, N'Ürün - 692', N'Açıklama - 692', 503762, N'https://picsum.photos/200', 1, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (693, N'Ürün - 693', N'Açıklama - 693', 148282, N'https://picsum.photos/200', 6, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (694, N'Ürün - 694', N'Açıklama - 694', 826266, N'https://picsum.photos/200', 5, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (695, N'Ürün - 695', N'Açıklama - 695', 384621, N'https://picsum.photos/200', 4, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (696, N'Ürün - 696', N'Açıklama - 696', 742845, N'https://picsum.photos/200', 1, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (697, N'Ürün - 697', N'Açıklama - 697', 856116, N'https://picsum.photos/200', 8, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (698, N'Ürün - 698', N'Açıklama - 698', 488491, N'https://picsum.photos/200', 4, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (699, N'Ürün - 699', N'Açıklama - 699', 884504, N'https://picsum.photos/200', 5, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (700, N'Ürün - 700', N'Açıklama - 700', 580011, N'https://picsum.photos/200', 3, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (701, N'Ürün - 701', N'Açıklama - 701', 703013, N'https://picsum.photos/200', 1, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (702, N'Ürün - 702', N'Açıklama - 702', 63622, N'https://picsum.photos/200', 3, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (703, N'Ürün - 703', N'Açıklama - 703', 31454, N'https://picsum.photos/200', 5, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (704, N'Ürün - 704', N'Açıklama - 704', 77906, N'https://picsum.photos/200', 3, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (705, N'Ürün - 705', N'Açıklama - 705', 145716, N'https://picsum.photos/200', 7, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (706, N'Ürün - 706', N'Açıklama - 706', 482481, N'https://picsum.photos/200', 2, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (707, N'Ürün - 707', N'Açıklama - 707', 327643, N'https://picsum.photos/200', 2, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (708, N'Ürün - 708', N'Açıklama - 708', 647627, N'https://picsum.photos/200', 8, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (709, N'Ürün - 709', N'Açıklama - 709', 683701, N'https://picsum.photos/200', 5, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (710, N'Ürün - 710', N'Açıklama - 710', 501765, N'https://picsum.photos/200', 6, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (711, N'Ürün - 711', N'Açıklama - 711', 608821, N'https://picsum.photos/200', 6, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (712, N'Ürün - 712', N'Açıklama - 712', 823715, N'https://picsum.photos/200', 4, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (713, N'Ürün - 713', N'Açıklama - 713', 135435, N'https://picsum.photos/200', 1, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (714, N'Ürün - 714', N'Açıklama - 714', 317262, N'https://picsum.photos/200', 3, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (715, N'Ürün - 715', N'Açıklama - 715', 183121, N'https://picsum.photos/200', 7, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (716, N'Ürün - 716', N'Açıklama - 716', 160359, N'https://picsum.photos/200', 4, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (717, N'Ürün - 717', N'Açıklama - 717', 261451, N'https://picsum.photos/200', 5, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (718, N'Ürün - 718', N'Açıklama - 718', 182189, N'https://picsum.photos/200', 2, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (719, N'Ürün - 719', N'Açıklama - 719', 156621, N'https://picsum.photos/200', 4, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (720, N'Ürün - 720', N'Açıklama - 720', 610335, N'https://picsum.photos/200', 8, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (721, N'Ürün - 721', N'Açıklama - 721', 942724, N'https://picsum.photos/200', 6, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (722, N'Ürün - 722', N'Açıklama - 722', 143413, N'https://picsum.photos/200', 6, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (723, N'Ürün - 723', N'Açıklama - 723', 531943, N'https://picsum.photos/200', 3, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (724, N'Ürün - 724', N'Açıklama - 724', 677852, N'https://picsum.photos/200', 5, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (725, N'Ürün - 725', N'Açıklama - 725', 428150, N'https://picsum.photos/200', 6, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (726, N'Ürün - 726', N'Açıklama - 726', 31693, N'https://picsum.photos/200', 1, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (727, N'Ürün - 727', N'Açıklama - 727', 957634, N'https://picsum.photos/200', 3, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (728, N'Ürün - 728', N'Açıklama - 728', 559110, N'https://picsum.photos/200', 6, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (729, N'Ürün - 729', N'Açıklama - 729', 784652, N'https://picsum.photos/200', 2, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (730, N'Ürün - 730', N'Açıklama - 730', 47846, N'https://picsum.photos/200', 8, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (731, N'Ürün - 731', N'Açıklama - 731', 928912, N'https://picsum.photos/200', 4, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (732, N'Ürün - 732', N'Açıklama - 732', 628079, N'https://picsum.photos/200', 4, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (733, N'Ürün - 733', N'Açıklama - 733', 101802, N'https://picsum.photos/200', 4, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (734, N'Ürün - 734', N'Açıklama - 734', 705571, N'https://picsum.photos/200', 7, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (735, N'Ürün - 735', N'Açıklama - 735', 317136, N'https://picsum.photos/200', 6, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (736, N'Ürün - 736', N'Açıklama - 736', 280536, N'https://picsum.photos/200', 5, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (737, N'Ürün - 737', N'Açıklama - 737', 734110, N'https://picsum.photos/200', 6, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (738, N'Ürün - 738', N'Açıklama - 738', 102464, N'https://picsum.photos/200', 4, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (739, N'Ürün - 739', N'Açıklama - 739', 453155, N'https://picsum.photos/200', 8, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (740, N'Ürün - 740', N'Açıklama - 740', 739876, N'https://picsum.photos/200', 2, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (741, N'Ürün - 741', N'Açıklama - 741', 978020, N'https://picsum.photos/200', 1, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (742, N'Ürün - 742', N'Açıklama - 742', 69141, N'https://picsum.photos/200', 4, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (743, N'Ürün - 743', N'Açıklama - 743', 359701, N'https://picsum.photos/200', 3, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (744, N'Ürün - 744', N'Açıklama - 744', 554326, N'https://picsum.photos/200', 5, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (745, N'Ürün - 745', N'Açıklama - 745', 692656, N'https://picsum.photos/200', 7, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (746, N'Ürün - 746', N'Açıklama - 746', 268136, N'https://picsum.photos/200', 3, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (747, N'Ürün - 747', N'Açıklama - 747', 297720, N'https://picsum.photos/200', 4, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (748, N'Ürün - 748', N'Açıklama - 748', 656529, N'https://picsum.photos/200', 6, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (749, N'Ürün - 749', N'Açıklama - 749', 567101, N'https://picsum.photos/200', 2, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (750, N'Ürün - 750', N'Açıklama - 750', 371323, N'https://picsum.photos/200', 4, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (751, N'Ürün - 751', N'Açıklama - 751', 34935, N'https://picsum.photos/200', 7, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (752, N'Ürün - 752', N'Açıklama - 752', 189568, N'https://picsum.photos/200', 6, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (753, N'Ürün - 753', N'Açıklama - 753', 885484, N'https://picsum.photos/200', 1, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (754, N'Ürün - 754', N'Açıklama - 754', 720947, N'https://picsum.photos/200', 7, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (755, N'Ürün - 755', N'Açıklama - 755', 452173, N'https://picsum.photos/200', 7, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (756, N'Ürün - 756', N'Açıklama - 756', 38806, N'https://picsum.photos/200', 4, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (757, N'Ürün - 757', N'Açıklama - 757', 126570, N'https://picsum.photos/200', 3, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (758, N'Ürün - 758', N'Açıklama - 758', 368045, N'https://picsum.photos/200', 7, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (759, N'Ürün - 759', N'Açıklama - 759', 704647, N'https://picsum.photos/200', 3, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (760, N'Ürün - 760', N'Açıklama - 760', 798252, N'https://picsum.photos/200', 5, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (761, N'Ürün - 761', N'Açıklama - 761', 72452, N'https://picsum.photos/200', 5, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (762, N'Ürün - 762', N'Açıklama - 762', 792637, N'https://picsum.photos/200', 3, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (763, N'Ürün - 763', N'Açıklama - 763', 133224, N'https://picsum.photos/200', 3, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (764, N'Ürün - 764', N'Açıklama - 764', 742752, N'https://picsum.photos/200', 3, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (765, N'Ürün - 765', N'Açıklama - 765', 913727, N'https://picsum.photos/200', 3, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (766, N'Ürün - 766', N'Açıklama - 766', 94736, N'https://picsum.photos/200', 2, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (767, N'Ürün - 767', N'Açıklama - 767', 455682, N'https://picsum.photos/200', 7, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (768, N'Ürün - 768', N'Açıklama - 768', 344970, N'https://picsum.photos/200', 3, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (769, N'Ürün - 769', N'Açıklama - 769', 989175, N'https://picsum.photos/200', 6, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (770, N'Ürün - 770', N'Açıklama - 770', 847372, N'https://picsum.photos/200', 8, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (771, N'Ürün - 771', N'Açıklama - 771', 290827, N'https://picsum.photos/200', 5, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (772, N'Ürün - 772', N'Açıklama - 772', 92579, N'https://picsum.photos/200', 5, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (773, N'Ürün - 773', N'Açıklama - 773', 229900, N'https://picsum.photos/200', 3, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (774, N'Ürün - 774', N'Açıklama - 774', 75417, N'https://picsum.photos/200', 8, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (775, N'Ürün - 775', N'Açıklama - 775', 984722, N'https://picsum.photos/200', 7, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (776, N'Ürün - 776', N'Açıklama - 776', 174394, N'https://picsum.photos/200', 4, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (777, N'Ürün - 777', N'Açıklama - 777', 236689, N'https://picsum.photos/200', 7, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (778, N'Ürün - 778', N'Açıklama - 778', 343357, N'https://picsum.photos/200', 6, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (779, N'Ürün - 779', N'Açıklama - 779', 185445, N'https://picsum.photos/200', 4, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (780, N'Ürün - 780', N'Açıklama - 780', 926459, N'https://picsum.photos/200', 1, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (781, N'Ürün - 781', N'Açıklama - 781', 11563, N'https://picsum.photos/200', 3, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (782, N'Ürün - 782', N'Açıklama - 782', 73875, N'https://picsum.photos/200', 4, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (783, N'Ürün - 783', N'Açıklama - 783', 219301, N'https://picsum.photos/200', 7, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (784, N'Ürün - 784', N'Açıklama - 784', 502263, N'https://picsum.photos/200', 4, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (785, N'Ürün - 785', N'Açıklama - 785', 235356, N'https://picsum.photos/200', 2, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (786, N'Ürün - 786', N'Açıklama - 786', 141208, N'https://picsum.photos/200', 6, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (787, N'Ürün - 787', N'Açıklama - 787', 551629, N'https://picsum.photos/200', 8, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (788, N'Ürün - 788', N'Açıklama - 788', 163827, N'https://picsum.photos/200', 5, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (789, N'Ürün - 789', N'Açıklama - 789', 861633, N'https://picsum.photos/200', 6, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (790, N'Ürün - 790', N'Açıklama - 790', 320636, N'https://picsum.photos/200', 8, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (791, N'Ürün - 791', N'Açıklama - 791', 513162, N'https://picsum.photos/200', 3, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (792, N'Ürün - 792', N'Açıklama - 792', 290171, N'https://picsum.photos/200', 7, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (793, N'Ürün - 793', N'Açıklama - 793', 203626, N'https://picsum.photos/200', 5, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (794, N'Ürün - 794', N'Açıklama - 794', 827250, N'https://picsum.photos/200', 1, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (795, N'Ürün - 795', N'Açıklama - 795', 444521, N'https://picsum.photos/200', 3, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (796, N'Ürün - 796', N'Açıklama - 796', 113335, N'https://picsum.photos/200', 6, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (797, N'Ürün - 797', N'Açıklama - 797', 493520, N'https://picsum.photos/200', 1, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (798, N'Ürün - 798', N'Açıklama - 798', 579536, N'https://picsum.photos/200', 4, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (799, N'Ürün - 799', N'Açıklama - 799', 920749, N'https://picsum.photos/200', 6, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (800, N'Ürün - 800', N'Açıklama - 800', 337822, N'https://picsum.photos/200', 3, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (801, N'Ürün - 801', N'Açıklama - 801', 387398, N'https://picsum.photos/200', 4, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (802, N'Ürün - 802', N'Açıklama - 802', 505151, N'https://picsum.photos/200', 5, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (803, N'Ürün - 803', N'Açıklama - 803', 956657, N'https://picsum.photos/200', 3, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (804, N'Ürün - 804', N'Açıklama - 804', 381585, N'https://picsum.photos/200', 2, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (805, N'Ürün - 805', N'Açıklama - 805', 578642, N'https://picsum.photos/200', 5, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (806, N'Ürün - 806', N'Açıklama - 806', 29071, N'https://picsum.photos/200', 2, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (807, N'Ürün - 807', N'Açıklama - 807', 829311, N'https://picsum.photos/200', 2, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (808, N'Ürün - 808', N'Açıklama - 808', 55938, N'https://picsum.photos/200', 7, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (809, N'Ürün - 809', N'Açıklama - 809', 865424, N'https://picsum.photos/200', 5, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (810, N'Ürün - 810', N'Açıklama - 810', 551203, N'https://picsum.photos/200', 2, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (811, N'Ürün - 811', N'Açıklama - 811', 614890, N'https://picsum.photos/200', 6, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (812, N'Ürün - 812', N'Açıklama - 812', 208191, N'https://picsum.photos/200', 2, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (813, N'Ürün - 813', N'Açıklama - 813', 361072, N'https://picsum.photos/200', 7, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (814, N'Ürün - 814', N'Açıklama - 814', 973318, N'https://picsum.photos/200', 8, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (815, N'Ürün - 815', N'Açıklama - 815', 857727, N'https://picsum.photos/200', 3, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (816, N'Ürün - 816', N'Açıklama - 816', 522345, N'https://picsum.photos/200', 8, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (817, N'Ürün - 817', N'Açıklama - 817', 587102, N'https://picsum.photos/200', 2, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (818, N'Ürün - 818', N'Açıklama - 818', 732658, N'https://picsum.photos/200', 4, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (819, N'Ürün - 819', N'Açıklama - 819', 837783, N'https://picsum.photos/200', 1, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (820, N'Ürün - 820', N'Açıklama - 820', 216226, N'https://picsum.photos/200', 2, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (821, N'Ürün - 821', N'Açıklama - 821', 996924, N'https://picsum.photos/200', 8, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (822, N'Ürün - 822', N'Açıklama - 822', 333520, N'https://picsum.photos/200', 4, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (823, N'Ürün - 823', N'Açıklama - 823', 119024, N'https://picsum.photos/200', 6, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (824, N'Ürün - 824', N'Açıklama - 824', 213686, N'https://picsum.photos/200', 1, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (825, N'Ürün - 825', N'Açıklama - 825', 906296, N'https://picsum.photos/200', 4, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (826, N'Ürün - 826', N'Açıklama - 826', 444681, N'https://picsum.photos/200', 8, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (827, N'Ürün - 827', N'Açıklama - 827', 198041, N'https://picsum.photos/200', 7, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (828, N'Ürün - 828', N'Açıklama - 828', 936470, N'https://picsum.photos/200', 8, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (829, N'Ürün - 829', N'Açıklama - 829', 796923, N'https://picsum.photos/200', 3, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (830, N'Ürün - 830', N'Açıklama - 830', 451010, N'https://picsum.photos/200', 2, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (831, N'Ürün - 831', N'Açıklama - 831', 380756, N'https://picsum.photos/200', 8, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (832, N'Ürün - 832', N'Açıklama - 832', 572794, N'https://picsum.photos/200', 6, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (833, N'Ürün - 833', N'Açıklama - 833', 967644, N'https://picsum.photos/200', 6, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (834, N'Ürün - 834', N'Açıklama - 834', 546271, N'https://picsum.photos/200', 4, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (835, N'Ürün - 835', N'Açıklama - 835', 364969, N'https://picsum.photos/200', 2, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (836, N'Ürün - 836', N'Açıklama - 836', 298748, N'https://picsum.photos/200', 2, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (837, N'Ürün - 837', N'Açıklama - 837', 865226, N'https://picsum.photos/200', 8, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (838, N'Ürün - 838', N'Açıklama - 838', 446460, N'https://picsum.photos/200', 3, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (839, N'Ürün - 839', N'Açıklama - 839', 954287, N'https://picsum.photos/200', 4, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (840, N'Ürün - 840', N'Açıklama - 840', 347034, N'https://picsum.photos/200', 8, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (841, N'Ürün - 841', N'Açıklama - 841', 138799, N'https://picsum.photos/200', 3, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (842, N'Ürün - 842', N'Açıklama - 842', 615392, N'https://picsum.photos/200', 2, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (843, N'Ürün - 843', N'Açıklama - 843', 564305, N'https://picsum.photos/200', 7, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (844, N'Ürün - 844', N'Açıklama - 844', 599021, N'https://picsum.photos/200', 6, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (845, N'Ürün - 845', N'Açıklama - 845', 556255, N'https://picsum.photos/200', 7, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (846, N'Ürün - 846', N'Açıklama - 846', 13297, N'https://picsum.photos/200', 5, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (847, N'Ürün - 847', N'Açıklama - 847', 762875, N'https://picsum.photos/200', 8, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (848, N'Ürün - 848', N'Açıklama - 848', 616028, N'https://picsum.photos/200', 5, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (849, N'Ürün - 849', N'Açıklama - 849', 102941, N'https://picsum.photos/200', 1, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (850, N'Ürün - 850', N'Açıklama - 850', 402573, N'https://picsum.photos/200', 7, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (851, N'Ürün - 851', N'Açıklama - 851', 573782, N'https://picsum.photos/200', 7, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (852, N'Ürün - 852', N'Açıklama - 852', 103505, N'https://picsum.photos/200', 2, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (853, N'Ürün - 853', N'Açıklama - 853', 975820, N'https://picsum.photos/200', 1, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (854, N'Ürün - 854', N'Açıklama - 854', 306584, N'https://picsum.photos/200', 1, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (855, N'Ürün - 855', N'Açıklama - 855', 792262, N'https://picsum.photos/200', 8, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (856, N'Ürün - 856', N'Açıklama - 856', 443117, N'https://picsum.photos/200', 7, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (857, N'Ürün - 857', N'Açıklama - 857', 308065, N'https://picsum.photos/200', 1, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (858, N'Ürün - 858', N'Açıklama - 858', 723344, N'https://picsum.photos/200', 2, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (859, N'Ürün - 859', N'Açıklama - 859', 273904, N'https://picsum.photos/200', 1, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (860, N'Ürün - 860', N'Açıklama - 860', 52770, N'https://picsum.photos/200', 3, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (861, N'Ürün - 861', N'Açıklama - 861', 525881, N'https://picsum.photos/200', 7, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (862, N'Ürün - 862', N'Açıklama - 862', 2558, N'https://picsum.photos/200', 7, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (863, N'Ürün - 863', N'Açıklama - 863', 278929, N'https://picsum.photos/200', 7, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (864, N'Ürün - 864', N'Açıklama - 864', 115364, N'https://picsum.photos/200', 3, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (865, N'Ürün - 865', N'Açıklama - 865', 253928, N'https://picsum.photos/200', 3, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (866, N'Ürün - 866', N'Açıklama - 866', 839717, N'https://picsum.photos/200', 6, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (867, N'Ürün - 867', N'Açıklama - 867', 101666, N'https://picsum.photos/200', 3, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (868, N'Ürün - 868', N'Açıklama - 868', 164823, N'https://picsum.photos/200', 6, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (869, N'Ürün - 869', N'Açıklama - 869', 955488, N'https://picsum.photos/200', 2, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (870, N'Ürün - 870', N'Açıklama - 870', 88561, N'https://picsum.photos/200', 5, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (871, N'Ürün - 871', N'Açıklama - 871', 936738, N'https://picsum.photos/200', 8, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (872, N'Ürün - 872', N'Açıklama - 872', 391665, N'https://picsum.photos/200', 6, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (873, N'Ürün - 873', N'Açıklama - 873', 687383, N'https://picsum.photos/200', 5, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (874, N'Ürün - 874', N'Açıklama - 874', 927977, N'https://picsum.photos/200', 6, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (875, N'Ürün - 875', N'Açıklama - 875', 602765, N'https://picsum.photos/200', 4, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (876, N'Ürün - 876', N'Açıklama - 876', 728132, N'https://picsum.photos/200', 2, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (877, N'Ürün - 877', N'Açıklama - 877', 253053, N'https://picsum.photos/200', 5, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (878, N'Ürün - 878', N'Açıklama - 878', 162656, N'https://picsum.photos/200', 4, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (879, N'Ürün - 879', N'Açıklama - 879', 643438, N'https://picsum.photos/200', 5, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (880, N'Ürün - 880', N'Açıklama - 880', 3391, N'https://picsum.photos/200', 8, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (881, N'Ürün - 881', N'Açıklama - 881', 296625, N'https://picsum.photos/200', 5, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (882, N'Ürün - 882', N'Açıklama - 882', 494708, N'https://picsum.photos/200', 7, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (883, N'Ürün - 883', N'Açıklama - 883', 689337, N'https://picsum.photos/200', 2, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (884, N'Ürün - 884', N'Açıklama - 884', 727098, N'https://picsum.photos/200', 7, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (885, N'Ürün - 885', N'Açıklama - 885', 530370, N'https://picsum.photos/200', 3, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (886, N'Ürün - 886', N'Açıklama - 886', 401794, N'https://picsum.photos/200', 7, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (887, N'Ürün - 887', N'Açıklama - 887', 277583, N'https://picsum.photos/200', 4, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (888, N'Ürün - 888', N'Açıklama - 888', 878973, N'https://picsum.photos/200', 3, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (889, N'Ürün - 889', N'Açıklama - 889', 825511, N'https://picsum.photos/200', 3, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (890, N'Ürün - 890', N'Açıklama - 890', 245864, N'https://picsum.photos/200', 1, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (891, N'Ürün - 891', N'Açıklama - 891', 978122, N'https://picsum.photos/200', 8, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (892, N'Ürün - 892', N'Açıklama - 892', 614030, N'https://picsum.photos/200', 3, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (893, N'Ürün - 893', N'Açıklama - 893', 857041, N'https://picsum.photos/200', 1, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (894, N'Ürün - 894', N'Açıklama - 894', 680968, N'https://picsum.photos/200', 2, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (895, N'Ürün - 895', N'Açıklama - 895', 353759, N'https://picsum.photos/200', 2, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (896, N'Ürün - 896', N'Açıklama - 896', 142865, N'https://picsum.photos/200', 2, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (897, N'Ürün - 897', N'Açıklama - 897', 424281, N'https://picsum.photos/200', 2, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (898, N'Ürün - 898', N'Açıklama - 898', 913454, N'https://picsum.photos/200', 6, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (899, N'Ürün - 899', N'Açıklama - 899', 3671, N'https://picsum.photos/200', 5, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (900, N'Ürün - 900', N'Açıklama - 900', 613626, N'https://picsum.photos/200', 4, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (901, N'Ürün - 901', N'Açıklama - 901', 344893, N'https://picsum.photos/200', 2, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (902, N'Ürün - 902', N'Açıklama - 902', 390952, N'https://picsum.photos/200', 4, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (903, N'Ürün - 903', N'Açıklama - 903', 649360, N'https://picsum.photos/200', 5, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (904, N'Ürün - 904', N'Açıklama - 904', 166082, N'https://picsum.photos/200', 8, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (905, N'Ürün - 905', N'Açıklama - 905', 511051, N'https://picsum.photos/200', 8, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (906, N'Ürün - 906', N'Açıklama - 906', 531910, N'https://picsum.photos/200', 5, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (907, N'Ürün - 907', N'Açıklama - 907', 444646, N'https://picsum.photos/200', 1, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (908, N'Ürün - 908', N'Açıklama - 908', 16725, N'https://picsum.photos/200', 4, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (909, N'Ürün - 909', N'Açıklama - 909', 616137, N'https://picsum.photos/200', 6, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (910, N'Ürün - 910', N'Açıklama - 910', 795735, N'https://picsum.photos/200', 2, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (911, N'Ürün - 911', N'Açıklama - 911', 507861, N'https://picsum.photos/200', 8, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (912, N'Ürün - 912', N'Açıklama - 912', 7408, N'https://picsum.photos/200', 5, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (913, N'Ürün - 913', N'Açıklama - 913', 195648, N'https://picsum.photos/200', 6, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (914, N'Ürün - 914', N'Açıklama - 914', 922451, N'https://picsum.photos/200', 4, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (915, N'Ürün - 915', N'Açıklama - 915', 482325, N'https://picsum.photos/200', 6, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (916, N'Ürün - 916', N'Açıklama - 916', 746862, N'https://picsum.photos/200', 7, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (917, N'Ürün - 917', N'Açıklama - 917', 857621, N'https://picsum.photos/200', 7, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (918, N'Ürün - 918', N'Açıklama - 918', 42511, N'https://picsum.photos/200', 4, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (919, N'Ürün - 919', N'Açıklama - 919', 55222, N'https://picsum.photos/200', 7, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (920, N'Ürün - 920', N'Açıklama - 920', 720068, N'https://picsum.photos/200', 7, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (921, N'Ürün - 921', N'Açıklama - 921', 646793, N'https://picsum.photos/200', 4, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (922, N'Ürün - 922', N'Açıklama - 922', 176967, N'https://picsum.photos/200', 2, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (923, N'Ürün - 923', N'Açıklama - 923', 420668, N'https://picsum.photos/200', 3, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (924, N'Ürün - 924', N'Açıklama - 924', 533661, N'https://picsum.photos/200', 3, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (925, N'Ürün - 925', N'Açıklama - 925', 590109, N'https://picsum.photos/200', 1, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (926, N'Ürün - 926', N'Açıklama - 926', 504633, N'https://picsum.photos/200', 7, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (927, N'Ürün - 927', N'Açıklama - 927', 714338, N'https://picsum.photos/200', 7, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (928, N'Ürün - 928', N'Açıklama - 928', 93292, N'https://picsum.photos/200', 4, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (929, N'Ürün - 929', N'Açıklama - 929', 272072, N'https://picsum.photos/200', 2, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (930, N'Ürün - 930', N'Açıklama - 930', 139370, N'https://picsum.photos/200', 2, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (931, N'Ürün - 931', N'Açıklama - 931', 207523, N'https://picsum.photos/200', 4, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (932, N'Ürün - 932', N'Açıklama - 932', 660224, N'https://picsum.photos/200', 4, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (933, N'Ürün - 933', N'Açıklama - 933', 907060, N'https://picsum.photos/200', 4, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (934, N'Ürün - 934', N'Açıklama - 934', 135620, N'https://picsum.photos/200', 2, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (935, N'Ürün - 935', N'Açıklama - 935', 661721, N'https://picsum.photos/200', 3, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (936, N'Ürün - 936', N'Açıklama - 936', 848658, N'https://picsum.photos/200', 6, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (937, N'Ürün - 937', N'Açıklama - 937', 740727, N'https://picsum.photos/200', 8, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (938, N'Ürün - 938', N'Açıklama - 938', 395495, N'https://picsum.photos/200', 3, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (939, N'Ürün - 939', N'Açıklama - 939', 422816, N'https://picsum.photos/200', 7, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (940, N'Ürün - 940', N'Açıklama - 940', 875091, N'https://picsum.photos/200', 2, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (941, N'Ürün - 941', N'Açıklama - 941', 474270, N'https://picsum.photos/200', 1, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (942, N'Ürün - 942', N'Açıklama - 942', 599288, N'https://picsum.photos/200', 2, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (943, N'Ürün - 943', N'Açıklama - 943', 161445, N'https://picsum.photos/200', 3, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (944, N'Ürün - 944', N'Açıklama - 944', 126540, N'https://picsum.photos/200', 5, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (945, N'Ürün - 945', N'Açıklama - 945', 688284, N'https://picsum.photos/200', 1, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (946, N'Ürün - 946', N'Açıklama - 946', 374416, N'https://picsum.photos/200', 1, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (947, N'Ürün - 947', N'Açıklama - 947', 571520, N'https://picsum.photos/200', 2, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (948, N'Ürün - 948', N'Açıklama - 948', 814448, N'https://picsum.photos/200', 4, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (949, N'Ürün - 949', N'Açıklama - 949', 654715, N'https://picsum.photos/200', 1, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (950, N'Ürün - 950', N'Açıklama - 950', 652275, N'https://picsum.photos/200', 1, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (951, N'Ürün - 951', N'Açıklama - 951', 434108, N'https://picsum.photos/200', 7, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (952, N'Ürün - 952', N'Açıklama - 952', 348655, N'https://picsum.photos/200', 5, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (953, N'Ürün - 953', N'Açıklama - 953', 155349, N'https://picsum.photos/200', 1, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (954, N'Ürün - 954', N'Açıklama - 954', 786557, N'https://picsum.photos/200', 3, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (955, N'Ürün - 955', N'Açıklama - 955', 94825, N'https://picsum.photos/200', 5, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (956, N'Ürün - 956', N'Açıklama - 956', 227288, N'https://picsum.photos/200', 1, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (957, N'Ürün - 957', N'Açıklama - 957', 133131, N'https://picsum.photos/200', 5, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (958, N'Ürün - 958', N'Açıklama - 958', 96196, N'https://picsum.photos/200', 7, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (959, N'Ürün - 959', N'Açıklama - 959', 300758, N'https://picsum.photos/200', 3, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (960, N'Ürün - 960', N'Açıklama - 960', 834593, N'https://picsum.photos/200', 3, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (961, N'Ürün - 961', N'Açıklama - 961', 204449, N'https://picsum.photos/200', 4, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (962, N'Ürün - 962', N'Açıklama - 962', 847997, N'https://picsum.photos/200', 8, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (963, N'Ürün - 963', N'Açıklama - 963', 679155, N'https://picsum.photos/200', 8, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (964, N'Ürün - 964', N'Açıklama - 964', 213825, N'https://picsum.photos/200', 6, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (965, N'Ürün - 965', N'Açıklama - 965', 570159, N'https://picsum.photos/200', 8, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (966, N'Ürün - 966', N'Açıklama - 966', 33544, N'https://picsum.photos/200', 4, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (967, N'Ürün - 967', N'Açıklama - 967', 802699, N'https://picsum.photos/200', 2, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (968, N'Ürün - 968', N'Açıklama - 968', 170211, N'https://picsum.photos/200', 6, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (969, N'Ürün - 969', N'Açıklama - 969', 201479, N'https://picsum.photos/200', 6, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (970, N'Ürün - 970', N'Açıklama - 970', 840175, N'https://picsum.photos/200', 2, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (971, N'Ürün - 971', N'Açıklama - 971', 865684, N'https://picsum.photos/200', 1, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (972, N'Ürün - 972', N'Açıklama - 972', 46714, N'https://picsum.photos/200', 6, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (973, N'Ürün - 973', N'Açıklama - 973', 119659, N'https://picsum.photos/200', 8, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (974, N'Ürün - 974', N'Açıklama - 974', 385568, N'https://picsum.photos/200', 1, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (975, N'Ürün - 975', N'Açıklama - 975', 705359, N'https://picsum.photos/200', 5, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (976, N'Ürün - 976', N'Açıklama - 976', 674314, N'https://picsum.photos/200', 3, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (977, N'Ürün - 977', N'Açıklama - 977', 466959, N'https://picsum.photos/200', 2, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (978, N'Ürün - 978', N'Açıklama - 978', 815999, N'https://picsum.photos/200', 5, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (979, N'Ürün - 979', N'Açıklama - 979', 610774, N'https://picsum.photos/200', 6, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (980, N'Ürün - 980', N'Açıklama - 980', 119337, N'https://picsum.photos/200', 6, 8)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (981, N'Ürün - 981', N'Açıklama - 981', 118289, N'https://picsum.photos/200', 8, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (982, N'Ürün - 982', N'Açıklama - 982', 371838, N'https://picsum.photos/200', 3, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (983, N'Ürün - 983', N'Açıklama - 983', 136827, N'https://picsum.photos/200', 6, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (984, N'Ürün - 984', N'Açıklama - 984', 882242, N'https://picsum.photos/200', 1, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (985, N'Ürün - 985', N'Açıklama - 985', 165657, N'https://picsum.photos/200', 4, 6)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (986, N'Ürün - 986', N'Açıklama - 986', 475583, N'https://picsum.photos/200', 7, 9)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (987, N'Ürün - 987', N'Açıklama - 987', 616316, N'https://picsum.photos/200', 2, 7)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (988, N'Ürün - 988', N'Açıklama - 988', 463296, N'https://picsum.photos/200', 8, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (989, N'Ürün - 989', N'Açıklama - 989', 241305, N'https://picsum.photos/200', 1, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (990, N'Ürün - 990', N'Açıklama - 990', 529602, N'https://picsum.photos/200', 6, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (991, N'Ürün - 991', N'Açıklama - 991', 369369, N'https://picsum.photos/200', 5, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (992, N'Ürün - 992', N'Açıklama - 992', 7403, N'https://picsum.photos/200', 8, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (993, N'Ürün - 993', N'Açıklama - 993', 763028, N'https://picsum.photos/200', 6, 13)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (994, N'Ürün - 994', N'Açıklama - 994', 39005, N'https://picsum.photos/200', 3, 14)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (995, N'Ürün - 995', N'Açıklama - 995', 778041, N'https://picsum.photos/200', 1, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (996, N'Ürün - 996', N'Açıklama - 996', 449380, N'https://picsum.photos/200', 2, 10)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (997, N'Ürün - 997', N'Açıklama - 997', 133757, N'https://picsum.photos/200', 7, 11)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (998, N'Ürün - 998', N'Açıklama - 998', 459834, N'https://picsum.photos/200', 4, 12)
GO
INSERT [dbo].[Products] ([Id], [Name], [Describtions], [Price], [ImageURl], [SubCategoryId], [UserId]) VALUES (999, N'Ürün - 999', N'Açıklama - 999', 210289, N'https://picsum.photos/200', 5, 6)
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductFeatures] ON 
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1, 1, 64)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2, 1, 66)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (3, 2, 65)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (4, 2, 67)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (5, 3, 69)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (6, 3, 72)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (7, 4, 75)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (8, 5, 39)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (9, 5, 42)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (10, 6, 39)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (11, 6, 42)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (12, 7, 49)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (13, 7, 52)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (14, 8, 46)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (15, 8, 54)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (16, 9, 58)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (17, 9, 60)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (18, 10, 76)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (19, 11, 65)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (20, 11, 66)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (21, 12, 75)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (22, 13, 65)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (23, 13, 67)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (24, 14, 35)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (25, 14, 40)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (26, 15, 64)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (27, 15, 66)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (28, 16, 22)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (29, 16, 29)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (30, 16, 32)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (31, 17, 36)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (32, 17, 43)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (33, 18, 65)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (34, 18, 68)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (35, 19, 26)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (36, 19, 27)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (37, 19, 31)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (38, 20, 63)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (39, 20, 67)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (40, 21, 39)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (41, 21, 42)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (42, 22, 69)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (43, 22, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (44, 23, 7)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (45, 23, 11)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (46, 23, 17)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (47, 24, 3)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (48, 24, 9)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (49, 24, 20)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (50, 25, 49)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (51, 25, 53)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (52, 26, 4)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (53, 26, 9)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (54, 26, 19)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (55, 27, 25)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (56, 27, 29)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (57, 27, 31)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (58, 28, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (59, 28, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (60, 29, 38)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (61, 29, 43)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (62, 30, 49)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (63, 30, 55)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (64, 31, 64)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (65, 31, 67)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (66, 32, 7)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (67, 32, 14)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (68, 32, 19)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (69, 33, 22)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (70, 33, 30)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (71, 33, 34)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (72, 34, 25)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (73, 34, 29)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (74, 34, 33)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (75, 35, 38)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (76, 35, 44)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (77, 36, 22)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (78, 36, 27)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (79, 36, 33)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (80, 37, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (81, 37, 72)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (82, 38, 3)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (83, 38, 15)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (84, 38, 21)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (85, 39, 48)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (86, 39, 52)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (87, 40, 73)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (88, 41, 39)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (89, 41, 43)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (90, 42, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (91, 42, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (92, 43, 24)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (93, 43, 30)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (94, 43, 32)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (95, 44, 50)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (96, 44, 51)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (97, 45, 59)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (98, 45, 60)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (99, 46, 63)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (100, 46, 68)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (101, 47, 57)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (102, 47, 60)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (103, 48, 65)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (104, 48, 67)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (105, 49, 50)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (106, 49, 52)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (107, 50, 74)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (108, 51, 64)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (109, 51, 68)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (110, 52, 3)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (111, 52, 13)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (112, 52, 18)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (113, 53, 65)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (114, 53, 67)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (115, 54, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (116, 54, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (117, 55, 64)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (118, 55, 66)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (119, 56, 48)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (120, 56, 52)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (121, 57, 25)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (122, 57, 28)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (123, 57, 34)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (124, 58, 36)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (125, 58, 44)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (126, 59, 64)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (127, 59, 66)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (128, 60, 25)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (129, 60, 30)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (130, 60, 32)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (131, 61, 48)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (132, 61, 55)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (133, 62, 35)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (134, 62, 42)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (135, 63, 26)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (136, 63, 27)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (137, 63, 31)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (138, 64, 3)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (139, 64, 15)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (140, 64, 20)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (141, 65, 75)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (142, 66, 75)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (143, 67, 6)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (144, 67, 9)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (145, 67, 21)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (146, 68, 63)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (147, 68, 67)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (148, 69, 58)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (149, 69, 61)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (150, 70, 26)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (151, 70, 30)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (152, 70, 32)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (153, 71, 5)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (154, 71, 10)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (155, 71, 19)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (156, 72, 48)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (157, 72, 53)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (158, 73, 26)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (159, 73, 28)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (160, 73, 34)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (161, 74, 56)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (162, 74, 62)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (163, 75, 63)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (164, 75, 67)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (165, 76, 23)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (166, 76, 29)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (167, 76, 31)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (168, 77, 57)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (169, 77, 60)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (170, 78, 8)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (171, 78, 11)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (172, 78, 20)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (173, 79, 58)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (174, 79, 62)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (175, 80, 25)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (176, 80, 29)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (177, 80, 33)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (178, 81, 75)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (179, 82, 1)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (180, 82, 11)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (181, 82, 21)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (182, 83, 74)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (183, 84, 22)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (184, 84, 27)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (185, 84, 33)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (186, 85, 73)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (187, 86, 8)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (188, 86, 11)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (189, 86, 21)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (190, 87, 74)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (191, 88, 69)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (192, 88, 72)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (193, 89, 63)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (194, 89, 68)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (195, 90, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (196, 90, 72)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (197, 91, 75)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (198, 92, 7)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (199, 92, 13)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (200, 92, 19)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (201, 93, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (202, 93, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (203, 94, 5)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (204, 94, 14)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (205, 94, 17)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (206, 95, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (207, 95, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (208, 96, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (209, 96, 72)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (210, 97, 69)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (211, 97, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (212, 98, 7)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (213, 98, 10)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (214, 98, 21)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (215, 99, 74)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (216, 100, 58)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (217, 100, 61)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (218, 101, 64)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (219, 101, 67)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (220, 102, 26)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (221, 102, 28)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (222, 102, 33)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (223, 103, 59)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (224, 103, 61)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (225, 104, 39)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (226, 104, 45)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (227, 105, 50)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (228, 105, 54)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (229, 106, 73)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (230, 107, 69)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (231, 107, 72)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (232, 108, 58)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (233, 108, 60)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (234, 109, 50)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (235, 109, 52)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (236, 110, 6)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (237, 110, 9)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (238, 110, 17)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (239, 111, 73)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (240, 112, 23)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (241, 112, 28)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (242, 112, 31)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (243, 113, 7)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (244, 113, 12)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (245, 113, 19)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (246, 114, 1)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (247, 114, 15)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (248, 114, 19)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (249, 115, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (250, 115, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (251, 116, 59)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (252, 116, 62)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (253, 117, 58)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (254, 117, 62)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (255, 118, 7)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (256, 118, 15)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (257, 118, 20)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (258, 119, 65)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (259, 119, 68)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (260, 120, 5)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (261, 120, 14)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (262, 120, 21)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (263, 121, 26)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (264, 121, 30)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (265, 121, 32)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (266, 122, 26)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (267, 122, 30)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (268, 122, 31)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (269, 123, 26)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (270, 123, 30)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (271, 123, 34)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (272, 124, 69)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (273, 124, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (274, 125, 4)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (275, 125, 13)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (276, 125, 21)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (277, 126, 24)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (278, 126, 28)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (279, 126, 32)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (280, 127, 75)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (281, 128, 5)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (282, 128, 10)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (283, 128, 19)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (284, 129, 56)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (285, 129, 61)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (286, 130, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (287, 130, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (288, 131, 6)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (289, 131, 9)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (290, 131, 19)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (291, 132, 76)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (292, 133, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (293, 133, 72)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (294, 134, 25)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (295, 134, 30)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (296, 134, 33)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (297, 135, 63)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (298, 135, 67)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (299, 136, 64)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (300, 136, 68)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (301, 137, 5)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (302, 137, 13)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (303, 137, 18)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (304, 138, 76)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (305, 139, 46)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (306, 139, 51)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (307, 140, 49)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (308, 140, 52)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (309, 141, 74)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (310, 142, 65)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (311, 142, 68)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (312, 143, 46)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (313, 143, 54)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (314, 144, 76)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (315, 145, 1)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (316, 145, 14)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (317, 145, 17)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (318, 146, 23)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (319, 146, 28)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (320, 146, 33)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (321, 147, 23)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (322, 147, 27)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (323, 147, 31)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (324, 148, 65)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (325, 148, 68)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (326, 149, 69)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (327, 149, 72)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (328, 150, 7)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (329, 150, 13)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (330, 150, 19)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (331, 151, 26)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (332, 151, 30)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (333, 151, 34)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (334, 152, 5)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (335, 152, 16)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (336, 152, 20)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (337, 153, 36)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (338, 153, 40)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (339, 154, 22)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (340, 154, 28)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (341, 154, 31)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (342, 155, 49)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (343, 155, 54)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (344, 156, 56)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (345, 156, 62)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (346, 157, 36)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (347, 157, 41)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (348, 158, 48)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (349, 158, 51)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (350, 159, 56)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (351, 159, 60)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (352, 160, 56)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (353, 160, 62)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (354, 161, 8)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (355, 161, 14)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (356, 161, 17)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (357, 162, 73)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (358, 163, 49)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (359, 163, 52)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (360, 164, 63)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (361, 164, 67)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (362, 165, 22)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (363, 165, 29)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (364, 165, 31)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (365, 166, 75)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (366, 167, 26)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (367, 167, 27)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (368, 167, 34)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (369, 168, 22)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (370, 168, 30)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (371, 168, 34)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (372, 169, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (373, 169, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (374, 170, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (375, 170, 72)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (376, 171, 75)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (377, 172, 59)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (378, 172, 61)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (379, 173, 25)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (380, 173, 30)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (381, 173, 32)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (382, 174, 23)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (383, 174, 28)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (384, 174, 31)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (385, 175, 74)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (386, 176, 25)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (387, 176, 27)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (388, 176, 34)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (389, 177, 75)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (390, 178, 69)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (391, 178, 72)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (392, 179, 69)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (393, 179, 72)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (394, 180, 38)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (395, 180, 42)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (396, 181, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (397, 181, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (398, 182, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (399, 182, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (400, 183, 2)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (401, 183, 14)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (402, 183, 17)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (403, 184, 26)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (404, 184, 30)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (405, 184, 33)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (406, 185, 59)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (407, 185, 60)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (408, 186, 3)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (409, 186, 10)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (410, 186, 20)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (411, 187, 64)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (412, 187, 66)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (413, 188, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (414, 188, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (415, 189, 73)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (416, 190, 37)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (417, 190, 45)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (418, 191, 76)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (419, 192, 6)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (420, 192, 12)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (421, 192, 19)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (422, 193, 65)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (423, 193, 68)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (424, 194, 48)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (425, 194, 52)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (426, 195, 76)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (427, 196, 49)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (428, 196, 55)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (429, 197, 25)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (430, 197, 28)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (431, 197, 33)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (432, 198, 1)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (433, 198, 13)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (434, 198, 19)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (435, 199, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (436, 199, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (437, 200, 35)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (438, 200, 42)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (439, 201, 57)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (440, 201, 61)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (441, 202, 59)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (442, 202, 61)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (443, 203, 8)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (444, 203, 14)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (445, 203, 17)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (446, 204, 2)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (447, 204, 11)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (448, 204, 17)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (449, 205, 22)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (450, 205, 30)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (451, 205, 32)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (452, 206, 50)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (453, 206, 54)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (454, 207, 56)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (455, 207, 61)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (456, 208, 47)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (457, 208, 52)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (458, 209, 64)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (459, 209, 67)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (460, 210, 76)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (461, 211, 36)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (462, 211, 40)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (463, 212, 57)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (464, 212, 60)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (465, 213, 24)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (466, 213, 27)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (467, 213, 31)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (468, 214, 1)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (469, 214, 15)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (470, 214, 20)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (471, 215, 57)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (472, 215, 62)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (473, 216, 22)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (474, 216, 27)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (475, 216, 32)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (476, 217, 65)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (477, 217, 68)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (478, 218, 63)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (479, 218, 66)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (480, 219, 63)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (481, 219, 67)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (482, 220, 2)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (483, 220, 15)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (484, 220, 19)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (485, 221, 58)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (486, 221, 62)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (487, 222, 38)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (488, 222, 44)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (489, 223, 24)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (490, 223, 27)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (491, 223, 34)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (492, 224, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (493, 224, 72)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (494, 225, 35)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (495, 225, 40)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (496, 226, 58)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (497, 226, 60)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (498, 227, 3)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (499, 227, 10)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (500, 227, 17)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (501, 228, 3)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (502, 228, 13)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (503, 228, 19)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (504, 229, 50)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (505, 229, 51)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (506, 230, 58)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (507, 230, 62)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (508, 231, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (509, 231, 72)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (510, 232, 63)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (511, 232, 66)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (512, 233, 69)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (513, 233, 72)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (514, 234, 47)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (515, 234, 53)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (516, 235, 65)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (517, 235, 66)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (518, 236, 73)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (519, 237, 57)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (520, 237, 60)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (521, 238, 46)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (522, 238, 53)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (523, 239, 7)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (524, 239, 13)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (525, 239, 20)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (526, 240, 39)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (527, 240, 42)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (528, 241, 37)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (529, 241, 40)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (530, 242, 36)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (531, 242, 41)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (532, 243, 4)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (533, 243, 12)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (534, 243, 19)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (535, 244, 75)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (536, 245, 64)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (537, 245, 68)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (538, 246, 3)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (539, 246, 9)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (540, 246, 18)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (541, 247, 36)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (542, 247, 45)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (543, 248, 64)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (544, 248, 67)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (545, 249, 56)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (546, 249, 62)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (547, 250, 22)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (548, 250, 29)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (549, 250, 31)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (550, 251, 63)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (551, 251, 67)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (552, 252, 63)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (553, 252, 66)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (554, 253, 58)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (555, 253, 62)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (556, 254, 48)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (557, 254, 52)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (558, 255, 64)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (559, 255, 67)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (560, 256, 57)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (561, 256, 60)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (562, 257, 69)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (563, 257, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (564, 258, 69)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (565, 258, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (566, 259, 73)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (567, 260, 39)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (568, 260, 44)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (569, 261, 65)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (570, 261, 68)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (571, 262, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (572, 262, 72)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (573, 263, 48)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (574, 263, 55)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (575, 264, 75)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (576, 265, 23)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (577, 265, 28)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (578, 265, 31)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (579, 266, 50)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (580, 266, 52)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (581, 267, 25)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (582, 267, 29)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (583, 267, 33)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (584, 268, 37)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (585, 268, 42)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (586, 269, 39)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (587, 269, 43)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (588, 270, 50)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (589, 270, 53)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (590, 271, 58)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (591, 271, 61)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (592, 272, 38)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (593, 272, 44)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (594, 273, 58)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (595, 273, 60)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (596, 274, 63)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (597, 274, 67)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (598, 275, 35)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (599, 275, 44)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (600, 276, 58)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (601, 276, 62)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (602, 277, 24)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (603, 277, 28)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (604, 277, 32)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (605, 278, 65)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (606, 278, 68)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (607, 279, 2)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (608, 279, 10)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (609, 279, 18)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (610, 280, 58)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (611, 280, 60)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (612, 281, 74)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (613, 282, 36)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (614, 282, 44)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (615, 283, 5)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (616, 283, 15)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (617, 283, 18)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (618, 284, 58)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (619, 284, 62)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (620, 285, 69)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (621, 285, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (622, 286, 26)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (623, 286, 30)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (624, 286, 31)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (625, 287, 46)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (626, 287, 53)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (627, 288, 23)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (628, 288, 27)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (629, 288, 31)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (630, 289, 23)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (631, 289, 27)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (632, 289, 33)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (633, 290, 59)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (634, 290, 62)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (635, 291, 65)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (636, 291, 67)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (637, 292, 48)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (638, 292, 54)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (639, 293, 46)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (640, 293, 55)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (641, 294, 38)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (642, 294, 43)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (643, 295, 48)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (644, 295, 53)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (645, 296, 39)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (646, 296, 41)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (647, 297, 69)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (648, 297, 72)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (649, 298, 5)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (650, 298, 11)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (651, 298, 20)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (652, 299, 3)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (653, 299, 10)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (654, 299, 20)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (655, 300, 76)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (656, 301, 69)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (657, 301, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (658, 302, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (659, 302, 72)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (660, 303, 7)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (661, 303, 15)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (662, 303, 20)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (663, 304, 22)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (664, 304, 29)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (665, 304, 32)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (666, 305, 63)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (667, 305, 67)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (668, 306, 4)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (669, 306, 9)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (670, 306, 17)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (671, 307, 24)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (672, 307, 28)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (673, 307, 34)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (674, 308, 38)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (675, 308, 44)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (676, 309, 35)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (677, 309, 41)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (678, 310, 75)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (679, 311, 49)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (680, 311, 54)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (681, 312, 5)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (682, 312, 12)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (683, 312, 20)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (684, 313, 37)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (685, 313, 44)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (686, 314, 73)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (687, 315, 25)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (688, 315, 30)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (689, 315, 34)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (690, 316, 23)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (691, 316, 30)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (692, 316, 34)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (693, 317, 26)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (694, 317, 27)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (695, 317, 31)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (696, 318, 69)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (697, 318, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (698, 319, 48)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (699, 319, 51)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (700, 320, 35)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (701, 320, 44)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (702, 321, 22)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (703, 321, 28)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (704, 321, 33)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (705, 322, 64)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (706, 322, 66)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (707, 323, 38)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (708, 323, 43)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (709, 324, 38)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (710, 324, 44)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (711, 325, 73)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (712, 326, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (713, 326, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (714, 327, 48)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (715, 327, 54)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (716, 328, 26)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (717, 328, 28)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (718, 328, 33)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (719, 329, 57)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (720, 329, 61)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (721, 330, 26)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (722, 330, 29)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (723, 330, 34)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (724, 331, 69)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (725, 331, 72)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (726, 332, 74)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (727, 333, 73)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (728, 334, 56)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (729, 334, 62)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (730, 335, 25)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (731, 335, 30)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (732, 335, 34)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (733, 336, 6)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (734, 336, 16)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (735, 336, 21)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (736, 337, 22)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (737, 337, 27)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (738, 337, 33)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (739, 338, 46)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (740, 338, 55)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (741, 339, 6)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (742, 339, 14)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (743, 339, 17)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (744, 340, 58)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (745, 340, 62)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (746, 341, 63)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (747, 341, 67)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (748, 342, 76)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (749, 343, 75)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (750, 344, 37)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (751, 344, 42)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (752, 345, 63)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (753, 345, 67)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (754, 346, 50)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (755, 346, 53)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (756, 347, 37)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (757, 347, 43)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (758, 348, 25)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (759, 348, 28)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (760, 348, 31)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (761, 349, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (762, 349, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (763, 350, 22)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (764, 350, 29)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (765, 350, 33)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (766, 351, 36)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (767, 351, 42)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (768, 352, 73)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (769, 353, 1)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (770, 353, 12)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (771, 353, 18)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (772, 354, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (773, 354, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (774, 355, 74)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (775, 356, 63)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (776, 356, 68)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (777, 357, 36)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (778, 357, 43)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (779, 358, 1)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (780, 358, 12)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (781, 358, 18)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (782, 359, 47)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (783, 359, 53)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (784, 360, 56)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (785, 360, 62)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (786, 361, 69)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (787, 361, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (788, 362, 69)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (789, 362, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (790, 363, 4)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (791, 363, 16)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (792, 363, 17)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (793, 364, 48)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (794, 364, 51)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (795, 365, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (796, 365, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (797, 366, 22)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (798, 366, 29)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (799, 366, 34)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (800, 367, 64)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (801, 367, 67)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (802, 368, 76)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (803, 369, 74)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (804, 370, 75)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (805, 371, 4)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (806, 371, 13)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (807, 371, 19)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (808, 372, 47)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (809, 372, 52)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (810, 373, 63)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (811, 373, 68)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (812, 374, 2)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (813, 374, 13)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (814, 374, 17)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (815, 375, 38)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (816, 375, 44)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (817, 376, 25)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (818, 376, 30)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (819, 376, 33)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (820, 377, 74)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (821, 378, 5)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (822, 378, 10)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (823, 378, 20)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (824, 379, 26)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (825, 379, 29)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (826, 379, 32)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (827, 380, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (828, 380, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (829, 381, 25)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (830, 381, 28)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (831, 381, 33)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (832, 382, 22)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (833, 382, 27)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (834, 382, 34)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (835, 383, 47)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (836, 383, 51)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (837, 384, 49)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (838, 384, 53)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (839, 385, 74)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (840, 386, 25)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (841, 386, 29)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (842, 386, 31)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (843, 387, 64)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (844, 387, 67)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (845, 388, 39)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (846, 388, 42)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (847, 389, 69)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (848, 389, 72)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (849, 390, 59)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (850, 390, 61)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (851, 391, 38)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (852, 391, 44)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (853, 392, 47)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (854, 392, 51)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (855, 393, 5)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (856, 393, 10)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (857, 393, 18)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (858, 394, 65)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (859, 394, 68)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (860, 395, 26)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (861, 395, 30)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (862, 395, 32)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (863, 396, 6)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (864, 396, 15)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (865, 396, 17)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (866, 397, 57)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (867, 397, 61)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (868, 398, 73)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (869, 399, 26)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (870, 399, 29)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (871, 399, 32)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (872, 400, 73)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (873, 401, 56)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (874, 401, 61)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (875, 402, 56)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (876, 402, 62)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (877, 403, 76)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (878, 404, 36)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (879, 404, 41)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (880, 405, 38)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (881, 405, 44)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (882, 406, 65)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (883, 406, 66)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (884, 407, 39)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (885, 407, 41)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (886, 408, 38)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (887, 408, 43)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (888, 409, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (889, 409, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (890, 410, 56)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (891, 410, 62)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (892, 411, 75)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (893, 412, 74)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (894, 413, 59)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (895, 413, 60)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (896, 414, 1)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (897, 414, 12)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (898, 414, 17)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (899, 415, 1)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (900, 415, 14)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (901, 415, 20)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (902, 416, 57)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (903, 416, 60)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (904, 417, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (905, 417, 72)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (906, 418, 36)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (907, 418, 42)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (908, 419, 63)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (909, 419, 67)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (910, 420, 35)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (911, 420, 44)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (912, 421, 6)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (913, 421, 10)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (914, 421, 19)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (915, 422, 59)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (916, 422, 61)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (917, 423, 47)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (918, 423, 51)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (919, 424, 56)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (920, 424, 60)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (921, 425, 2)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (922, 425, 11)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (923, 425, 21)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (924, 426, 25)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (925, 426, 27)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (926, 426, 33)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (927, 427, 69)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (928, 427, 72)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (929, 428, 74)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (930, 429, 22)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (931, 429, 28)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (932, 429, 32)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (933, 430, 47)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (934, 430, 51)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (935, 431, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (936, 431, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (937, 432, 58)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (938, 432, 60)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (939, 433, 59)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (940, 433, 60)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (941, 434, 35)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (942, 434, 45)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (943, 435, 22)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (944, 435, 28)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (945, 435, 34)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (946, 436, 73)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (947, 437, 59)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (948, 437, 61)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (949, 438, 63)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (950, 438, 67)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (951, 439, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (952, 439, 72)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (953, 440, 59)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (954, 440, 62)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (955, 441, 65)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (956, 441, 67)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (957, 442, 74)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (958, 443, 73)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (959, 444, 35)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (960, 444, 45)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (961, 445, 50)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (962, 445, 51)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (963, 446, 56)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (964, 446, 60)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (965, 447, 49)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (966, 447, 54)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (967, 448, 69)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (968, 448, 72)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (969, 449, 3)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (970, 449, 10)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (971, 449, 20)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (972, 450, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (973, 450, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (974, 451, 23)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (975, 451, 28)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (976, 451, 32)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (977, 452, 64)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (978, 452, 68)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (979, 453, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (980, 453, 72)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (981, 454, 24)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (982, 454, 29)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (983, 454, 31)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (984, 455, 63)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (985, 455, 68)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (986, 456, 23)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (987, 456, 30)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (988, 456, 32)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (989, 457, 76)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (990, 458, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (991, 458, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (992, 459, 65)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (993, 459, 67)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (994, 460, 64)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (995, 460, 68)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (996, 461, 69)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (997, 461, 72)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (998, 462, 23)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (999, 462, 30)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1000, 462, 34)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1001, 463, 75)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1002, 464, 39)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1003, 464, 45)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1004, 465, 1)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1005, 465, 12)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1006, 465, 21)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1007, 466, 69)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1008, 466, 72)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1009, 467, 56)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1010, 467, 61)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1011, 468, 25)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1012, 468, 28)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1013, 468, 31)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1014, 469, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1015, 469, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1016, 470, 64)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1017, 470, 68)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1018, 471, 73)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1019, 472, 49)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1020, 472, 53)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1021, 473, 49)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1022, 473, 52)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1023, 474, 65)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1024, 474, 67)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1025, 475, 58)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1026, 475, 60)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1027, 476, 7)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1028, 476, 12)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1029, 476, 20)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1030, 477, 75)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1031, 478, 63)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1032, 478, 66)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1033, 479, 75)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1034, 480, 74)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1035, 481, 59)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1036, 481, 60)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1037, 482, 48)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1038, 482, 52)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1039, 483, 48)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1040, 483, 51)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1041, 484, 7)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1042, 484, 11)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1043, 484, 19)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1044, 485, 63)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1045, 485, 68)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1046, 486, 63)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1047, 486, 68)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1048, 487, 57)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1049, 487, 60)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1050, 488, 63)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1051, 488, 67)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1052, 489, 56)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1053, 489, 60)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1054, 490, 1)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1055, 490, 10)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1056, 490, 20)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1057, 491, 49)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1058, 491, 51)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1059, 492, 69)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1060, 492, 72)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1061, 493, 74)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1062, 494, 76)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1063, 495, 25)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1064, 495, 29)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1065, 495, 34)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1066, 496, 37)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1067, 496, 40)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1068, 497, 25)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1069, 497, 27)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1070, 497, 33)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1071, 498, 3)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1072, 498, 11)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1073, 498, 21)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1074, 499, 37)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1075, 499, 45)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1076, 500, 75)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1077, 501, 6)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1078, 501, 9)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1079, 501, 19)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1080, 502, 3)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1081, 502, 12)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1082, 502, 18)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1083, 503, 47)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1084, 503, 52)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1085, 504, 57)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1086, 504, 61)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1087, 505, 64)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1088, 505, 66)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1089, 506, 64)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1090, 506, 68)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1091, 507, 69)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1092, 507, 72)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1093, 508, 47)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1094, 508, 53)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1095, 509, 73)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1096, 510, 49)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1097, 510, 53)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1098, 511, 38)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1099, 511, 45)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1100, 512, 38)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1101, 512, 42)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1102, 513, 1)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1103, 513, 12)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1104, 513, 17)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1105, 514, 63)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1106, 514, 66)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1107, 515, 56)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1108, 515, 60)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1109, 516, 46)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1110, 516, 53)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1111, 517, 47)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1112, 517, 52)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1113, 518, 73)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1114, 519, 4)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1115, 519, 10)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1116, 519, 20)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1117, 520, 65)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1118, 520, 68)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1119, 521, 63)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1120, 521, 66)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1121, 522, 64)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1122, 522, 68)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1123, 523, 22)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1124, 523, 29)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1125, 523, 33)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1126, 524, 26)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1127, 524, 30)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1128, 524, 34)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1129, 525, 64)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1130, 525, 67)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1131, 526, 6)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1132, 526, 13)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1133, 526, 21)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1134, 527, 26)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1135, 527, 29)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1136, 527, 31)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1137, 528, 35)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1138, 528, 40)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1139, 529, 74)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1140, 530, 23)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1141, 530, 29)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1142, 530, 32)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1143, 531, 50)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1144, 531, 53)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1145, 532, 69)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1146, 532, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1147, 533, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1148, 533, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1149, 534, 23)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1150, 534, 28)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1151, 534, 34)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1152, 535, 59)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1153, 535, 61)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1154, 536, 56)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1155, 536, 61)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1156, 537, 73)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1157, 538, 63)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1158, 538, 68)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1159, 539, 75)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1160, 540, 59)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1161, 540, 60)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1162, 541, 65)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1163, 541, 66)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1164, 542, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1165, 542, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1166, 543, 49)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1167, 543, 54)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1168, 544, 69)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1169, 544, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1170, 545, 23)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1171, 545, 30)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1172, 545, 33)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1173, 546, 23)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1174, 546, 27)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1175, 546, 34)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1176, 547, 75)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1177, 548, 49)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1178, 548, 55)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1179, 549, 65)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1180, 549, 67)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1181, 550, 4)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1182, 550, 11)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1183, 550, 21)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1184, 551, 36)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1185, 551, 40)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1186, 552, 59)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1187, 552, 62)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1188, 553, 63)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1189, 553, 66)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1190, 554, 37)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1191, 554, 42)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1192, 555, 59)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1193, 555, 60)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1194, 556, 7)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1195, 556, 15)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1196, 556, 20)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1197, 557, 46)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1198, 557, 52)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1199, 558, 4)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1200, 558, 10)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1201, 558, 17)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1202, 559, 7)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1203, 559, 9)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1204, 559, 17)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1205, 560, 65)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1206, 560, 66)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1207, 561, 76)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1208, 562, 48)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1209, 562, 55)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1210, 563, 65)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1211, 563, 67)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1212, 564, 48)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1213, 564, 53)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1214, 565, 76)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1215, 566, 6)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1216, 566, 10)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1217, 566, 17)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1218, 567, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1219, 567, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1220, 568, 74)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1221, 569, 57)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1222, 569, 62)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1223, 570, 26)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1224, 570, 28)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1225, 570, 33)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1226, 571, 37)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1227, 571, 43)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1228, 572, 47)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1229, 572, 55)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1230, 573, 63)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1231, 573, 68)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1232, 574, 56)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1233, 574, 60)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1234, 575, 23)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1235, 575, 27)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1236, 575, 33)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1237, 576, 36)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1238, 576, 40)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1239, 577, 73)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1240, 578, 59)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1241, 578, 61)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1242, 579, 59)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1243, 579, 62)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1244, 580, 59)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1245, 580, 60)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1246, 581, 2)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1247, 581, 16)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1248, 581, 17)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1249, 582, 23)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1250, 582, 28)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1251, 582, 31)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1252, 583, 69)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1253, 583, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1254, 584, 23)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1255, 584, 30)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1256, 584, 33)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1257, 585, 24)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1258, 585, 27)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1259, 585, 32)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1260, 586, 38)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1261, 586, 45)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1262, 587, 73)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1263, 588, 74)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1264, 589, 39)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1265, 589, 40)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1266, 590, 38)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1267, 590, 45)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1268, 591, 50)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1269, 591, 55)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1270, 592, 23)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1271, 592, 27)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1272, 592, 34)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1273, 593, 22)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1274, 593, 28)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1275, 593, 32)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1276, 594, 76)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1277, 595, 1)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1278, 595, 9)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1279, 595, 18)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1280, 596, 38)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1281, 596, 44)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1282, 597, 26)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1283, 597, 29)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1284, 597, 31)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1285, 598, 63)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1286, 598, 68)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1287, 599, 25)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1288, 599, 29)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1289, 599, 31)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1290, 600, 75)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1291, 601, 57)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1292, 601, 60)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1293, 602, 26)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1294, 602, 27)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1295, 602, 33)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1296, 603, 23)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1297, 603, 30)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1298, 603, 31)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1299, 604, 64)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1300, 604, 68)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1301, 605, 50)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1302, 605, 51)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1303, 606, 2)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1304, 606, 11)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1305, 606, 17)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1306, 607, 74)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1307, 608, 38)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1308, 608, 41)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1309, 609, 1)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1310, 609, 9)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1311, 609, 19)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1312, 610, 5)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1313, 610, 12)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1314, 610, 19)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1315, 611, 74)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1316, 612, 26)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1317, 612, 30)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1318, 612, 31)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1319, 613, 74)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1320, 614, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1321, 614, 72)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1322, 615, 76)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1323, 616, 69)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1324, 616, 72)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1325, 617, 22)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1326, 617, 29)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1327, 617, 32)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1328, 618, 49)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1329, 618, 54)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1330, 619, 7)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1331, 619, 10)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1332, 619, 17)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1333, 620, 65)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1334, 620, 68)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1335, 621, 63)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1336, 621, 66)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1337, 622, 59)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1338, 622, 60)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1339, 623, 69)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1340, 623, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1341, 624, 39)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1342, 624, 42)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1343, 625, 63)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1344, 625, 68)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1345, 626, 8)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1346, 626, 10)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1347, 626, 20)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1348, 627, 76)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1349, 628, 47)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1350, 628, 51)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1351, 629, 22)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1352, 629, 29)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1353, 629, 34)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1354, 630, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1355, 630, 72)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1356, 631, 50)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1357, 631, 52)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1358, 632, 24)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1359, 632, 30)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1360, 632, 33)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1361, 633, 58)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1362, 633, 62)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1363, 634, 63)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1364, 634, 68)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1365, 635, 76)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1366, 636, 48)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1367, 636, 55)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1368, 637, 24)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1369, 637, 29)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1370, 637, 33)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1371, 638, 26)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1372, 638, 30)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1373, 638, 32)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1374, 639, 64)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1375, 639, 66)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1376, 640, 49)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1377, 640, 55)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1378, 641, 64)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1379, 641, 68)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1380, 642, 8)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1381, 642, 15)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1382, 642, 18)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1383, 643, 47)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1384, 643, 54)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1385, 644, 69)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1386, 644, 72)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1387, 645, 49)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1388, 645, 53)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1389, 646, 24)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1390, 646, 29)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1391, 646, 32)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1392, 647, 75)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1393, 648, 39)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1394, 648, 45)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1395, 649, 37)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1396, 649, 45)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1397, 650, 48)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1398, 650, 53)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1399, 651, 58)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1400, 651, 61)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1401, 652, 75)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1402, 653, 24)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1403, 653, 28)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1404, 653, 31)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1405, 654, 74)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1406, 655, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1407, 655, 72)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1408, 656, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1409, 656, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1410, 657, 59)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1411, 657, 60)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1412, 658, 76)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1413, 659, 59)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1414, 659, 61)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1415, 660, 69)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1416, 660, 72)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1417, 661, 46)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1418, 661, 55)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1419, 662, 64)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1420, 662, 68)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1421, 663, 49)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1422, 663, 52)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1423, 664, 5)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1424, 664, 16)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1425, 664, 17)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1426, 665, 36)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1427, 665, 43)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1428, 666, 38)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1429, 666, 44)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1430, 667, 59)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1431, 667, 61)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1432, 668, 74)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1433, 669, 26)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1434, 669, 28)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1435, 669, 31)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1436, 670, 37)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1437, 670, 42)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1438, 671, 56)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1439, 671, 61)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1440, 672, 57)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1441, 672, 62)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1442, 673, 39)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1443, 673, 41)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1444, 674, 1)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1445, 674, 16)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1446, 674, 17)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1447, 675, 22)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1448, 675, 27)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1449, 675, 33)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1450, 676, 69)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1451, 676, 72)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1452, 677, 57)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1453, 677, 60)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1454, 678, 57)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1455, 678, 61)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1456, 679, 58)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1457, 679, 61)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1458, 680, 48)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1459, 680, 52)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1460, 681, 49)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1461, 681, 52)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1462, 682, 8)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1463, 682, 16)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1464, 682, 21)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1465, 683, 75)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1466, 684, 69)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1467, 684, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1468, 685, 1)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1469, 685, 11)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1470, 685, 21)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1471, 686, 63)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1472, 686, 66)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1473, 687, 23)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1474, 687, 28)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1475, 687, 33)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1476, 688, 36)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1477, 688, 40)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1478, 689, 46)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1479, 689, 52)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1480, 690, 73)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1481, 691, 24)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1482, 691, 27)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1483, 691, 32)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1484, 692, 3)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1485, 692, 16)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1486, 692, 18)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1487, 693, 63)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1488, 693, 67)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1489, 694, 58)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1490, 694, 62)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1491, 695, 48)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1492, 695, 52)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1493, 696, 4)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1494, 696, 11)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1495, 696, 21)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1496, 697, 76)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1497, 698, 46)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1498, 698, 55)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1499, 699, 56)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1500, 699, 60)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1501, 700, 35)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1502, 700, 40)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1503, 701, 6)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1504, 701, 14)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1505, 701, 19)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1506, 702, 37)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1507, 702, 43)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1508, 703, 58)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1509, 703, 60)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1510, 704, 38)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1511, 704, 40)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1512, 705, 69)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1513, 705, 72)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1514, 706, 23)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1515, 706, 28)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1516, 706, 34)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1517, 707, 23)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1518, 707, 30)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1519, 707, 33)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1520, 708, 76)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1521, 709, 57)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1522, 709, 60)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1523, 710, 65)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1524, 710, 66)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1525, 711, 65)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1526, 711, 66)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1527, 712, 47)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1528, 712, 52)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1529, 713, 6)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1530, 713, 12)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1531, 713, 18)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1532, 714, 37)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1533, 714, 41)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1534, 715, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1535, 715, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1536, 716, 50)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1537, 716, 53)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1538, 717, 56)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1539, 717, 61)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1540, 718, 26)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1541, 718, 27)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1542, 718, 33)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1543, 719, 49)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1544, 719, 52)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1545, 720, 75)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1546, 721, 64)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1547, 721, 66)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1548, 722, 63)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1549, 722, 68)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1550, 723, 36)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1551, 723, 40)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1552, 724, 59)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1553, 724, 60)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1554, 725, 64)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1555, 725, 68)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1556, 726, 7)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1557, 726, 12)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1558, 726, 18)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1559, 727, 35)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1560, 727, 42)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1561, 728, 64)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1562, 728, 67)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1563, 729, 25)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1564, 729, 27)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1565, 729, 32)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1566, 730, 75)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1567, 731, 46)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1568, 731, 53)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1569, 732, 50)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1570, 732, 51)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1571, 733, 50)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1572, 733, 55)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1573, 734, 69)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1574, 734, 72)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1575, 735, 65)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1576, 735, 67)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1577, 736, 56)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1578, 736, 62)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1579, 737, 65)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1580, 737, 67)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1581, 738, 50)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1582, 738, 55)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1583, 739, 76)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1584, 740, 22)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1585, 740, 28)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1586, 740, 31)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1587, 741, 6)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1588, 741, 15)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1589, 741, 20)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1590, 742, 50)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1591, 742, 53)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1592, 743, 38)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1593, 743, 41)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1594, 744, 57)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1595, 744, 61)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1596, 745, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1597, 745, 72)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1598, 746, 39)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1599, 746, 45)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1600, 747, 49)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1601, 747, 51)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1602, 748, 65)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1603, 748, 68)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1604, 749, 24)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1605, 749, 28)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1606, 749, 34)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1607, 750, 47)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1608, 750, 51)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1609, 751, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1610, 751, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1611, 752, 63)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1612, 752, 66)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1613, 753, 8)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1614, 753, 13)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1615, 753, 20)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1616, 754, 69)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1617, 754, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1618, 755, 69)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1619, 755, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1620, 756, 48)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1621, 756, 53)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1622, 757, 38)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1623, 757, 42)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1624, 758, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1625, 758, 72)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1626, 759, 39)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1627, 759, 45)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1628, 760, 58)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1629, 760, 60)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1630, 761, 57)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1631, 761, 62)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1632, 762, 39)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1633, 762, 43)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1634, 763, 37)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1635, 763, 43)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1636, 764, 38)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1637, 764, 42)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1638, 765, 38)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1639, 765, 43)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1640, 766, 25)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1641, 766, 28)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1642, 766, 32)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1643, 767, 69)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1644, 767, 72)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1645, 768, 36)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1646, 768, 43)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1647, 769, 65)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1648, 769, 66)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1649, 770, 76)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1650, 771, 59)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1651, 771, 62)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1652, 772, 59)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1653, 772, 60)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1654, 773, 36)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1655, 773, 42)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1656, 774, 76)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1657, 775, 69)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1658, 775, 72)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1659, 776, 48)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1660, 776, 51)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1661, 777, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1662, 777, 72)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1663, 778, 63)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1664, 778, 67)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1665, 779, 49)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1666, 779, 53)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1667, 780, 7)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1668, 780, 12)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1669, 780, 17)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1670, 781, 35)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1671, 781, 41)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1672, 782, 49)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1673, 782, 54)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1674, 783, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1675, 783, 72)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1676, 784, 46)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1677, 784, 52)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1678, 785, 26)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1679, 785, 30)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1680, 785, 32)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1681, 786, 63)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1682, 786, 68)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1683, 787, 74)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1684, 788, 57)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1685, 788, 60)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1686, 789, 65)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1687, 789, 68)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1688, 790, 75)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1689, 791, 35)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1690, 791, 43)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1691, 792, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1692, 792, 72)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1693, 793, 58)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1694, 793, 62)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1695, 794, 8)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1696, 794, 16)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1697, 794, 17)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1698, 795, 35)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1699, 795, 40)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1700, 796, 64)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1701, 796, 66)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1702, 797, 4)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1703, 797, 16)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1704, 797, 19)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1705, 798, 49)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1706, 798, 53)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1707, 799, 65)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1708, 799, 66)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1709, 800, 39)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1710, 800, 42)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1711, 801, 47)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1712, 801, 53)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1713, 802, 56)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1714, 802, 61)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1715, 803, 35)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1716, 803, 43)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1717, 804, 24)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1718, 804, 27)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1719, 804, 34)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1720, 805, 59)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1721, 805, 60)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1722, 806, 26)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1723, 806, 30)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1724, 806, 31)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1725, 807, 22)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1726, 807, 27)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1727, 807, 32)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1728, 808, 69)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1729, 808, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1730, 809, 58)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1731, 809, 61)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1732, 810, 23)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1733, 810, 28)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1734, 810, 31)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1735, 811, 65)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1736, 811, 68)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1737, 812, 22)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1738, 812, 28)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1739, 812, 33)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1740, 813, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1741, 813, 72)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1742, 814, 74)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1743, 815, 36)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1744, 815, 45)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1745, 816, 76)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1746, 817, 23)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1747, 817, 29)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1748, 817, 33)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1749, 818, 49)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1750, 818, 54)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1751, 819, 2)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1752, 819, 11)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1753, 819, 21)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1754, 820, 23)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1755, 820, 27)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1756, 820, 34)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1757, 821, 75)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1758, 822, 47)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1759, 822, 51)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1760, 823, 65)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1761, 823, 67)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1762, 824, 8)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1763, 824, 14)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1764, 824, 18)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1765, 825, 49)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1766, 825, 53)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1767, 826, 73)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1768, 827, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1769, 827, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1770, 828, 74)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1771, 829, 36)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1772, 829, 41)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1773, 830, 22)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1774, 830, 29)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1775, 830, 33)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1776, 831, 74)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1777, 832, 63)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1778, 832, 68)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1779, 833, 64)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1780, 833, 67)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1781, 834, 50)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1782, 834, 51)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1783, 835, 22)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1784, 835, 27)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1785, 835, 31)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1786, 836, 24)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1787, 836, 29)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1788, 836, 34)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1789, 837, 76)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1790, 838, 38)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1791, 838, 41)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1792, 839, 49)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1793, 839, 51)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1794, 840, 73)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1795, 841, 36)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1796, 841, 41)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1797, 842, 26)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1798, 842, 27)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1799, 842, 34)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1800, 843, 69)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1801, 843, 72)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1802, 844, 64)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1803, 844, 68)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1804, 845, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1805, 845, 72)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1806, 846, 57)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1807, 846, 61)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1808, 847, 75)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1809, 848, 59)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1810, 848, 61)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1811, 849, 5)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1812, 849, 12)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1813, 849, 18)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1814, 850, 69)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1815, 850, 72)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1816, 851, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1817, 851, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1818, 852, 22)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1819, 852, 27)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1820, 852, 34)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1821, 853, 3)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1822, 853, 14)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1823, 853, 20)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1824, 854, 6)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1825, 854, 12)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1826, 854, 19)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1827, 855, 76)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1828, 856, 69)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1829, 856, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1830, 857, 1)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1831, 857, 15)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1832, 857, 20)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1833, 858, 23)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1834, 858, 30)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1835, 858, 33)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1836, 859, 8)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1837, 859, 11)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1838, 859, 18)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1839, 860, 38)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1840, 860, 41)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1841, 861, 69)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1842, 861, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1843, 862, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1844, 862, 72)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1845, 863, 69)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1846, 863, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1847, 864, 37)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1848, 864, 41)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1849, 865, 39)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1850, 865, 40)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1851, 866, 65)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1852, 866, 68)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1853, 867, 36)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1854, 867, 41)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1855, 868, 63)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1856, 868, 66)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1857, 869, 22)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1858, 869, 27)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1859, 869, 33)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1860, 870, 59)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1861, 870, 61)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1862, 871, 76)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1863, 872, 64)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1864, 872, 68)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1865, 873, 56)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1866, 873, 62)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1867, 874, 65)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1868, 874, 66)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1869, 875, 46)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1870, 875, 54)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1871, 876, 25)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1872, 876, 27)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1873, 876, 32)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1874, 877, 56)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1875, 877, 61)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1876, 878, 48)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1877, 878, 55)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1878, 879, 56)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1879, 879, 62)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1880, 880, 73)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1881, 881, 58)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1882, 881, 62)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1883, 882, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1884, 882, 72)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1885, 883, 26)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1886, 883, 27)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1887, 883, 34)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1888, 884, 69)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1889, 884, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1890, 885, 36)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1891, 885, 44)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1892, 886, 69)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1893, 886, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1894, 887, 48)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1895, 887, 55)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1896, 888, 39)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1897, 888, 45)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1898, 889, 36)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1899, 889, 40)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1900, 890, 7)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1901, 890, 12)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1902, 890, 21)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1903, 891, 76)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1904, 892, 36)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1905, 892, 44)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1906, 893, 5)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1907, 893, 10)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1908, 893, 21)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1909, 894, 22)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1910, 894, 30)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1911, 894, 33)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1912, 895, 24)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1913, 895, 28)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1914, 895, 33)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1915, 896, 24)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1916, 896, 29)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1917, 896, 34)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1918, 897, 22)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1919, 897, 29)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1920, 897, 31)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1921, 898, 65)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1922, 898, 67)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1923, 899, 58)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1924, 899, 60)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1925, 900, 49)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1926, 900, 54)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1927, 901, 24)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1928, 901, 29)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1929, 901, 32)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1930, 902, 48)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1931, 902, 51)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1932, 903, 59)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1933, 903, 61)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1934, 904, 76)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1935, 905, 74)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1936, 906, 57)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1937, 906, 61)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1938, 907, 2)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1939, 907, 10)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1940, 907, 17)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1941, 908, 50)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1942, 908, 54)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1943, 909, 63)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1944, 909, 67)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1945, 910, 26)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1946, 910, 27)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1947, 910, 31)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1948, 911, 76)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1949, 912, 58)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1950, 912, 61)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1951, 913, 65)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1952, 913, 68)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1953, 914, 47)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1954, 914, 54)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1955, 915, 64)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1956, 915, 66)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1957, 916, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1958, 916, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1959, 917, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1960, 917, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1961, 918, 47)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1962, 918, 51)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1963, 919, 69)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1964, 919, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1965, 920, 69)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1966, 920, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1967, 921, 46)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1968, 921, 55)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1969, 922, 22)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1970, 922, 29)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1971, 922, 32)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1972, 923, 39)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1973, 923, 44)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1974, 924, 38)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1975, 924, 45)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1976, 925, 6)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1977, 925, 11)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1978, 925, 17)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1979, 926, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1980, 926, 72)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1981, 927, 69)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1982, 927, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1983, 928, 49)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1984, 928, 51)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1985, 929, 23)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1986, 929, 29)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1987, 929, 33)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1988, 930, 26)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1989, 930, 30)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1990, 930, 31)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1991, 931, 50)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1992, 931, 52)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1993, 932, 50)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1994, 932, 51)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1995, 933, 49)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1996, 933, 55)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1997, 934, 25)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1998, 934, 29)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (1999, 934, 34)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2000, 935, 35)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2001, 935, 42)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2002, 936, 64)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2003, 936, 68)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2004, 937, 76)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2005, 938, 36)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2006, 938, 43)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2007, 939, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2008, 939, 72)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2009, 940, 25)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2010, 940, 30)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2011, 940, 34)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2012, 941, 4)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2013, 941, 12)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2014, 941, 21)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2015, 942, 25)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2016, 942, 29)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2017, 942, 34)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2018, 943, 38)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2019, 943, 44)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2020, 944, 56)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2021, 944, 61)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2022, 945, 8)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2023, 945, 9)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2024, 945, 18)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2025, 946, 2)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2026, 946, 11)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2027, 946, 18)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2028, 947, 26)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2029, 947, 29)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2030, 947, 32)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2031, 948, 46)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2032, 948, 53)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2033, 949, 6)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2034, 949, 12)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2035, 949, 17)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2036, 950, 3)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2037, 950, 11)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2038, 950, 18)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2039, 951, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2040, 951, 72)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2041, 952, 58)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2042, 952, 61)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2043, 953, 6)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2044, 953, 12)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2045, 953, 17)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2046, 954, 36)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2047, 954, 44)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2048, 955, 56)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2049, 955, 61)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2050, 956, 8)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2051, 956, 16)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2052, 956, 18)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2053, 957, 59)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2054, 957, 62)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2055, 958, 70)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2056, 958, 72)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2057, 959, 37)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2058, 959, 44)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2059, 960, 39)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2060, 960, 43)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2061, 961, 47)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2062, 961, 51)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2063, 962, 76)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2064, 963, 73)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2065, 964, 64)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2066, 964, 67)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2067, 965, 76)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2068, 966, 50)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2069, 966, 54)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2070, 967, 24)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2071, 967, 30)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2072, 967, 33)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2073, 968, 63)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2074, 968, 66)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2075, 969, 63)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2076, 969, 66)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2077, 970, 24)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2078, 970, 29)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2079, 970, 33)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2080, 971, 6)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2081, 971, 15)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2082, 971, 17)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2083, 972, 63)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2084, 972, 68)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2085, 973, 74)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2086, 974, 7)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2087, 974, 14)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2088, 974, 18)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2089, 975, 57)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2090, 975, 61)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2091, 976, 35)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2092, 976, 44)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2093, 977, 25)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2094, 977, 28)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2095, 977, 33)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2096, 978, 57)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2097, 978, 60)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2098, 979, 64)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2099, 979, 68)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2100, 980, 65)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2101, 980, 67)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2102, 981, 75)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2103, 982, 37)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2104, 982, 44)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2105, 983, 64)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2106, 983, 67)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2107, 984, 1)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2108, 984, 16)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2109, 984, 18)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2110, 985, 47)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2111, 985, 55)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2112, 986, 69)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2113, 986, 71)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2114, 987, 22)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2115, 987, 30)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2116, 987, 33)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2117, 988, 74)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2118, 989, 6)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2119, 989, 10)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2120, 989, 20)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2121, 990, 65)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2122, 990, 67)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2123, 991, 58)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2124, 991, 62)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2125, 992, 75)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2126, 993, 65)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2127, 993, 68)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2128, 994, 36)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2129, 994, 43)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2130, 995, 6)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2131, 995, 10)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2132, 995, 18)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2133, 996, 25)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2134, 996, 30)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2135, 996, 32)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2136, 997, 69)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2137, 997, 72)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2138, 998, 47)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2139, 998, 54)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2140, 999, 56)
GO
INSERT [dbo].[ProductFeatures] ([Id], [ProductId], [FeatureId]) VALUES (2141, 999, 61)
GO
SET IDENTITY_INSERT [dbo].[ProductFeatures] OFF
GO

/****** Object:  Index [IX_CategoryFeatureItems_CategoryFeatureId]    Script Date: 14.06.2023 13:58:21 ******/
CREATE NONCLUSTERED INDEX [IX_CategoryFeatureItems_CategoryFeatureId] ON [dbo].[CategoryFeatureItems]
(
	[CategoryFeatureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CategoryFeatures_SubCategoryId]    Script Date: 14.06.2023 13:58:21 ******/
CREATE NONCLUSTERED INDEX [IX_CategoryFeatures_SubCategoryId] ON [dbo].[CategoryFeatures]
(
	[SubCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductFeatures_FeatureId]    Script Date: 14.06.2023 13:58:21 ******/
CREATE NONCLUSTERED INDEX [IX_ProductFeatures_FeatureId] ON [dbo].[ProductFeatures]
(
	[FeatureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductFeatures_ProductId]    Script Date: 14.06.2023 13:58:21 ******/
CREATE NONCLUSTERED INDEX [IX_ProductFeatures_ProductId] ON [dbo].[ProductFeatures]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_SubCategoryId]    Script Date: 14.06.2023 13:58:21 ******/
CREATE NONCLUSTERED INDEX [IX_Products_SubCategoryId] ON [dbo].[Products]
(
	[SubCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_UserId]    Script Date: 14.06.2023 13:58:21 ******/
CREATE NONCLUSTERED INDEX [IX_Products_UserId] ON [dbo].[Products]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SubCategories_MainCategoryId]    Script Date: 14.06.2023 13:58:21 ******/
CREATE NONCLUSTERED INDEX [IX_SubCategories_MainCategoryId] ON [dbo].[SubCategories]
(
	[MainCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Users_StatusId]    Script Date: 14.06.2023 13:58:21 ******/
CREATE NONCLUSTERED INDEX [IX_Users_StatusId] ON [dbo].[Users]
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CategoryFeatureItems]  WITH CHECK ADD  CONSTRAINT [FK_CategoryFeatureItems_CategoryFeatures] FOREIGN KEY([CategoryFeatureId])
REFERENCES [dbo].[CategoryFeatures] ([Id])
GO
ALTER TABLE [dbo].[CategoryFeatureItems] CHECK CONSTRAINT [FK_CategoryFeatureItems_CategoryFeatures]
GO
ALTER TABLE [dbo].[CategoryFeatures]  WITH CHECK ADD  CONSTRAINT [FK_CategoryFeatures_SubCategories] FOREIGN KEY([SubCategoryId])
REFERENCES [dbo].[SubCategories] ([Id])
GO
ALTER TABLE [dbo].[CategoryFeatures] CHECK CONSTRAINT [FK_CategoryFeatures_SubCategories]
GO
ALTER TABLE [dbo].[ProductFeatures]  WITH CHECK ADD  CONSTRAINT [FK_ProductFeatures_CategoryFeatureItems] FOREIGN KEY([FeatureId])
REFERENCES [dbo].[CategoryFeatureItems] ([Id])
GO
ALTER TABLE [dbo].[ProductFeatures] CHECK CONSTRAINT [FK_ProductFeatures_CategoryFeatureItems]
GO
ALTER TABLE [dbo].[ProductFeatures]  WITH CHECK ADD  CONSTRAINT [FK_ProductFeatures_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[ProductFeatures] CHECK CONSTRAINT [FK_ProductFeatures_Products]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_SubCategories] FOREIGN KEY([SubCategoryId])
REFERENCES [dbo].[SubCategories] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_SubCategories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Users]
GO
ALTER TABLE [dbo].[SubCategories]  WITH CHECK ADD  CONSTRAINT [FK_SubCategories_MainCategories] FOREIGN KEY([MainCategoryId])
REFERENCES [dbo].[MainCategories] ([Id])
GO
ALTER TABLE [dbo].[SubCategories] CHECK CONSTRAINT [FK_SubCategories_MainCategories]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Situations] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Situations] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Situations]
GO
USE [master]
GO
ALTER DATABASE [SatayimSanaDB] SET  READ_WRITE 
GO

