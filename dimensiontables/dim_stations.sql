--
IF OBJECT_ID ('dbo.dim_stations') is not NULL
begin 
drop EXTERNAL table dbo.dim_stations 
end 
CREATE EXTERNAL TABLE [dbo].[dim_stations]
WITH(
    LOCATION = 'star_schema/dim_stations',
    DATA_SOURCE = [bikeshare_data],
    FILE_FORMAT = [textformat]
) AS (SELECT
       [station_id] , 
       [name] ,
       [latitude],
       [longitude]
      
from  dbo.staging_station

);

select top 10 * from [dbo].[dim_stations];