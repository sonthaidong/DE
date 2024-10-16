SET
    FOREIGN_KEY_CHECKS = 0;

-- Insert sample data into the Customers table
INSERT INTO
    Customers (name, email, phone, address, date_joined, STATUS)
VALUES
    (
        'Nguyen Minh Tu',
        'tu.nguyen@email.com',
        '0901234567',
        '123 Nguyen Trai, HCMC',
        '2023-01-15',
        'active'
    ),
    (
        'Tran Thi Lan',
        'lan.tran@email.com',
        '0907654321',
        '456 Le Loi, HCMC',
        '2023-04-23',
        'inactive'
    ),
    (
        'Le Quang Hieu',
        'hieu.le@email.com',
        '0912345678',
        '789 Nguyen Hue, HCMC',
        '2023-07-12',
        'active'
    ),
    (
        'Pham Thu Huong',
        'huong.pham@email.com',
        '0923456789',
        '321 Hoang Sa, HCMC',
        '2022-09-05',
        'suspended'
    ),
    (
        'Hoang Minh Tu',
        'hoang.tu@email.com',
        '0934567890',
        '654 Tran Hung Dao, HCMC',
        '2023-10-01',
        'active'
    ),
    (
        'Nguyễn Văn A',
        'nguyenvana@gmail.com',
        '0987456321',
        'Hà Nội',
        '2023-01-01',
        'active'
    ),
    (
        'Trần Thị B',
        'tranthib@gmai.com',
        '0132456789',
        'Hồ Chí Minh',
        '2023-01-01',
        'active'
    ),
    (
        'Lê Văn C',
        'levanc@gmail.com',
        '0945678321',
        'Đà Nẵng',
        '2023-01-01',
        'active'
    ),
    (
        'Phạm Thị D',
        'phamthid@gmai.com',
        '0123546789',
        'Hải Phòng',
        '2023-01-01',
        'active'
    ),
    (
        'Hoàng Văn E',
        'hoangvane@gmail.com',
        '0987654328',
        'Hà Nội',
        '2023-01-01',
        'active'
    ),
    (
        'John Doe',
        'john.doe@example.com',
        '0123456789',
        '123 Main St',
        '2023-01-15',
        'active'
    ),
    (
        'Jane Smith',
        'jane.smith@example.com',
        '0987654321',
        '456 Elm St',
        '2022-11-01',
        'inactive'
    ),
    (
        'Alice Johnson',
        'alice.johnson@example.com',
        '5551234567',
        '789 Oak St',
        '2024-05-20',
        'suspended'
    );

-- Insert sample data into the Plans table
INSERT INTO
    Plans (
        name,
        data_limit,
        call_limit,
        sms_limit,
        price,
        TYPE
    )
VALUES
    ('Gói Cơ Bản', 1000, 300, 100, 150000, 'prepaid'),
    (
        'Gói Cao Cấp',
        5000,
        1000,
        300,
        500000,
        'postpaid'
    ),
    (
        'Gói Gia Đình',
        2000,
        500,
        200,
        300000,
        'prepaid'
    ),
    (
        'Gói Doanh Nghiệp',
        10000,
        5000,
        1000,
        1000000,
        'postpaid'
    ),
    (
        'Gói Sinh Viên',
        1500,
        400,
        150,
        200000,
        'prepaid'
    ),
    (
        'Gói Quốc Tế',
        3000,
        700,
        250,
        350000,
        'postpaid'
    ),
    ('Gói Thể Thao', 1200, 200, 50, 180000, 'prepaid'),
    ('Gói Mùa Hè', 2500, 600, 180, 280000, 'postpaid'),
    (
        'Gói Gia Đình Plus',
        3500,
        800,
        300,
        450000,
        'prepaid'
    ),
    (
        'Gói Doanh Nghiệp Plus',
        20000,
        7000,
        2000,
        1500000,
        'postpaid'
    ),
    (
        'Gói Cước 4G M10',
        1024,
        100,
        100,
        10.00,
        'prepaid'
    ),
    (
        'Gói Cước 4G M20',
        2048,
        200,
        200,
        20.00,
        'prepaid'
    ),
    (
        'Gói Cước 4G M50',
        5120,
        500,
        500,
        50.00,
        'prepaid'
    ),
    (
        'Gói Cước 4G M100',
        10240,
        1000,
        1000,
        100.00,
        'prepaid'
    ),
    (
        'Gói Cước 5G M30',
        3072,
        300,
        300,
        30.00,
        'prepaid'
    ),
    (
        'Gói Cước 5G M70',
        7168,
        700,
        700,
        70.00,
        'prepaid'
    ),
    (
        'Gói Cước Postpaid 4G M10',
        1024,
        100,
        100,
        10.00,
        'postpaid'
    ),
    (
        'Gói Cước Postpaid 4G M20',
        2048,
        200,
        200,
        20.00,
        'postpaid'
    ),
    (
        'Gói Cước Postpaid 4G M50',
        5120,
        500,
        500,
        50.00,
        'postpaid'
    ),
    (
        'Gói Cước Postpaid 4G M100',
        10240,
        1000,
        1000,
        100.00,
        'postpaid'
    ),
    (
        'Gói Cước Postpaid 5G M30',
        3072,
        300,
        300,
        30.00,
        'postpaid'
    ),
    (
        'Gói Cước Postpaid 5G M70',
        7168,
        700,
        700,
        70.00,
        'postpaid'
    ),
    ('Basic Plan', 100, 500, 200, 19.99, 'prepaid'),
    (
        'Premium Plan',
        500,
        1000,
        500,
        49.99,
        'postpaid'
    ),
    (
        'Unlimited Plan',
        1000,
        2000,
        1000,
        99.99,
        'postpaid'
    );

