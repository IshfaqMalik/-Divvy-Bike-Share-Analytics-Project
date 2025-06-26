--
IF OBJECT_ID ('dbo.fact_payments') is not NULL
begin 
drop EXTERNAL table dbo.fact_payments 
end 
CREATE EXTERNAL TABLE [dbo].[fact_payments]
WITH(
    LOCATION = 'star_schema/fact_payments',
    DATA_SOURCE = [bikeshare_data],
    FILE_FORMAT = [textformat]
) AS (SELECT
       [payment_id], 
       [date],
       [amount],
       [rider_id]
      
from  dbo.staging_payment 

);

select top 10 * from [dbo].[fact_payments];