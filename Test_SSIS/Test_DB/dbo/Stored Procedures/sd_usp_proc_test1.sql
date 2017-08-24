-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE procedure [dbo].[sd_usp_proc_test1]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @i bigint;

	insert into [worker].[dbo].[SD_proc_test]
	        ( [sp_name],[start_ts],[end_ts] )
	values  ( N'sd_usp_proc_test1', -- sp_name - nvarchar(512)
	          sysdatetime(), -- start_ts - datetime2(7)
	          null  -- end_ts - datetime2(7)
	          )
	select @i = @@IDENTITY;

	WAITFOR DELAY '00:00:10';

	update worker.dbo.[SD_proc_test]
	set [end_ts] = sysdatetime()
	where @i = [id]
	
END