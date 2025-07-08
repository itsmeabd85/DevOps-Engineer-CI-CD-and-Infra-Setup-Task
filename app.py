from flask import Flask
app = Flask(__name__)

@app.route("/")
def home():
    return """
    <html>
      <head>
        <title>DevOps CICD App</title>
        <style>
          body {
            background-color: #00aa00;
            color: black;
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
          }
          h1 {
            background-color: yellow;
            padding: 20px 40px;
            border-radius: 10px;
            font-size: 48px;
            font-weight: bold;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
          }
        </style>
      </head>
      <body>
        <h1>🚀  Hello! This is a sample DevOps - CI/CD Project-Task </h1>
      </body>
    </html>
    """

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5001)
