USE [DEV_SSIS_DB]
GO

CREATE TABLE [dbo].[TvPrograms](
	[ProgramId] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[ProgramName] [varchar](255) NULL,
	[OwlRating] [tinyint] NULL
)

GO