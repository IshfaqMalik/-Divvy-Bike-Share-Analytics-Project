CREATE EXTERNAL TABLE [dbo].[staging_station]
(
	[station_id] varchar(5000),
	[name] VARCHAR (5000),
	[latitude] VARCHAR(5000),
	longitude VARCHAR (5000)

)
WITH 
(LOCATION = 'public.station.txt',
DATA_SOURCE = [bikeshare_data],
FILE_FORMAT = [textformat] )