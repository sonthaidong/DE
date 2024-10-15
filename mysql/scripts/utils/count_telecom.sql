USE telecomdb;

SELECT
    GROUP_CONCAT(
        CONCAT(
            'SELECT "',
            table_name,
            '" AS table_name, COUNT(*) AS row_count FROM ',
            table_name
        ) SEPARATOR ' UNION ALL '
    ) INTO @sql
FROM
    information_schema.tables
WHERE
    table_schema = 'telecomdb';

-- Chuẩn bị và thực thi câu truy vấn động
PREPARE stmt
FROM
    @sql;

EXECUTE stmt;

DEALLOCATE PREPARE stmt;