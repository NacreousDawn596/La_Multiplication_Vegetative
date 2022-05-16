import flask
import sys

app = flask.Flask(__name__, template_folder="./")

@app.route("/")
def index():
    return flask.render_template("index.html")

@app.route("/assets/<path:file>")
def upload(file):
    return flask.send_file(f"./assets/{file}")

app.run(host=sys.argv[1])
