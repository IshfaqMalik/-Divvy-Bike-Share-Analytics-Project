CREATE EXTERNAL TABLE dbo.staging_trip (
	[Trip_Id] nvarchar(4000),
	[rideable_type] nvarchar(4000),
	[Started_At] varchar(50),
	[Ended_At] varchar(50),
	[Start_Station_Id] nvarchar(4000),
	[End_Station_Id] nvarchar(4000),
	[Member_Id] bigint
	)
	WITH (
	LOCATION = 'public.trip.txt',
	DATA_SOURCE = [bikeshare_data],
	FILE_FORMAT = [textformat]
	)



select top 10 * from dbo.staging_trip


