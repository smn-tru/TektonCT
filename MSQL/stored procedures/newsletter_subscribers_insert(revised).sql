USE [Flow]
GO
/****** Object:  StoredProcedure [dbo].[NewsletterSubscriptions_Insert]    Script Date: 9/6/2022 2:23:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sandra Truong
-- Create date: 07/28/2022
-- Description:	Insert Proc for NewsletterSubscriptions 
-- Code Reviewer: Daphne Judan


-- MODIFIED BY: Sandra Truong
-- MODIFIED DATE: 08/03/2022
-- Code Reviewer: Hector Martinez
-- Note: 
-- =============================================



ALTER PROC [dbo].[NewsletterSubscriptions_Insert]
			@Email nvarchar(255)
           ,@IsSubscribed bit = 1

		   
		   

/*


	DECLARE		 @Email nvarchar(255) = 'testing@email.net'
				,@IsSubscribed bit = 1

	EXECUTE dbo.NewsletterSubscriptions_Insert
				 @Email
				,@IsSubscribed


	SELECT *
	FROM dbo.NewsletterSubscriptions
	ORDER BY DateCreated DESC





*/

AS

BEGIN

	DECLARE @dateNow datetime2 = GETUTCDATE()

	IF EXISTS (SELECT TOP 1 1 FROM [dbo].[NewsletterSubscriptions] WHERE [Email] = @Email)
		UPDATE [dbo].[NewsletterSubscriptions]
			SET [IsSubscribed] =  @IsSubscribed 
			   ,[DateModified] = @dateNow
			WHERE [Email] = @Email
	ELSE
		INSERT INTO [dbo].[NewsletterSubscriptions]
           ([Email]
           ,[IsSubscribed])

		VALUES
           (@Email
           ,@IsSubscribed)

END

