USE [CSBaseECommerce]
GO
/****** Object:  StoredProcedure [dbo].[pr_insert_template_control]    Script Date: 12/28/2012 09:17:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Drop if already exists */
IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P' AND [name] = 'pr_insert_template_control') BEGIN
	DROP PROCEDURE [dbo].[pr_insert_template_control]
END

GO

/*

Name: pr_insert_template_control

Description: inserts template control record.
 
History:
Date		User		Change
1/8/2013	jzaman		Creation.

Example:
exec [pr_insert_template_control] 1, 22, 1

*/

CREATE PROCEDURE [dbo].[pr_insert_template_control]
	@TemplateId int,
	@StateId int = null,
	@DisableTemplate bit
AS
BEGIN

	INSERT INTO dbo.[TemplateControl] (TemplateId, StateId, DisableTemplate)
	VALUES (@TemplateId, @StateId, @DisableTemplate)
	
END

