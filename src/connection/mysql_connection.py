import mysql.connector
from mysql.connector import Error, pooling
import logging

# Configure logging
logging.basicConfig(
    level=logging.INFO, format="%(asctime)s - %(levelname)s - %(message)s"
)


def create_pool(pool_name, pool_size, host_name, user_name, user_password, db_name):
    try:
        pool = mysql.connector.pooling.MySQLConnectionPool(
            pool_name=pool_name,
            pool_size=pool_size,
            pool_reset_session=True,
            host=host_name,
            user=user_name,
            password=user_password,
            database=db_name,
        )
        logging.info("Connection pool created successfully")
        return pool
    except Error as e:
        logging.error(f"The error '{e}' occurred")
        return None


def execute_query(pool, query):
    connection = pool.get_connection()
    cursor = connection.cursor()
    try:
        cursor.execute(query)
        connection.commit()
        logging.info("Query executed successfully")
    except Error as e:
        logging.error(f"The error '{e}' occurred")
    finally:
        cursor.close()
        connection.close()


def execute_read_query(pool, query):
    connection = pool.get_connection()
    cursor = connection.cursor()
    result = None
    try:
        cursor.execute(query)
        result = cursor.fetchall()
        logging.info("Query executed successfully")
        return result
    except Error as e:
        logging.error(f"The error '{e}' occurred")
    finally:
        cursor.close()
        connection.close()


# Replace with your actual database credentials
pool = create_pool("mypool", 5, "localhost", "root", "root", "telecomdb")

# Create
create_table_query = """
CREATE TABLE IF NOT EXISTS users (
  id INT AUTO_INCREMENT, 
  name TEXT NOT NULL, 
  age INT, 
  gender TEXT, 
  nationality TEXT, 
  PRIMARY KEY (id)
) ENGINE = InnoDB
"""
execute_query(pool, create_table_query)

# Insert
insert_user_query = """
INSERT INTO users (name, age, gender, nationality) VALUES 
('James', 25, 'male', 'USA'),
('Leila', 32, 'female', 'France'),
('Brigitte', 35, 'female', 'UK');
"""
execute_query(pool, insert_user_query)

# Read
select_users_query = "SELECT * FROM users"
users = execute_read_query(pool, select_users_query)
for user in users:
    logging.info(user)

# Update
update_user_query = """
UPDATE users
SET age = 26
WHERE name = 'James'
"""
execute_query(pool, update_user_query)

# Delete
delete_user_query = "DELETE FROM users WHERE name = 'Brigitte'"
execute_query(pool, delete_user_query)

# Delete test table
users = execute_read_query(pool, select_users_query)
for user in users:
    logging.info(user)

delete_table_query = "DROP TABLE users"
execute_query(pool, delete_table_query)
