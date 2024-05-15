from flask import Flask
import socket
app = Flask(__name__)

@app.route('/')
def hello():
	return "HOLA MUNDO: Tercer examen parcial - Virtualizacion - Paola Mérida - 1084120 "

if __name__ == '__main__':
	app.run(host='0.0.0.0', port=8000)