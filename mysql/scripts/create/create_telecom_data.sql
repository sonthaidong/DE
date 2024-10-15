SET
    FOREIGN_KEY_CHECKS = 0;

-- Insert data into Subscriptions table
INSERT INTO
    Subscriptions (
        customer_id,
        -- ID khách hàng
        plan_id,
        -- ID gói đăng ký (chọn ngẫu nhiên từ bảng Plans)
        start_date,
        -- Ngày bắt đầu của đăng ký (ngẫu nhiên trong năm 2023)
        end_date,
        -- Ngày kết thúc của đăng ký (ngẫu nhiên, sau 30 ngày kể từ ngày bắt đầu)
        is_active -- Trạng thái hoạt động của đăng ký (90% xác suất hoạt động)
    )
SELECT
    customer_id,
    -- Chọn ID khách hàng từ bảng Customers
    (
        SELECT
            plan_id
        FROM
            Plans
        ORDER BY
            RAND()
        LIMIT
            1
    ), -- Chọn ngẫu nhiên 1 plan_id từ bảng Plans
    DATE_ADD('2023-01-01', INTERVAL FLOOR(RAND() * 365) DAY),
    -- Chọn ngẫu nhiên ngày bắt đầu trong năm 2023
    DATE_ADD(
        '2023-01-01',
        INTERVAL FLOOR(RAND() * 365) + 30 DAY -- Chọn ngẫu nhiên ngày kết thúc, ít nhất 30 ngày sau ngày bắt đầu
    ),
    CASE
        WHEN RAND() < 0.9 THEN TRUE -- 90% xác suất đăng ký có trạng thái "hoạt động"
        ELSE FALSE -- 10% xác suất đăng ký có trạng thái "không hoạt động"
    END
FROM
    Customers;

-- Insert data into Devices table
INSERT INTO
    Devices (
        customer_id,
        -- ID khách hàng
        device_type,
        -- Loại thiết bị
        model,
        -- Tên thiết bị
        os,
        -- Hệ điều hành
        purchase_date -- Ngày mua
    )
SELECT
    (
        SELECT
            customer_id
        FROM
            Customers
        ORDER BY
            RAND()
        LIMIT
            1
    ), -- Chọn ID khách hàng ngẫu nhiên từ bảng Customers
    device_type, -- Chọn loại thiết bị từ bảng temp_devices
    model, -- Chọn tên thiết bị từ bảng temp_devices
    os, -- Chọn hệ điều hành từ bảng temp_devices
    purchase_date -- Chọn ngày mua từ bảng temp_devices
FROM
    temp_devices;

DROP TEMPORARY TABLE IF EXISTS temp_devices;

-- Insert data into Call_Records table
INSERT INTO
    Call_Records (
        caller_id,
        -- ID của người gọi
        receiver_id,
        -- ID của người nhận
        start_time,
        -- Thời gian bắt đầu cuộc gọi
        end_time,
        -- Thời gian kết thúc cuộc gọi
        duration,
        -- Thời gian cuộc gọi (tính bằng giây)
        call_type -- Loại cuộc gọi: 'local' (nội mạng) hoặc 'international' (quốc tế)
    )
SELECT
    caller_id,
    -- Lấy ID của người gọi từ bảng con `caller`
    receiver_id,
    -- Lấy ID của người nhận từ bảng con `receiver`
    DATE_ADD('2023-01-01', INTERVAL FLOOR(RAND() * 365) DAY),
    -- Thời gian bắt đầu cuộc gọi, ngẫu nhiên trong năm 2023
    DATE_ADD(
        '2023-01-01',
        INTERVAL FLOOR(RAND() * 365) + FLOOR(RAND() * 1800) SECOND
    ),
    -- Thời gian kết thúc cuộc gọi, ngẫu nhiên từ thời gian bắt đầu (tối đa 365 ngày và 1800 giây)
    FLOOR(RAND() * 1800),
    -- Thời gian cuộc gọi (tính bằng giây), ngẫu nhiên từ 0 đến 1800 giây (30 phút)
    CASE
        WHEN RAND() < 0.8 THEN 'local' -- 80% khả năng cuộc gọi là nội mạng
        ELSE 'international' -- 20% khả năng cuộc gọi là quốc tế
    END
