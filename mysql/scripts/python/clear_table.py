import mysql.connector


# Kết nối đến MySQL
def connect_to_mysql():
    return mysql.connector.connect(
        host="localhost",  # Địa chỉ máy chủ MySQL
        user="root",  # Tên người dùng MySQL
        password="root",  # Mật khẩu MySQL
        database="telecomdb",  # Tên cơ sở dữ liệu
    )


# Thực hiện TRUNCATE tất cả các bảng trong cơ sở dữ liệu
def truncate_all_tables():
    try:
        # Kết nối đến MySQL
        conn = connect_to_mysql()
        cursor = conn.cursor()

        # Tắt kiểm tra khóa ngoại để tránh lỗi khi có ràng buộc khóa ngoại
        cursor.execute("SET FOREIGN_KEY_CHECKS = 0;")

        # Lấy tất cả các bảng trong cơ sở dữ liệu
        cursor.execute("SHOW TABLES;")
        tables = cursor.fetchall()

        # Thực thi TRUNCATE TABLE cho từng bảng
        for table in tables:
            table_name = table[0]  # Lấy tên bảng
            truncate_query = f"TRUNCATE TABLE `{table_name}`;"
            print(f"Đang thực thi: {truncate_query}")
            cursor.execute(truncate_query)

        # Bật lại kiểm tra khóa ngoại
        cursor.execute("SET FOREIGN_KEY_CHECKS = 1;")

        # Commit các thay đổi
        conn.commit()

        print("Tất cả các bảng đã được TRUNCATE thành công!")

    except mysql.connector.Error as err:
        print(f"Lỗi: {err}")

    finally:
        cursor.close()
        conn.close()


# Gọi hàm để TRUNCATE tất cả các bảng
truncate_all_tables()
