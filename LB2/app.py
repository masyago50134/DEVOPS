from flask import Flask, jsonify

app = Flask(__name__)

APP_VERSION = "1.0.0"


@app.route("/")
def index():
    return (
        "<h1>Python CI/CD Demo</h1>"
        "<p>Простий Flask-застосунок для демонстрації CI/CD.</p>"
        '<p>Перевір: <a href="/health">/health</a> і <a href="/version">/version</a>.</p>'
    )


@app.route("/health")
def health():
    """Ендпоінт для health-check (зручно для CI/CD, контейнерів, оркестраторів)."""
    return jsonify({"status": "ok"}), 200


@app.route("/version")
def version():
    """Повертає поточну версію застосунку."""
    return jsonify({"version": APP_VERSION}), 200


if __name__ == "__main__":
    # Використовуй змінну середовища PORT у продакшені (Docker/Heroku тощо)
    import os

    port = int(os.getenv("PORT", "5000"))
    app.run(host="0.0.0.0", port=port)