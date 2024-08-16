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
    args = parser.parse_args()
    app.run(host='0.0.0.0', port=args.port)