\copy (select max(RR_ID) from RECONCILIATION_RUNS) To '/scripts/9iAZUREDB_AMD_maintenance_recon_RRID.csv' With CSV DELIMITER ','