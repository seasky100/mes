if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[eM_CreateProduct]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[eM_CreateProduct]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE [dbo].[eM_CreateProduct]
	@productname nvarchar(50)
AS
	set nocount on
	declare @sql  varchar(2000)
	declare @IMEIRangetable varchar(50)
	declare @colorboxtable varchar(50)
	declare @cartonboxtable varchar(50)  
	declare @pallettable varchar(50)  
	declare @ProductionLinetable varchar(50)
	declare @SNTemptable varchar(50)
	set @IMEIRangetable=@productname+'_IMEIRange'
	set @colorboxtable=@productname+'_ColorBox'
	set @cartonboxtable=@productname+'_CartonBox'
	set @pallettable=@productname+'_Pallet'
	set @ProductionLinetable=@productname+'_ProductionLine'
	set @SNTemptable=@productname+'_SNTemp'

	--CREATE SNTemptable Table
	set @sql='if exists (select * from dbo.sysobjects where id = object_id(N'''+'[dbo].['+@SNTemptable+']'+''') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)'+
		 ' drop table [dbo].['+@SNTemptable+']'+
		 ' create table dbo.'+@SNTemptable+
		 ' ('+
		    ' [ID] [int] IDENTITY (1, 1) PRIMARY  KEY NOT NULL ,'+
		    ' [SN] [varchar](50) COLLATE Chinese_PRC_CI_AS NULL,'+
			' [Status] [int] NOT NULL DEFAULT(0),'+
		    ' [datetime] [datetime] NOT NULL DEFAULT(getdate())'+
		    ' ) ON [PRIMARY]'
	execute(@sql)


	--CREATE ProductionLine Table
	set @sql='if exists (select * from dbo.sysobjects where id = object_id(N'''+'[dbo].['+@ProductionLinetable+']'+''') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)'+
		 ' drop table [dbo].['+@ProductionLinetable+']'+
		 ' create table dbo.'+@ProductionLinetable+
		 ' ('+
		    ' [ID] [int] IDENTITY (1, 1) PRIMARY  KEY NOT NULL ,'+
		    ' [IMEI1] [varchar](50) COLLATE Chinese_PRC_CI_AS NULL,'+
		    ' [CartonName] [varchar](50) COLLATE Chinese_PRC_CI_AS NULL,'+
                    	    ' [PalletName] [varchar](50) COLLATE Chinese_PRC_CI_AS NULL,'+
                    	    ' [WriteTool] [varchar](50) COLLATE Chinese_PRC_CI_AS NULL,'+
                    	    ' [CheckIMEIS1] [varchar](50) COLLATE Chinese_PRC_CI_AS NULL,'+
                    	    ' [ColorBox] [varchar](50) COLLATE Chinese_PRC_CI_AS NULL,'+
                   	     ' [CheckIMEIS2] [varchar](50) COLLATE Chinese_PRC_CI_AS NULL,'+
                    	    ' [ColorBoxWeighTool] [varchar](50) COLLATE Chinese_PRC_CI_AS NULL,'+
                    	    ' [Pack] [varchar](50) COLLATE Chinese_PRC_CI_AS NULL,'+
                    	    ' [CartonWeighTool] [varchar](50) COLLATE Chinese_PRC_CI_AS NULL,'+
                    	    ' [Pallet] [varchar](50) COLLATE Chinese_PRC_CI_AS NULL,'+
			' [WriteDate] [datetime] NULL,'+
			' [CheckS1Date] [datetime] NULL,'+
			' [ColorBoxDate] [datetime] NULL,'+
			' [CheckS2Date] [datetime] NULL,'+
			' [ColorWeighDate] [datetime] NULL,'+
			' [CartonDate] [datetime] NULL,'+
			' [CartonWeighDate] [datetime] NULL,'+
			' [PalletDate] [datetime] NULL,'+
                    	    ' [datetime] [datetime] NULL DEFAULT(getdate())'+
		    ' ) ON [PRIMARY]'
	execute(@sql)

	--CREATE Pallet Table
	set @sql='if exists (select * from dbo.sysobjects where id = object_id(N'''+'[dbo].['+@pallettable+']'+''') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)'+
		 ' drop table [dbo].['+@pallettable+']'+
		 ' create table dbo.'+@pallettable+
		 ' ('+
		    ' [ID] [int] IDENTITY (1, 1) PRIMARY  KEY NOT NULL ,'+
		    ' [PalletName] [varchar](50) COLLATE Chinese_PRC_CI_AS NULL,'+
		    ' [Status] [int] NOT NULL DEFAULT(0),'+
                    	    ' [datetime] [datetime] NULL DEFAULT(getdate())'+
		    ' ) ON [PRIMARY]'
	execute(@sql)

	--CREATE CartonBox Table
	set @sql='if exists (select * from dbo.sysobjects where id = object_id(N'''+'[dbo].['+@cartonboxtable+']'+''') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)'+
		 ' drop table [dbo].['+@cartonboxtable+']'+
		 ' create table dbo.'+@cartonboxtable+
		 ' ('+
		    ' [ID] [int] IDENTITY (1, 1) PRIMARY  KEY NOT NULL ,'+
		    ' [CartonName] [varchar](50) COLLATE Chinese_PRC_CI_AS NULL,'+
	            	    ' [CartonWeigh] [float] NULL ,'+
		    ' [PalletName] [varchar](50) COLLATE Chinese_PRC_CI_AS NULL,'+
		    ' [LabelPrintCount] [int] NOT NULL DEFAULT(0),'+
                    	    ' [Status] [int] NOT NULL DEFAULT(0),'+
                    	    ' [datetime] [datetime] NULL DEFAULT(getdate())'+
		    ' ) ON [PRIMARY]'
	execute(@sql)

	--CREATE ColorBox Table
	set @sql='if exists (select * from dbo.sysobjects where id = object_id(N'''+'[dbo].['+@colorboxtable+']'+''') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)'+
		 ' drop table [dbo].['+@colorboxtable+']'+
		 ' create table dbo.'+@colorboxtable+
		 ' ('+
		    ' [ID] [int] IDENTITY (1, 1) PRIMARY  KEY NOT NULL ,'+
                    	    ' [IMEI1] [varchar](50) COLLATE Chinese_PRC_CI_AS NULL,'+
		    ' [IMEI2] [varchar](50) COLLATE Chinese_PRC_CI_AS NULL,'+
		    ' [IMEI3] [varchar](50) COLLATE Chinese_PRC_CI_AS NULL,'+
		    ' [IMEI4] [varchar](50) COLLATE Chinese_PRC_CI_AS NULL,'+
		    ' [NetCode] [varchar](50) COLLATE Chinese_PRC_CI_AS NULL,'+
		    ' [BarCode] [varchar](70) COLLATE Chinese_PRC_CI_AS NULL,'+
		    ' [ProductSN] [varchar](50) COLLATE Chinese_PRC_CI_AS NULL,'+
		    ' [BTAddress] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL,'+
		    ' [WIFIMAC] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL,'+
                    	    ' [ColorBoxWeigh] [float] NULL ,'+
		    ' [CartonName] [varchar](50) COLLATE Chinese_PRC_CI_AS NULL,'+
                   	     ' [Status] [int] NOT NULL DEFAULT(0),'+
		    ' [Enable] [int] NOT NULL DEFAULT(0),'+
                    	    ' [datetime] [datetime] NOT NULL DEFAULT(getdate())'+
		    ' ) ON [PRIMARY]'
	execute(@sql)

	--CREATE IMEIRange Table
	set @sql='if exists (select * from dbo.sysobjects where id = object_id(N'''+'[dbo].['+@IMEIRangetable+']'+''') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)'+
		 ' drop table [dbo].['+@IMEIRangetable+']'+
		 ' create table dbo.'+@IMEIRangetable+
		 ' ('+
		    ' [ID] [int] IDENTITY (1, 1) PRIMARY  KEY NOT NULL ,'+
		    ' [IMEI1] [varchar](50) COLLATE Chinese_PRC_CI_AS NULL,'+
		    ' [IMEI2] [varchar](50) COLLATE Chinese_PRC_CI_AS NULL,'+
		    ' [IMEI3] [varchar](50) COLLATE Chinese_PRC_CI_AS NULL,'+
		    ' [IMEI4] [varchar](50) COLLATE Chinese_PRC_CI_AS NULL,'+
                    	    ' [SN] [varchar](50) COLLATE Chinese_PRC_CI_AS NULL,'+
		    ' [datetime] [datetime] NOT NULL DEFAULT(getdate())'+
		    ' ) ON [PRIMARY]'
	execute(@sql)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO