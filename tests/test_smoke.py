from app.main import app

def test_home_route():
    client = app.test_client()
    r = client.get('/')
    assert r.status_code == 200
    assert 'message' in r.get_json()