-- Insert sample data into the Subscriptions table
INSERT INTO
    Subscriptions (
        customer_id,
        plan_id,
        start_date,
        end_date,
        is_active
    )
VALUES
    (1, 1, '2023-01-15', '2024-01-15', TRUE),
    (2, 2, '2023-04-23', '2024-04-23', TRUE),
    (3, 3, '2023-07-12', '2024-07-12', TRUE),
    (4, 4, '2022-09-05', '2023-09-05', FALSE),
    (5, 5, '2023-10-01', '2024-10-01', TRUE),
    (1, 1, '2023-01-15', '2023-07-15', TRUE),
    (2, 2, '2022-11-01', '2023-11-01', TRUE),
    (3, 3, '2024-05-20', '2025-05-20', TRUE);

-- Insert sample data into the Call_Records table
INSERT INTO
    Call_Records (
        caller_id,
        receiver_id,
        start_time,
        end_time,
        duration,
        call_type
    )
VALUES
    (
        1,
        2,
        '2023-10-01 10:00:00',
        '2023-10-01 10:10:00',
        600,
        'local'
    ),
    (
        2,
        3,
        '2023-10-02 11:15:00',
        '2023-10-02 11:40:00',
        1500,
        'local'
    ),
    (
        3,
        4,
        '2023-10-03 12:00:00',
        '2023-10-03 12:20:00',
        1200,
        'international'
    ),
    (
        4,
        1,
        '2023-10-04 09:00:00',
        '2023-10-04 09:05:00',
        300,
        'local'
    ),
    (
        5,
        2,
        '2023-10-05 08:45:00',
        '2023-10-05 09:00:00',
        900,
        'international'
    ),
    (
        1,
        2,
        '2023-06-01 08:30:00',
        '2023-06-01 08:50:00',
        1200,
        'local'
    ),
    (
        2,
        3,
        '2023-07-15 14:00:00',
        '2023-07-15 14:30:00',
        1800,
        'international'
    ),
    (
        3,
        1,
        '2024-05-21 10:00:00',
        '2024-05-21 10:15:00',
        900,
        'local'
    );

-- Insert sample data into the SMS_Records table
INSERT INTO
    SMS_Records (
        sender_id,
        receiver_id,
        timestamp,
        message,
        sms_type
    )
VALUES
    (
        1,
        2,
        '2023-10-01 08:30:00',
        'Chào bạn, cuộc gọi sẽ bắt đầu vào lúc 10 giờ sáng.',
        'regular'
    ),
    (
        2,
        3,
        '2023-10-02 09:30:00',
        'Đây là tin nhắn khuyến mãi của chúng tôi!',
        'promotional'
    ),
    (
        3,
        4,
        '2023-10-03 10:15:00',
        'Hãy nhớ tham gia cuộc họp lúc 12 giờ trưa.',
        'regular'
    ),
    (
        4,
        1,
        '2023-10-04 08:00:00',
        'Cuộc gọi sẽ được thực hiện vào lúc 9 giờ sáng.',
        'regular'
    ),
    (
        5,
        2,
        '2023-10-05 09:15:00',
        'Xin chào, tin nhắn khuyến mãi từ công ty!',
        'promotional'
    ),
    (
        1,
        2,
        '2023-06-01 09:00:00',
        'Hello! How are you?',
        'regular'
    ),
    (
        2,
        3,
        '2023-07-15 15:00:00',
        'Don\'t forget the meeting tomorrow.',
        'promotional'
    ),
    (
        3,
        1,
        '2024-05-21 11:00:00',
        'Meeting at 12pm today.',
        'regular'
    );

