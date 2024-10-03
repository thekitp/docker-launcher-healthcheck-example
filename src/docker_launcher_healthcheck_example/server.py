# dummy server for testing docker healthcheck

from flask import Flask
import random
import argparse

app = Flask(__name__)

@app.route('/healthcheck')
def healthcheck():
    if random.random() < 0.3:
        return 'Internal Server Error', 500
    return 'OK', 200

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--port', type=int, default=8080)
    parser.add_argument('--host', type=str, default='0.0.0.0')
    args = parser.parse_args()
    app.run(host=args.host, port=args.port)