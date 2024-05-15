# Importing necessary libraries
from flask import Flask, request, jsonify
import requests

app = Flask(__name__)


@app.route('/consume', methods=['GET'])
def consume():
    # GET a Hola Mundo
    response = requests.get('http://localhost:8000/data')

    return jsonify(response.json())

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=True)