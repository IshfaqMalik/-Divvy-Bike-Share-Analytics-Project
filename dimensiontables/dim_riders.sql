IF OBJECT_ID ('dbo.dim_riders') is not NULL
begin 
drop EXTERNAL table dbo.dim_riders 
end 
CREATE EXTERNAL TABLE [dbo].[dim_riders]
WITH(
    LOCATION = 'star_schema/dim_riders',
    DATA_SOURCE = [bikeshare_data],
    FILE_FORMAT = [textformat]
) AS (SELECT
       [rider_id] , 
       [first] ,
       [last],
       [address],
       [birthday],
	 [account_start_date],
	 [account_end_date],
	 [is_member]
      
from  dbo.staging_rider

);

select top 10 * from [dbo].[dim_riders];