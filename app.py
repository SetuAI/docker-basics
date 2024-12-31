"Example of a very basic Flask application"

from flask import Flask, jsonify
import pandas as pd

app = Flask(__name__)

# Sample data for the DataFrame
data = {
    "name": ["Alice", "Bob", "Charlie"],
    "age": [25, 30, 35],
    "city": ["New York", "Los Angeles", "Chicago"]
}
df = pd.DataFrame(data)

# Route for the root URL
@app.route('/')
def home():
    return "Welcome to REBIT. Please visit /data to see the data."

# Route to return data as JSON
@app.route('/data', methods=['GET'])
def get_data():
    # Convert DataFrame to a dictionary for JSON response
    result = df.to_dict(orient='records')
    return jsonify(result)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
    
    
"after this we will dockerize it"

"to create docker image, create DOCKERFILE"