from flask import Flask, render_template, request
import boto3
import os

app = Flask(__name__)
# Retrieve AWS credentials from environment variables
# aws_access_key = os.environ['AWS_ACCESS_KEY_ID']
# aws_secret_key = os.environ['AWS_SECRET_ACCESS_KEY']

# # Initialize a Boto3 DynamoDB client with the credentials
# dynamodb = boto3.client('dynamodb', aws_access_key_id=aws_access_key, aws_secret_access_key=aws_secret_key)

# Initialize DynamoDB client
aws_region = 'us-east-1'
dynamodb = boto3.client('dynamodb', region_name=aws_region)

# DynamoDB table names
table1_name = 'vl-test-repo-names'
table2_name =  'vl-test-repo-names'

# Function to fetch data from DynamoDB or return dummy data
def get_dynamodb_data(table_name):
    
    try:
        # List DynamoDB tables
        tables = dynamodb.list_tables()
        print("DynamoDB tables:", tables)

        # Query a DynamoDB table (replace with your table name)
        response = dynamodb.scan(TableName=table_name)
        
        print("DynamoDB query result:", response)

    except Exception as e:
        # Log any exceptions that occur
        print("Error:", e)
        
    try:
        response = dynamodb.scan(TableName=table_name)
        items = response.get('Items', [])
        return items
    except Exception as e:
        print(f"Error connecting to DynamoDB: {e}")
        # Return dummy data if there's an issue connecting to DynamoDB
        dummy_data = [
            {
                "repo_name": {"S": "dummy data vlclient"},
                "build_commit_id": {"S": "df318df"},
                "deploy_commit_id": {"S": "df318df"},
                "status": {"S": "deployed"},
                "branch": {"S": "master"},
                "Last_time": {"S": "11-02-23:12:22"}   
            },
            {
                "repo_name": {"S": "dummy data vladmin"},
                "build_commit_id": {"S": "e18df8"},
                "deploy_commit_id": {"S": "e18df8"},
                "status": {"S": "building"},
                "branch": {"S": "master"},
                "Last_time": {"S": "12-02-23:12:22"}   
            }
        ]
        # dummy_data = []
        return dummy_data

@app.route('/healthcheck')
def health_check():
    return 'This node is healthy'

@app.route('/')
def index():
    # table = request.args.get('table')
    # if table == 'table1':
    #     items = get_dynamodb_data(table1_name)
    # elif table == 'table2':
    #     items = get_dynamodb_data(table2_name)
    # else:
    #     # Handle invalid or missing table parameter
    #     items = []
        
    items = get_dynamodb_data(table1_name)           
    return render_template('index.html', items=items)

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')

