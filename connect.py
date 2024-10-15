import logging
from cassandra.cluster import Cluster
from cassandra.auth import PlainTextAuthProvider
from uuid import uuid4

# Thiết lập logging
logging.basicConfig(
    level=logging.INFO, format="%(asctime)s - %(levelname)s - %(message)s"
)
logger = logging.getLogger(__name__)


# Bước 1: Thiết lập kết nối với Cassandra
def connect_to_cassandra():
    try:
        # Nếu có xác thực (username, password), bạn có thể cung cấp ở đây
        auth_provider = PlainTextAuthProvider(
            username="cassandra", password="your_password"
        )
        cluster = Cluster(
            ["127.0.0.1"], auth_provider=auth_provider
        )  # Địa chỉ IP của Cassandra cluster
        session = cluster.connect()
        session.set_keyspace("your_keyspace")  # Chọn keyspace
        logger.info("Connected to Cassandra successfully!")
        return session, cluster
    except Exception as e:
        logger.error(f"Error connecting to Cassandra: {e}")
        raise


# Bước 2: Tạo bảng nếu chưa tồn tại
def create_table(session):
    try:
        create_table_query = """
        CREATE TABLE IF NOT EXISTS users (
            user_id UUID PRIMARY KEY,
            username text,
            email text
        );
        """
        session.execute(create_table_query)
        logger.info("Table created successfully!")
    except Exception as e:
        logger.error(f"Error creating table: {e}")
        raise


# Bước 3: Thêm dữ liệu vào bảng
def insert_data(session):
    try:
        insert_query = """
        INSERT INTO users (user_id, username, email) 
        VALUES (%s, %s, %s);
        """
        # Thêm một dòng dữ liệu vào bảng
        user_id = uuid4()
        session.execute(insert_query, (user_id, "john_doe", "john@example.com"))
        logger.info(f"Data inserted successfully! User ID: {user_id}")
    except Exception as e:
        logger.error(f"Error inserting data: {e}")
        raise


# Bước 4: Truy vấn dữ liệu từ bảng
def query_data(session):
    try:
        select_query = "SELECT * FROM users;"
        rows = session.execute(select_query)
        logger.info("Query executed successfully!")
        logger.info("Query Results:")
        for row in rows:
            logger.info(
                f"User ID: {row.user_id}, Username: {row.username}, Email: {row.email}"
            )
    except Exception as e:
        logger.error(f"Error querying data: {e}")
        raise


# Bước 5: Cập nhật dữ liệu trong bảng
def update_data(session):
    try:
        update_query = """
        UPDATE users
        SET email = %s
        WHERE user_id = %s;
        """
        # Cập nhật email của một người dùng cụ thể (sử dụng ID thực tế của người dùng)
        some_user_id = uuid4()  # Đây là một ID giả lập, thay thế bằng ID thực tế
        session.execute(update_query, ("new_email@example.com", some_user_id))
        logger.info(f"Data updated successfully! User ID: {some_user_id}")
    except Exception as e:
        logger.error(f"Error updating data: {e}")
        raise


# Bước 6: Xóa dữ liệu khỏi bảng
def delete_data(session):
    try:
        delete_query = """
        DELETE FROM users WHERE user_id = %s;
        """
        some_user_id = uuid4()  # Đây là một ID giả lập, thay thế bằng ID thực tế
        session.execute(delete_query, (some_user_id,))
        logger.info(f"Data deleted successfully! User ID: {some_user_id}")
    except Exception as e:
        logger.error(f"Error deleting data: {e}")
        raise


# Bước 7: Đóng kết nối với Cassandra
def close_connection(cluster):
    try:
        cluster.shutdown()
        logger.info("Connection closed successfully!")
    except Exception as e:
        logger.error(f"Error closing connection: {e}")
        raise


# Main function to run all steps
def main():
    logger.info("Starting Cassandra operations...")

    # Kết nối đến Cassandra
    session, cluster = connect_to_cassandra()

    # Tạo bảng (nếu chưa có)
    create_table(session)

    # Thêm dữ liệu vào bảng
    insert_data(session)

    # Truy vấn dữ liệu từ bảng
    query_data(session)

    # Cập nhật dữ liệu trong bảng
    update_data(session)

    # Xóa dữ liệu khỏi bảng
    delete_data(session)

    # Đóng kết nối với Cassandra
    close_connection(cluster)


# Chạy chương trình
if __name__ == "__main__":
    main()
