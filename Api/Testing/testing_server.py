import unittest
import requests
import threading
import time
from flask import Flask


from server import app

class TestMyFunction(unittest.TestCase):
    def setUp(self):
        self.app = app.test_client()
        
        self.server_thread = threading.Thread(target=app.run, kwargs={'debug': False, 'host': '127.0.0.1', 'port': 8002})
        self.server_thread.start()

        time.sleep(2)

    def tearDown(self):
        self.server_thread.join(timeout=1)

    def test_api_my_function(self):
        response = self.app.get('/')

        # response status code
        self.assertEqual(response.status_code, 200)

        self.assertIn(b'Drowsiness Detection', response.data)
        self.assertIn(b'Warning', response.data)

if __name__ == '__main__':
    unittest.main()
