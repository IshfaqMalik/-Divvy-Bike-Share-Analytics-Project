create EXTERNAL DATA SOURCE [bikeshare_data]
WITH(
    LOCATION = 'https://udacity001.blob.core.windows.net/udacity001/',
    
);
CREATE EXTERNAL FILE FORMAT [textformat]
WITH(
    FORMAT_TYPE = DELIMITEDTEXT,
    FORMAT_OPTIONS(
        FIELD_TERMINATOR = ',',
        FIRST_ROW =2,
        USE_TYPE_DEFAULT = FALSE)
);

create EXTERNAL TABLE dbo.staging_payment(
    [payment_id] varchar (5000), 
    [date] varchar (5000), 
    [amount] varchar (5000),
    [rider_id]varchar (5000)
    )
    WITH(
        LOCATION = 'public.payment.txt',
        DATA_SOURCE = [bikeshare_data],
        FILE_FORMAT = [textformat]
    
);

