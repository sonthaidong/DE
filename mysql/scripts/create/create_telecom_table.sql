USE telecomdb;

-- Creating the Customers table
CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone VARCHAR(20) NOT NULL UNIQUE,
    address VARCHAR(255),
    date_joined DATE NOT NULL,
    STATUS ENUM('active', 'inactive', 'suspended') DEFAULT 'active'
);

-- Creating the Plans table
CREATE TABLE IF NOT EXISTS Plans (
    plan_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    data_limit INT NOT NULL,
    -- in MB
    call_limit INT NOT NULL,
    -- in minutes
    sms_limit INT NOT NULL,
    -- in count
    price DECIMAL(10, 2) NOT NULL,
    -- assuming 2 decimal places for price
    TYPE ENUM('prepaid', 'postpaid') NOT NULL
);

-- Creating the Subscriptions table
CREATE TABLE IF NOT EXISTS Subscriptions (
    subscription_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    plan_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (plan_id) REFERENCES Plans(plan_id)
);

-- Creating the Call_Records table
CREATE TABLE IF NOT EXISTS Call_Records (
    call_id INT AUTO_INCREMENT PRIMARY KEY,
    caller_id INT NOT NULL,
    receiver_id INT NOT NULL,
    start_time DATETIME NOT NULL,
    end_time DATETIME NOT NULL,
    duration INT NOT NULL,
    -- in seconds
    call_type ENUM('local', 'international') NOT NULL,
    FOREIGN KEY (caller_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (receiver_id) REFERENCES Customers(customer_id)
);

-- Creating the SMS_Records table
CREATE TABLE IF NOT EXISTS SMS_Records (
    sms_id INT AUTO_INCREMENT PRIMARY KEY,
    sender_id INT NOT NULL,
    receiver_id INT NOT NULL,
    timestamp DATETIME NOT NULL,
    message TEXT NOT NULL,
    sms_type ENUM('regular', 'promotional') NOT NULL,
    FOREIGN KEY (sender_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (receiver_id) REFERENCES Customers(customer_id)
);

-- Creating the Data_Usage table
CREATE TABLE IF NOT EXISTS Data_Usage (
    usage_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    usage_date DATE NOT NULL,
    data_used INT NOT NULL,
    -- in MB
    usage_type ENUM('streaming', 'browsing', 'downloads') NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Creating the Devices table
CREATE TABLE IF NOT EXISTS Devices (
    device_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    device_type VARCHAR(255) NOT NULL,
    model VARCHAR(255) NOT NULL,
    os VARCHAR(255) NOT NULL,
    purchase_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Creating the Billing table
CREATE TABLE IF NOT EXISTS Billing (
    billing_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    billing_date DATE NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    STATUS ENUM('paid', 'unpaid', 'overdue') NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Creating the Support_Tickets table
CREATE TABLE IF NOT EXISTS Support_Tickets (
    ticket_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    subject VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    STATUS ENUM('open', 'closed', 'pending') NOT NULL,
    created_at DATETIME NOT NULL,
    resolved_at DATETIME,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Creating the Promotions table
CREATE TABLE IF NOT EXISTS Promotions (
    promotion_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    discount_percentage DECIMAL(5, 2) NOT NULL,
    -- assuming percentage with 2 decimal places
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

-- Creating the Promotion_Applications table
CREATE TABLE IF NOT EXISTS Promotion_Applications (
    application_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    promotion_id INT NOT NULL,
    application_date DATE NOT NULL,
    STATUS ENUM('applied', 'approved', 'rejected', 'pending') NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (promotion_id) REFERENCES Promotions(promotion_id)
);