-- Insert sample data into the Data_Usage table
INSERT INTO
    Data_Usage (customer_id, usage_date, data_used, usage_type)
VALUES
    (1, '2023-10-01', 300, 'streaming'),
    (2, '2023-10-02', 500, 'browsing'),
    (3, '2023-10-03', 700, 'downloads'),
    (4, '2023-10-04', 200, 'streaming'),
    (5, '2023-10-05', 1000, 'browsing'),
    (1, '2023-06-01', 50, 'streaming'),
    (2, '2023-07-15', 150, 'browsing'),
    (3, '2024-05-21', 200, 'downloads');

-- Insert sample data into the Devices table
INSERT INTO
    Devices (
        customer_id,
        device_type,
        model,
        os,
        purchase_date
    )
VALUES
    (
        1,
        'smartphone',
        'iPhone 13',
        'iOS 15',
        '2023-01-01'
    ),
    (
        2,
        'smartphone',
        'Samsung Galaxy S21',
        'Android 12',
        '2022-12-01'
    ),
    (
        3,
        'tablet',
        'iPad Pro',
        'iPadOS 15',
        '2023-06-01'
    ),
    (
        4,
        'smartphone',
        'Xiaomi Mi 11',
        'Android 11',
        '2022-09-01'
    ),
    (
        1,
        'Smartphone',
        'iPhone 14',
        'iOS',
        '2023-01-01'
    ),
    (
        2,
        'Tablet',
        'Samsung Galaxy Tab',
        'Android',
        '2022-05-01'
    ),
    (
        3,
        'Smartphone',
        'Google Pixel 6',
        'Android',
        '2024-02-20'
    );

-- Insert sample data into the Billing table
INSERT INTO
    Billing (customer_id, billing_date, amount, STATUS)
VALUES
    (1, '2023-10-01', 100.00, 'paid'),
    (2, '2023-10-02', 300.00, 'unpaid'),
    (3, '2023-10-03', 250.00, 'overdue'),
    (4, '2023-10-04', 150.00, 'paid'),
    (5, '2023-10-05', 500.00, 'unpaid'),
    (1, '2023-07-01', 19.99, 'paid'),
    (2, '2023-11-01', 49.99, 'unpaid'),
    (3, '2024-06-01', 99.99, 'overdue');

-- Insert sample data into the Support_Tickets table
INSERT INTO
    Support_Tickets (
        customer_id,
        subject,
        description,
        STATUS,
        created_at,
        resolved_at
    )
VALUES
    (
        1,
        'Không thể kết nối mạng',
        'Tôi không thể kết nối internet trong một số khu vực.',
        'open',
        '2023-10-01 09:00:00',
        NULL
    ),
    (
        2,
        'Hóa đơn sai',
        'Hóa đơn tháng 10 có sai sót về số tiền.',
        'pending',
        '2023-10-02 14:00:00',
        NULL
    ),
    (
        3,
        'Đã thanh toán nhưng vẫn bị khóa dịch vụ',
        'Dịch vụ của tôi vẫn bị khóa dù đã thanh toán hóa đơn.',
        'open',
        '2023-10-03 12:00:00',
        NULL
    ),
    (
        4,
        'Thay đổi gói cước',
        'Tôi muốn chuyển từ gói Family Plan sang gói Business Plan.',
        'closed',
        '2023-10-04 08:30:00',
        '2023-10-04 09:00:00'
    ),
    (
        5,
        'Không thể gửi SMS',
        'Tôi không thể gửi tin nhắn văn bản đi.',
        'open',
        '2023-10-05 11:30:00',
        NULL
    ),
    (
        1,
        'Billing Issue',
        'Charged twice for the same plan',
        'open',
        '2023-07-01 09:00:00',
        NULL
    ),
    (
        2,
        'Service Interruption',
        'No service for 24 hours',
        'closed',
        '2023-11-02 10:00:00',
        '2023-11-02 15:00:00'
    ),
    (
        3,
        'Device not working',
        'Device screen cracked',
        'pending',
        '2024-06-01 12:00:00',
        NULL
    );

