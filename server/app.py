import uuid
from flask import Flask, jsonify, request
from operations import DBOperations
import boto3
from dotenv import load_dotenv
import os
from flask_cors import CORS
from flask_jwt_extended import JWTManager, create_access_token, jwt_required, get_jwt_identity, decode_token
from datetime import timedelta, datetime, timezone
import jwt
load_dotenv()

app = Flask(__name__)
app.config['JWT_SECRET_KEY'] = os.environ["TOKEN_SECRET_KEY"]
app.config['JWT_ACCESS_TOKEN_EXPIRES'] = timedelta(days=30)  
jwt = JWTManager(app)
CORS(app)

operations_obj = DBOperations()

jwt = JWTManager(app)

def create_user_token(payload):
   return create_access_token(identity=payload)

def generate_uuid():
    return str(uuid.uuid4())

def get_file_extension(file_name):
    _, file_extension = os.path.splitext(file_name)
    return file_extension

def get_file_url(file):
    file_extension = get_file_extension(file.filename)
    image_id = generate_uuid() + file_extension
    s3_base_url = f"https://{os.getenv('S3_BUCKET_NAME')}.s3.amazonaws.com/"
    image_url = f"{s3_base_url}"
    return image_id, image_url

def upload_image_s3(data,folder_name):
    try:
        image_id, image_url = get_file_url(data)
        s3 = boto3.client('s3', aws_access_key_id=os.getenv("S3_ACCESS_KEY"), aws_secret_access_key=os.getenv("S3_SECRET_KEY"))
        image_path = f"{folder_name}/{image_id}"
        s3.upload_fileobj(data, os.getenv("S3_BUCKET_NAME"), image_path)
       
        print(image_url + image_path)
        return image_url + image_path
    except Exception as e:
        return jsonify({"error": f"Error processing request: {e}"}), 500

def delete_image_from_s3(image_key):
    s3 = boto3.client('s3', aws_access_key_id=os.getenv("S3_ACCESS_KEY"), aws_secret_access_key=os.getenv("S3_SECRET_KEY"))
    filename = os.path.basename(image_key)
    try:
        # Delete the object
        s3.delete_object(Bucket=os.getenv("S3_BUCKET_NAME"), Key=filename)
        print(f"Image {filename} deleted successfully from {os.getenv("S3_BUCKET_NAME")}")
    except Exception as e:
        print(f"Error deleting image {filename} from {os.getenv("S3_BUCKET_NAME")}: {e}")

@app.route('/apis/auth/check-token/', methods=['POST'])
def check_token():
    token = request.json.get('token', None)
    if not token:
        return jsonify({"msg": "Missing token"}), 400
    return jsonify(validate_token(token=token))

def validate_token(token):    
    try:
        decoded_token = decode_token(token)
        exp_timestamp = decoded_token['exp']
        now = datetime.now(timezone.utc)
        exp_datetime = datetime.fromtimestamp(exp_timestamp, tz=timezone.utc)
        remaining_time = exp_datetime - now

        if remaining_time > timedelta(0):
            
            return {
                "status":True,
                "details":decoded_token['sub'],
                "msg": "Token is valid", "remaining_time": str(remaining_time)}
        else:
            return jsonify({
                "status":False,
                "msg": "Token has expired"}), 401

    except jwt.ExpiredSignatureError:
        return jsonify({
            "status":False,
            "msg": "Token has expired"}), 401
    except jwt.InvalidTokenError:
        return jsonify({
            "status":False,
            "msg": "Invalid token"}), 401

@app.route('/apis/users/register/', methods=['POST'])
def register_user():
    data = request.get_json()
    full_name = data.get('full_name')
    email = data.get('email')
    password = data.get('password')

    if not full_name:
        return jsonify({"error": "Full name is required"}), 400
    if not email:
        return jsonify({"error": "Email is required"}), 400
    if not password:
        return jsonify({"error": "Password is required"}), 400
    return operations_obj.register_user(full_name=full_name,password=password,email=email)

@app.route('/apis/users/login/', methods=['POST'])
def user_login():
    data = request.get_json()
    email = data.get('email')
    password = data.get('password')
    
    if not email:
        return jsonify({"error": "Email is required"}), 400
    if not password:
        return jsonify({"error": "Password is required"}), 400

    response = operations_obj.login_user(email=email, password=password)
    print(response)
    if 'error' in response:
        return jsonify(response), 401

    payload = {"email": email, "full_name": response['response']['records'][0]['full_name']}
    user_token = create_user_token(payload)

    # Add user_token to the first record in the records list
    response_data = response.get('response', {})
    records = response_data.get('records', [])
    if records:
        records[0]['user_token'] = user_token
    return jsonify(response)

@app.route('/apis/users/get-profile/', methods=['GET'])
def get_profile():
    auth_header = request.headers.get('Authorization')
    if auth_header:
        token = auth_header.split(" ")[1]
        
        response =  validate_token(token)
        if response['status'] == True:
            response['details']['email']
            print(response['details']['email'])
            return operations_obj.get_user_details(response['details']['email'])
        return response, 200
    else:
        return jsonify({"message": "Authorization header missing"}), 401
    
@app.route('/apis/category/create-category/', methods=['POST'])
def add_category():
    category_name = request.form['category_name']
    username = request.form['username']
    status = request.form['status'].lower() == 'true'
    category_image = request.files['category_image']
    image_url =  upload_image_s3(category_image,'product_category')
    response = operations_obj.add_category(category_id=generate_uuid(),category_name=category_name,username=username,status=status,category_image=image_url)
    return response

@app.route('/apis/category/get-category-list/', methods=['GET'])
def get_all_category():
    response = operations_obj.get_all_category()
    return response

if __name__ == '__main__':
    app.run(debug=True, port=4000)