FROM
    (
        -- Lấy 200 người gọi (caller) từ bảng Customers có customer_id <= 500
        SELECT
            customer_id AS caller_id
        FROM
            Customers
        WHERE
            customer_id <= 500
        ORDER BY
            RAND() -- Xáo trộn ngẫu nhiên để chọn người gọi
        LIMIT
            100 -- Lấy 100 người gọi
    ) AS caller,
    (
        -- Lấy 200 người nhận (receiver) từ bảng Customers có customer_id > 500
        SELECT
            customer_id AS receiver_id
        FROM
            Customers
        WHERE
            customer_id > 500
        ORDER BY
            RAND() -- Xáo trộn ngẫu nhiên để chọn người nhận
        LIMIT
            200 -- Lấy 200 người nhận
    ) AS receiver;

-- Insert data into SMS_Records table
INSERT INTO
    SMS_Records (
        sender_id,
        -- ID của người gửi tin nhắn
        receiver_id,
        -- ID của người nhận tin nhắn
        timestamp,
        -- Thời gian gửi tin nhắn
        message,
        -- Nội dung tin nhắn
        sms_type -- Loại tin nhắn: 'regular' (thường) hoặc 'promotional' (quảng cáo)
    )
SELECT
    sender_id,
    -- Lấy ID của người gửi từ bảng con `caller`
    receiver_id,
    -- Lấy ID của người nhận từ bảng con `receiver`
    DATE_ADD('2023-01-01', INTERVAL FLOOR(RAND() * 365) DAY),
    -- Thời gian gửi tin nhắn, ngẫu nhiên trong năm 2023
    CONCAT('Message from ', sender_id, ' to ', receiver_id),
    -- Nội dung tin nhắn: "Message from sender_id to receiver_id"
    CASE
        WHEN RAND() < 0.7 THEN 'regular' -- 70% khả năng tin nhắn là loại thường
        ELSE 'promotional' -- 30% khả năng tin nhắn là loại quảng cáo
    END
FROM
    (
        -- Lấy 200 người gửi (sender) từ bảng Customers có customer_id <= 500
        SELECT
            customer_id AS sender_id
        FROM
            Customers
        WHERE
            customer_id <= 500
        ORDER BY
            RAND() -- Xáo trộn ngẫu nhiên để chọn người gửi
        LIMIT
            200 -- Lấy 200 người gửi
    ) AS caller,
    (
        -- Lấy 200 người nhận (receiver) từ bảng Customers có customer_id > 500
        SELECT
            customer_id AS receiver_id
        FROM
            Customers
        WHERE
            customer_id > 500
        ORDER BY
            RAND() -- Xáo trộn ngẫu nhiên để chọn người nhận
        LIMIT
            300 -- Lấy 300 người nhận
    ) AS receiver;

-- Insert data into Data_Usage table with more samples
INSERT INTO
    Data_Usage (
        customer_id,
        -- ID của khách hàng sử dụng dữ liệu
        usage_date,
        -- Ngày sử dụng dữ liệu
        data_used,
        -- Dữ liệu đã sử dụng (tính bằng MB)
        usage_type -- Loại sử dụng dữ liệu: 'streaming', 'browsing' hoặc 'downloads'
    )
SELECT
    customer_id,
    -- Lấy ngẫu nhiên ID khách hàng từ bảng Customers
    DATE_ADD('2023-01-01', INTERVAL FLOOR(RAND() * 365) DAY),
    -- Ngày sử dụng dữ liệu, ngẫu nhiên trong năm 2023
    FLOOR(RAND() * 500),
    -- Dữ liệu sử dụng ngẫu nhiên (tối đa 500 MB)
    CASE
        WHEN RAND() < 0.5 THEN 'streaming' -- 50% khả năng sử dụng dữ liệu cho streaming (xem video trực tuyến)
        WHEN RAND() < 0.8 THEN 'browsing' -- 30% khả năng sử dụng dữ liệu cho browsing (duyệt web)
        ELSE 'downloads' -- 20% khả năng sử dụng dữ liệu cho downloads (tải về)
    END
FROM
    Customers,
    -- Chọn tất cả các khách hàng từ bảng Customers
    (
        SELECT
            n
        FROM
            temp_numbers
        LIMIT
            20 -- Lặp lại để tạo nhiều dữ liệu hơn
    ) AS n;

-- Insert data into Billing table
INSERT INTO
    Billing (
        customer_id,
        -- ID của khách hàng
        billing_date,
        -- Ngày lập hóa đơn
        amount,
        -- Số tiền hóa đơn (tính bằng đơn vị tiền tệ)
        STATUS -- Trạng thái hóa đơn: 'paid', 'unpaid', hoặc 'overdue'
    )