-- Insert sample data into the Promotions table
INSERT INTO
    Promotions (name, discount_percentage, start_date, end_date)
VALUES
    (
        'Giảm giá 10%',
        10.00,
        '2023-09-01',
        '2023-09-30'
    ),
    (
        'Khuyến mãi mùa thu',
        15.00,
        '2023-10-01',
        '2023-10-31'
    ),
    (
        'Giảm giá cho khách hàng mới',
        20.00,
        '2023-08-01',
        '2023-08-31'
    ),
    (
        'Giảm giá 5% cho gia đình',
        5.00,
        '2023-07-01',
        '2023-07-31'
    ),
    (
        'Tặng thêm 1GB data',
        0.00,
        '2023-10-01',
        '2023-10-15'
    ),
    ('Summer Sale', 15.00, '2024-06-01', '2024-07-01'),
    (
        'Winter Offer',
        20.00,
        '2024-11-01',
        '2024-12-01'
    ),
    (
        'Giảm giá mùa thu',
        20.00,
        '2023-10-01',
        '2023-10-15'
    ),
    (
        'Khuyến mãi sinh nhật',
        15.00,
        '2023-10-05',
        '2023-10-20'
    ),
    (
        'Khuyến mãi Tết Trung Thu',
        10.00,
        '2023-09-01',
        '2023-09-30'
    ),
    (
        'Khuyến mãi mùa hè',
        25.00,
        '2023-06-01',
        '2023-06-30'
    ),
    (
        'Giảm giá cuối năm',
        30.00,
        '2023-12-01',
        '2023-12-31'
    ),
    (
        'Ưu đãi đặc biệt',
        18.00,
        '2023-10-15',
        '2023-10-31'
    ),
    (
        'Giảm giá mùa đông',
        22.00,
        '2023-12-01',
        '2023-12-15'
    ),
    (
        'Khuyến mãi ngày lễ',
        12.00,
        '2023-10-01',
        '2023-10-03'
    ),
    (
        'Khuyến mãi ngày Quốc Khánh',
        20.00,
        '2023-09-01',
        '2023-09-05'
    ),
    (
        'Gói khuyến mãi siêu tốc',
        15.00,
        '2023-08-01',
        '2023-08-31'
    ),
    (
        'Ưu đãi mùa hè',
        25.00,
        '2023-07-01',
        '2023-07-15'
    ),
    (
        'Giảm giá cho học sinh',
        20.00,
        '2023-09-01',
        '2023-09-15'
    ),
    (
        'Khuyến mãi thẻ tín dụng',
        30.00,
        '2023-10-01',
        '2023-10-31'
    ),
    (
        'Khuyến mãi đặc biệt mùa thu',
        15.00,
        '2023-09-01',
        '2023-09-30'
    ),
    (
        'Giảm giá khi thanh toán trực tuyến',
        10.00,
        '2023-09-15',
        '2023-09-30'
    ),
    (
        'Gói khuyến mãi thẻ cào',
        12.00,
        '2023-10-05',
        '2023-10-20'
    ),
    (
        'Giảm giá sinh nhật công ty',
        35.00,
        '2023-11-01',
        '2023-11-15'
    ),
    (
        'Giảm giá cho khách hàng cũ',
        10.00,
        '2023-11-01',
        '2023-11-30'
    ),
    (
        'Khuyến mãi đêm vàng',
        25.00,
        '2023-10-10',
        '2023-10-15'
    ),
    (
        'Ưu đãi cuối tuần',
        20.00,
        '2023-10-06',
        '2023-10-08'
    );

-- Insert sample data into the Promotion_Applications table
INSERT INTO
    Promotion_Applications (
        customer_id,
        promotion_id,
        application_date,
        STATUS
    )
VALUES
    (1, 1, '2023-09-15', 'approved'),
    (2, 2, '2023-10-02', 'pending'),
    (3, 3, '2023-08-10', 'approved'),
    (4, 4, '2023-07-05', 'rejected'),
    (5, 5, '2023-10-01', 'applied'),
    (1, 1, '2024-06-01', 'approved'),
    (2, 2, '2024-11-01', 'rejected'),
    (3, 1, '2024-06-01', 'applied');

SET
    FOREIGN_KEY_CHECKS = 1;