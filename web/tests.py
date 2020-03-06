from django.test import TestCase, tag


@tag("unit")
class YourTestClass(TestCase):
    def test_helloworld_page(self):
        response = self.client.get("/")
        self.assertEqual(response.status_code, 200)
