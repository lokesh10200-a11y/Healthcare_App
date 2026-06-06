from app.app import flask_app

def test_home():
    client = flask_app.test_client()
    response = client.get("/")
    assert response.status_code == 200