\copy (SELECT ml.message_log_id,ml.message_uuid,ml.created_date,ml.procedure_name,ml.error_message,ml.update_request_id,uq.schema_id from message_log ml left join update_requests uq on ml.update_request_id = uq.update_request_id where uq.status != 'COMPLETE' order by ml.created_date asc) To '/tmp/ams-reporting/5AZUREDB_AMD_message_log_errors.csv' With CSV DELIMITER ','
