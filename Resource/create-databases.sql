USE [t127jrecillo]
GO
/****** Object:  Table [dbo].[JDwebstore-Category]    Script Date: 11/10/2011 23:17:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[JDwebstore-Category](
	[CategoryID] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](max) NULL,
 CONSTRAINT [PK_JDwebstore-Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[JDwebstore-Category] ([CategoryID], [Name], [Description]) VALUES (0, N'All Categories', NULL)
INSERT [dbo].[JDwebstore-Category] ([CategoryID], [Name], [Description]) VALUES (1, N'Computers & Tablets', N'Get work done!')
INSERT [dbo].[JDwebstore-Category] ([CategoryID], [Name], [Description]) VALUES (2, N'TV & Home Theatre', N'Make your friends jealous with your brand-new giant HDTV!')
INSERT [dbo].[JDwebstore-Category] ([CategoryID], [Name], [Description]) VALUES (3, N'iPod & Audio', N'Music. ON THE GO')
INSERT [dbo].[JDwebstore-Category] ([CategoryID], [Name], [Description]) VALUES (4, N'Mobile Phones', N'Talk. ON THE GO')
INSERT [dbo].[JDwebstore-Category] ([CategoryID], [Name], [Description]) VALUES (5, N'Cameras & Camcorders', N'Capture those special moments.')
INSERT [dbo].[JDwebstore-Category] ([CategoryID], [Name], [Description]) VALUES (6, N'GPS, Car & Marine', N'It''s dangerous to go alone!')
INSERT [dbo].[JDwebstore-Category] ([CategoryID], [Name], [Description]) VALUES (7, N'Movies, Music, DJ & Instruments', N'Because a new TV is useless without something to show on it.')
INSERT [dbo].[JDwebstore-Category] ([CategoryID], [Name], [Description]) VALUES (8, N'Video Games & Toys', N'Time-wasters!')
INSERT [dbo].[JDwebstore-Category] ([CategoryID], [Name], [Description]) VALUES (9, N'Appliances', N'Essential for living!')
INSERT [dbo].[JDwebstore-Category] ([CategoryID], [Name], [Description]) VALUES (10, N'Home & Lifestyle', N'Live your life!')
INSERT [dbo].[JDwebstore-Category] ([CategoryID], [Name], [Description]) VALUES (11, N'Office Products', N'+3 PRODUCTIVITY')
/****** Object:  StoredProcedure [dbo].[JDwebstore-CatalogGetItemsOnFrontpage]    Script Date: 11/10/2011 23:17:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[JDwebstore-CatalogGetItemsOnFrontpage]
(@DescriptionLength INT,
@PageNumber INT,
@ItemsPerPage INT,
@HowManyItems INT OUTPUT)
AS

/*Declare a new TABLE variable*/
DECLARE @Items TABLE
(RowNumber INT,
ItemID INT,
[Name] VARCHAR(255),
Description VARCHAR(MAX),
Price MONEY,
OnFront bit)

/*populate the table variable with the complete list of Items*/
INSERT INTO @Items
SELECT ROW_NUMBER() OVER (ORDER BY Item.ItemID),ItemID, Name,
CASE
	WHEN LEN(Description) <= @DescriptionLength THEN Description
	ELSE SUBSTRING(Description, 1, @DescriptionLength) + '...'
END
AS Description, Price, OnFront
FROM Item
WHERE OnFront = True

/*return the total number of Items using an OUTPUT variable*/
SELECT @HowManyItems = COUNT(ItemID) From @Items