SELECT
    customer_id,
    -- Lấy ID khách hàng từ bảng `Customers`
    DATE_ADD('2023-01-01', INTERVAL FLOOR(RAND() * 365) DAY),
    -- Ngày lập hóa đơn ngẫu nhiên trong năm 2023
    ROUND(RAND() * 100, 2),
    -- Số tiền hóa đơn ngẫu nhiên, từ 0 đến 100, làm tròn đến 2 chữ số thập phân
    CASE
        WHEN RAND() < 0.7 THEN 'paid' -- 70% khả năng hóa đơn đã thanh toán ('paid')
        WHEN RAND() < 0.9 THEN 'unpaid' -- 20% khả năng hóa đơn chưa thanh toán ('unpaid')
        ELSE 'overdue' -- 10% khả năng hóa đơn quá hạn ('overdue')
    END
FROM
    Customers,
    -- Lấy tất cả các khách hàng từ bảng Customers
    (
        SELECT
            n
        FROM
            temp_numbers
        LIMIT
            10 -- Nhân bản dữ liệu để tạo nhiều bản ghi
    ) AS n;

-- Insert data into Support_Tickets table
INSERT INTO
    Support_Tickets (
        customer_id,
        -- ID của khách hàng
        subject,
        -- Chủ đề của ticket hỗ trợ
        description,
        -- Mô tả chi tiết của ticket hỗ trợ
        STATUS,
        -- Trạng thái của ticket: 'open', 'closed', hoặc 'pending'
        created_at,
        -- Ngày tạo ticket
        resolved_at -- Ngày giải quyết ticket
    )
SELECT
    customer_id,
    CONCAT('Issue ', FLOOR(RAND() * 1000000)),
    -- Mã ngẫu nhiên cho chủ đề
    CONCAT(
        'Description for issue ',
        FLOOR(RAND() * 1000000)
    ),
    -- Mã ngẫu nhiên cho mô tả
    CASE
        WHEN RAND() < 0.4 THEN 'open' -- 40% khả năng trạng thái là 'open'
        WHEN RAND() < 0.8 THEN 'closed' -- 40% khả năng trạng thái là 'closed'
        ELSE 'pending' -- 20% khả năng trạng thái là 'pending'
    END,
    DATE_ADD('2023-01-01', INTERVAL FLOOR(RAND() * 365) DAY),
    -- Ngày tạo ticket, ngẫu nhiên trong năm 2023
    CASE
        WHEN RAND() < 0.5 THEN DATE_ADD('2023-01-01', INTERVAL FLOOR(RAND() * 365) DAY) -- Ngày giải quyết ticket, ngẫu nhiên trong năm 2023
        ELSE NULL -- Nếu không có ngày giải quyết, để NULL
    END
FROM
    Customers,
    -- Lấy tất cả các khách hàng từ bảng `Customers`
    (
        SELECT
            n
        FROM
            temp_numbers
        LIMIT
            3 -- Nhân bản dữ liệu để tạo nhiều bản ghi
    ) AS n;

-- Insert data into Promotion_Applications table
INSERT INTO
    Promotion_Applications (
        customer_id,
        -- ID của khách hàng tham gia khuyến mãi
        promotion_id,
        -- ID của chương trình khuyến mãi
        application_date,
        -- Ngày đăng ký tham gia khuyến mãi
        STATUS -- Trạng thái của đơn đăng ký tham gia khuyến mãi
    )
SELECT
    customer_id,
    -- Lấy ID khách hàng từ bảng `Customers`
    (
        SELECT
            promotion_id
        FROM
            Promotions
        ORDER BY
            RAND()
        LIMIT
            1
    ), -- Lấy ID khuyến mãi ngẫu nhiên trong bảng Promotions
    DATE_ADD('2023-01-01', INTERVAL FLOOR(RAND() * 365) DAY),
    -- Ngày đăng ký tham gia khuyến mãi ngẫu nhiên trong năm 2023
    CASE
        WHEN RAND() < 0.25 THEN 'applied' -- 25% khả năng trạng thái là 'applied'
        WHEN RAND() < 0.5 THEN 'approved' -- 25% khả năng trạng thái là 'approved'
        WHEN RAND() < 0.75 THEN 'rejected' -- 25% khả năng trạng thái là 'rejected'
        ELSE 'pending' -- 25% khả năng trạng thái là 'pending'
    END
FROM
    Customers,
    -- Lấy tất cả các khách hàng từ bảng `Customers`
    (
        SELECT
            n -- Sử dụng bảng tạm `temp_numbers` để tạo các bản ghi lặp lại
        FROM
            temp_numbers
        LIMIT
            5 -- Nhân bản dữ liệu để tạo nhiều bản ghi
    ) AS n;

DROP TEMPORARY TABLE IF EXISTS temp_numbers;

SET
    FOREIGN_KEY_CHECKS = 1;