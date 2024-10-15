DROP DATABASE IF EXISTS telecomdb;
CREATE DATABASE telecomdb CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
source /scripts/create/create_telecom_table.sql;
source /scripts/sample/customers.sql;
source /scripts/sample/telecom_data.sql;
source /scripts/sample/temp_devices.sql;
source /scripts/create/create_telecom_data.sql;
source /scripts/utils/count_telecom.sql;