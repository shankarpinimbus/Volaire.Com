USE [CSBaseECommerce]
GO
/****** Object:  StoredProcedure [dbo].[pr_get_template]    Script Date: 01/08/2013 17:57:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Drop if already exists */
IF EXISTS (SELECT 1 FROM sys.objects WHERE [type] = 'P' AND [name] = 'pr_get_template') BEGIN
	DROP PROCEDURE [dbo].[pr_get_template]
END

GO

/*

Name: [pr_get_template]

Description: gets template.
 
History:
Date		User		Change
?			?			Creation.

Example:

*/

CREATE PROCEDURE [dbo].[pr_get_template]  
@templateId int  
  
AS  
  
SELECT Name, body, Script, Tag, ExpireDate, Visible, URILabel  
FROM Template (NOLOCK)  
WHERE TemplateId = @templateId  
  
SELECT TemplateId, SkuId, TypeId  
FROM TemplateItems (NOLOCK)  
WHERE TemplateId = @templateId
order by TypeId DESC

SELECT TemplateId, StateId, DisableTemplate
FROM TemplateControl (NOLOCK)
WHERE TemplateId = @templateId
ORDER BY StateId