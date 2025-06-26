
--
IF OBJECT_ID ('dbo.fact_trips') is not NULL
begin 
drop EXTERNAL table dbo.fact_trips 
end 
CREATE EXTERNAL TABLE [dbo].[fact_trips]
WITH(
    LOCATION = 'star_schema/fact_trips',
    DATA_SOURCE = [bikeshare_data],
    FILE_FORMAT = [textformat]
) AS (SELECT
       t.Trip_id, 
       t.Member_id,
       t.rideable_type,
       t.Started_At,
       t.Start_Station_id, 
       t.Ended_At,
       t.End_Station_Id, 
       DATEDIFF(MINUTE,t.Started_At, t.Ended_At) as duration,
	   DATEDIFF(YEAR, r.birthday, t.Started_At) as rider_age
from  dbo.staging_trip t
join  dbo.staging_rider r
on t.Member_id = r.rider_id
);

select top 10 * from [dbo].[fact_trips];