USE [t127jrecillo]
GO

/****** Object:  Table [dbo].[JDwebstore-User]    Script Date: 11/09/2011 23:09:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[JDwebstore-User](
	[UserID] [uniqueidentifier] NOT NULL,
	[Usernane] [varchar](32) NOT NULL,
	[Password] [varchar](64) NOT NULL,
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

