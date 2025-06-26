IF OBJECT_ID ('dbo.dim_dates') is not NULL
begin 
drop EXTERNAL table dbo.dim_dates
end 
CREATE EXTERNAL TABLE [dbo].[dim_dates]
WITH(
    LOCATION = 'star_schema/dim_dates',
    DATA_SOURCE = [bikeshare_data],
    FILE_FORMAT = [textformat]
) AS SELECT
    CONVERT(INT, FORMAT(ride_date, 'yyyyMMdd')) AS date_key,
    ride_date AS full_date,
    DATENAME(WEEKDAY, ride_date) AS day_name,
    DATEPART(DAY, ride_date) AS day,
    DATEPART(MONTH, ride_date) AS month
    
FROM (
    SELECT DISTINCT CAST(started_at AS DATE) AS ride_date
    FROM dbo.fact_trips
) AS distinct_dates
SELECT 
 top 10 * from dim_dates


