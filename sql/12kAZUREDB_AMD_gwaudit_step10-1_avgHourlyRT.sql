\copy (SELECT date_trunc('hour',updated_date) as "Date",round(avg(TOTAL_SEC)*1000) as "AVG(Total Roundtrip in Millisecs)",round(sum(TOTAL_SEC/60)::numeric,3) as "TotalWorkload in Mins",count(*) as "RecordCount" FROM (SELECT a.updated_date,a.message_uuid as uuid,EXTRACT(EPOCH from (b.updated_date-a.updated_date)) as TOTAL_SEC FROM (select updated_date,message_status_id,message_uuid from themis_gateway.message_audit where message_status_id = 1 and updated_date > Current_DATE-1) a,(select updated_date,message_status_id,message_uuid from themis_gateway.message_audit where message_status_id = 10 and updated_date > Current_DATE-1) b WHERE a.message_uuid = b.message_uuid) x GROUP BY date_trunc('hour',updated_date)
order by 1 desc) To '/tmp/ams-reporting/12kAZUREDB_AMD_gwaudit_step10-1_avgHourlyRT.csv' With CSV DELIMITER ','
