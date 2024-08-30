from flask import jsonify
import psycopg2
from dotenv import load_dotenv
import os
from datetime import datetime
import pytz
from flask_bcrypt import Bcrypt


load_dotenv()
bcrypt = Bcrypt()
def hash_password(password):
    return bcrypt.generate_password_hash(password).decode('utf-8')

def hash_password_check(hash_password,password):
    return bcrypt.check_password_hash(hash_password,password)
class DBOperations:

    def get_current_date_time(self):
        utc_now = datetime.utcnow()
        utc_timezone = pytz.timezone('UTC')
        utc_now = utc_timezone.localize(utc_now)
        ist_timezone = pytz.timezone('Asia/Kolkata')
        ist_now = utc_now.astimezone(ist_timezone)
        return ist_now.strftime("%Y-%m-%d %H:%M:%S %Z")
    
    def create_connection(self):
        try:
            conn = psycopg2.connect(
                dbname=os.getenv("DB_NAME"),
                user=os.getenv("DB_USER"),
                password=os.getenv("DB_PASSWORD"),
                host=os.getenv("DB_HOST"),
                port=os.getenv("DB_PORT")
            )
            return conn
        except Exception as e:
            print(f"Error connecting to the database: {e}")
            return None
    
    def add_category(self,category_id, category_name, category_image, username, status):
        try:
            db_connect = self.create_connection()
            if db_connect:
                cur = db_connect.cursor()

                query = """
                    INSERT INTO product_category (category_id, category_name, category_image, username, last_modified, status)
                    VALUES (%s, %s, %s, %s, %s, %s)
                """

                print("Modified Date Time ",self.get_current_date_time())
                data = (category_id, category_name, category_image, username, self.get_current_date_time(), status)

                cur.execute(query, data)
                db_connect.commit()

                cur.close()

                return jsonify({"message": "New Category added successfully."}), 200
        except Exception as e:
            print(f"Error adding category: {e}")
            return jsonify({"message": "Failed to add category."}), 200

    def get_all_category(self):
        try:
            query = '''
                SELECT * FROM product_category
            '''
            conn = self.create_connection()
            if conn:
                cur = conn.cursor()
                cur.execute(query)
                category_details = cur.fetchall()
                cur.close()
                conn.close()
                column_names = [desc[0] for desc in cur.description]
                category_list = {
                    "response": {
                        "msg": "We have successfully fetched category list",
                        "records": [
                            {column_names[i]: row[i] for i in range(len(row))} for row in category_details
                        ],
                        "status": True,
                    }
                }

                return jsonify(category_list)
        except Exception as e:
            print(f"Error retrieving category details from the database: {e}")
            return jsonify({"error": f"Error retrieving category details from the database: {e}"})