CREATE EXTERNAL TABLE [dbo].[staging_rider]
(
	 [rider_id] VARCHAR (5000),
	 [first] VARCHAR (5000),
	 [last] VARCHAR (5000),
	 [address] VARCHAR (5000),
	 [account_start_date] VARCHAR(5000),
	 [account_end_date] VARCHAR(5000),
	 [is_member] VARCHAR(5000)
)
WITH
(
	LOCATION = 'public.rider.txt',
	DATA_SOURCE = [bikeshare_data],
	FILE_FORMAT = [textformat]
);
