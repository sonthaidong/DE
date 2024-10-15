SET
    FOREIGN_KEY_CHECKS = 0;

SET
    @@cte_max_recursion_depth = 10000;

CREATE TEMPORARY TABLE IF NOT EXISTS temp_numbers (n INT);

-- Recursive CTE để tạo <number> bản ghi
INSERT INTO
    temp_numbers (n) WITH RECURSIVE numbers AS (
        -- Bước đầu tiên: Khởi tạo dãy số từ 1
        SELECT
            1 AS n
        UNION
        ALL -- Bước tiếp theo: Tạo số tiếp theo bằng cách cộng thêm 1 vào n
        SELECT
            n + 1
        FROM
            numbers -- Điều kiện dừng: Khi n đạt đến <number> thì dừng
        WHERE
            n < 1000
    )
SELECT
    n
FROM
    numbers;

-- Insert data into Customers table
INSERT INTO
    Customers (name, email, phone, address, date_joined, STATUS)
SELECT
    CONCAT('Customer ', n),
    -- Tạo tên khách hàng dạng 'Customer n'
    CONCAT('customer', n, '@example.com'),
    -- Tạo email khách hàng dạng 'customer n@example.com'
    CONCAT('12345678', n),
    -- Tạo số điện thoại dạng '12345678n'
    CONCAT('Address ', n),
    -- Tạo địa chỉ dạng 'Address n'
    DATE_ADD('2023-01-01', INTERVAL FLOOR(RAND() * 365) DAY),
    -- Ngày tham gia ngẫu nhiên trong năm 2023
    CASE
        WHEN RAND() < 0.7 THEN 'active' -- 70% xác suất là 'active'
        WHEN RAND() < 0.9 THEN 'inactive' -- 20% xác suất là 'inactive'
        ELSE 'suspended' -- 10% xác suất là 'suspended'
    END
FROM
    temp_numbers
LIMIT
    1000;

SET
    FOREIGN_KEY_CHECKS = 1;