/*extract the requested page of items*/
SELECT ItemID, Name, Description, OnFront
FROM @Items
WHERE RowNumber > (@PageNumber - 1) * @ItemsPerPage
AND RowNumber <=@PageNumber * @ItemsPerPage
GO
/****** Object:  StoredProcedure [dbo].[JDwebstore-CatalogGetItemDetails]    Script Date: 11/10/2011 23:17:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[JDwebstore-CatalogGetItemDetails] (@ItemID VARCHAR) AS
SELECT Name, Description, Price, Thumbnail, Image, OnFront
FROM Item
WHERE ItemID = @ItemID
GO
/****** Object:  StoredProcedure [dbo].[JDwebstore-CatalogGetCategoryDetails]    Script Date: 11/10/2011 23:17:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[JDwebstore-CatalogGetCategoryDetails] (@CategoryID INT) AS
SELECT Name, Description
FROM Category
WHERE CategoryID = @CategoryID
GO
/****** Object:  Table [dbo].[JDwebstore-Item]    Script Date: 11/10/2011 23:17:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[JDwebstore-Item](
	[ItemID] [uniqueidentifier] NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Price] [money] NOT NULL,
	[Description] [varchar](max) NULL,
	[Thumbnail] [varchar](50) NULL,
	[Image] [varchar](50) NULL,
	[Rating] [int] NULL,
	[OnFront] [bit] NULL,
 CONSTRAINT [PK_JDwebstore-Item] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[JDwebstore-Item] ([ItemID], [Name], [Price], [Description], [Thumbnail], [Image], [Rating], [OnFront]) VALUES (N'd566b120-54f3-4c16-b7e5-0ec7b5fa9fce', N'Apple iPod touch 4G 8GB', 199.0000, N'Music, games, iMessage, HD video recording, and more. It has fun written all over it. Now starting at $199.00.', N'd566b120_thumb.jpg', N'd566b120.jpg', NULL, 1)
INSERT [dbo].[JDwebstore-Item] ([ItemID], [Name], [Price], [Description], [Thumbnail], [Image], [Rating], [OnFront]) VALUES (N'8a758c60-ee89-4cb0-807c-884aeea9999a', N'Apple iPhone 4S 16GB', 649.0000, N'Dual-core A5 chip. All-new 8MP camera and optics. iOS 5 and iCloud. Its the most amazing iPhone yet.', N'8a758c60_thumb.jpg', N'8a758c60.jpg', NULL, 1)
INSERT [dbo].[JDwebstore-Item] ([ItemID], [Name], [Price], [Description], [Thumbnail], [Image], [Rating], [OnFront]) VALUES (N'05bb7430-226d-41b6-a74c-c13b7434a280', N'HP Pavilion Desktop Computer Featuring Intel Core i3 - 2130 Processor (P7-1120)', 599.9900, N'From surfing the web and listening to tunes to editing photos and videos, this HP Pavilion P7 series desktop computer is designed to handle it all. Its powered by an Intel Core i3 processor and 8GB of RAM for great performance. And with a 1.5TB storage capacity and Wi-Fi, youll have access to all your digital content.', N'05bb7430_thumb.jpg', N'05bb7430.jpg', NULL, 1)
INSERT [dbo].[JDwebstore-Item] ([ItemID], [Name], [Price], [Description], [Thumbnail], [Image], [Rating], [OnFront]) VALUES (N'd8ca5b66-6160-41de-b5b8-d03883644585', N'Toshiba 47" 1080p 240Hz 3D LED HDTV (47TL515)]', 999.9900, N'The Toshiba TL515 series LED 3D TV is packed with some of the best features you could ask for in a television. It offers Full HD resolution in 2D or 3D, a ClearScan 240 refresh rate, and more for the best possible sights and sounds. And with built-in Wi-Fi, youll have access to cool online content too.', N'd8ca5b66_thumb.jpg', N'd8ca5b66.jpg', NULL, 0)
INSERT [dbo].[JDwebstore-Item] ([ItemID], [Name], [Price], [Description], [Thumbnail], [Image], [Rating], [OnFront]) VALUES (N'a8d54f39-6fd1-45a9-9386-e4a376f56d33', N'Canon EOS 7D 18MP DSLR Camera With 18-135mm IS Lens Kit', 1849.9900, N'Ideal for serious photographers and semi-professionals, Canons EOS 7D features an 18MP APS-C size CMOS sensor and dual DIGIC 4 image processors that will help you capture stunning, lifelike photos fast with every click. You can even record Full HD video and use this kits included EF-s 18-135mm f/3.5-5.6 IS lens to expand your creativity.', N'a8d54f39_thumb.jpg', N'a8d54f39.jpg', NULL, 1)
/****** Object:  Table [dbo].[JDwebstore-User]    Script Date: 11/10/2011 23:17:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[JDwebstore-User](
	[UserID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Usernane] [varchar](32) NOT NULL,
	[Password] [binary](32) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[MiddleName] [varchar](50) NULL,
	[LastName] [varchar](50) NOT NULL,
	[Country] [varchar](30) NOT NULL,
	[Company] [varchar](96) NULL,
	[AddressLn1] [varchar](255) NOT NULL,
	[AddressLn2] [varchar](255) NULL,
	[City] [varchar](25) NOT NULL,
	[Province] [char](2) NOT NULL,
	[PostalCode] [char](6) NOT NULL,
	[PhoneNumber] [char](10) NOT NULL,
	[CreditCardNumber] [char](16) NULL,
	[CreditCardType] [bit] NULL,
 CONSTRAINT [PK_JDwebstore-User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[JDwebstore-User] ([UserID], [Usernane], [Password], [DateOfBirth], [FirstName], [MiddleName], [LastName], [Country], [Company], [AddressLn1], [AddressLn2], [City], [Province], [PostalCode], [PhoneNumber], [CreditCardNumber], [CreditCardType]) VALUES (N'524c9f33-d4c4-4f68-b778-18743838d209', N'jaysan1292', 0x6630653463326637366335383931366563323538663234363835316265613039, CAST(0xEE190B00 AS Date), N'Jason', NULL, N'Recillo', N'Canada', NULL, N'lskdfj', NULL, N'Toronto', N'ON', N'A1B2C3', N'1234567890', NULL, NULL)
/****** Object:  Table [dbo].[JDwebstore-ItemCategory]    Script Date: 11/10/2011 23:17:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JDwebstore-ItemCategory](
	[CategoryID] [int] NOT NULL,
	[ItemID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_JDwebstore-ItemCategory_1] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC,
	[ItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[JDwebstore-ItemCategory] ([CategoryID], [ItemID]) VALUES (1, N'05bb7430-226d-41b6-a74c-c13b7434a280')
INSERT [dbo].[JDwebstore-ItemCategory] ([CategoryID], [ItemID]) VALUES (2, N'd8ca5b66-6160-41de-b5b8-d03883644585')
INSERT [dbo].[JDwebstore-ItemCategory] ([CategoryID], [ItemID]) VALUES (3, N'd566b120-54f3-4c16-b7e5-0ec7b5fa9fce')
INSERT [dbo].[JDwebstore-ItemCategory] ([CategoryID], [ItemID]) VALUES (4, N'8a758c60-ee89-4cb0-807c-884aeea9999a')
INSERT [dbo].[JDwebstore-ItemCategory] ([CategoryID], [ItemID]) VALUES (5, N'a8d54f39-6fd1-45a9-9386-e4a376f56d33')
/****** Object:  StoredProcedure [dbo].[JDwebstore-GetCategories]    Script Date: 11/10/2011 23:17:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[JDwebstore-GetCategories] AS
SELECT *
FROM [JDwebstore-Category]
WHERE [CategoryID] <> 0
GO
/****** Object:  Default [DF_JDwebstore-User_UserID]    Script Date: 11/10/2011 23:17:37 ******/
ALTER TABLE [dbo].[JDwebstore-User] ADD  CONSTRAINT [DF_JDwebstore-User_UserID]  DEFAULT (newid()) FOR [UserID]
GO
/****** Object:  ForeignKey [FK_JDwebstore-ItemCategory_JDwebstore-Category]    Script Date: 11/10/2011 23:17:37 ******/
ALTER TABLE [dbo].[JDwebstore-ItemCategory]  WITH CHECK ADD  CONSTRAINT [FK_JDwebstore-ItemCategory_JDwebstore-Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[JDwebstore-Category] ([CategoryID])
GO
ALTER TABLE [dbo].[JDwebstore-ItemCategory] CHECK CONSTRAINT [FK_JDwebstore-ItemCategory_JDwebstore-Category]
GO
/****** Object:  ForeignKey [FK_JDwebstore-ItemCategory_JDwebstore-Item]    Script Date: 11/10/2011 23:17:37 ******/
ALTER TABLE [dbo].[JDwebstore-ItemCategory]  WITH CHECK ADD  CONSTRAINT [FK_JDwebstore-ItemCategory_JDwebstore-Item] FOREIGN KEY([ItemID])
REFERENCES [dbo].[JDwebstore-Item] ([ItemID])
GO
ALTER TABLE [dbo].[JDwebstore-ItemCategory] CHECK CONSTRAINT [FK_JDwebstore-ItemCategory_JDwebstore-Item]
GO
