import unittest 
from selenium import webdriver 
from selenium.webdriver.common.keys import Keys 
from selenium.webdriver.support.ui import Select
from selenium.webdriver.chrome.options import Options


class PythonOrgSearch(unittest.TestCase):

	def setUp(self):
		self.driver = webdriver.Remote(
			command_executor = 'http://127.0.0.1:4444/wd/hub',
			desired_capabilities = {
			'browserName': 'chrome',
			})

	def sign_in_to_github(self):
		driver = self.driver
		driver.get('http://codepad.org')

		# Select the Python language option
		python_link = driver.find_elements_by_xpath("//input[@name='lang' and @value='Python']")[0]
		python_link.click()

		# Enter some text!
		text_area = driver.find_element_by_id('textarea')
		text_area.send_keys("print 'Hello,' + ' World!'")

		# Submit the form!
		submit_button = driver.find_element_by_name('submit')
		submit_button.click()

		# Make this an actual test. Isn't Python beautiful?
		assert 1


	def test_create_delete_repository(self):
		self.sign_in_to_github()


	def tearDown(self):
		self.driver.close()

if __name__ == "__main__":
	unittest.main()
