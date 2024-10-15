SET
    FOREIGN_KEY_CHECKS = 0;

-- Xóa tất cả các bảng trong cơ sở dữ liệu hiện tại
-- Lưu ý: Thay "your_database_name" bằng tên cơ sở dữ liệu thực tế của bạn
USE telecomdb;

-- Tạo danh sách tất cả các bảng và xóa từng bảng
SET
    @tables = (
        SELECT
            GROUP_CONCAT(table_name)
        FROM
            information_schema.tables
        WHERE
            table_schema = 'telecomdb'
    );

SELECT
    @tables;

-- Thực hiện câu lệnh DROP TABLE
SET
    @query = CONCAT('DROP TABLE IF EXISTS ', @tables);

SELECT
    @query;

PREPARE stmt
FROM
    @query;

EXECUTE stmt;

DEALLOCATE PREPARE stmt;

SET
    FOREIGN_KEY_CHECKS = 1;