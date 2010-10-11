require 'pp'
require 'rubygems'
gem 'test-unit'
require 'test/unit'
$LOAD_PATH << './lib'
require 'lib/jira_4_r'

class TC_Jira4R_JiraTool < Test::Unit::TestCase
  def setup
  end
  
  def test_caller_method
    result = test_caller_method_helper
    assert_equal(result, "test_caller_method")
  end
  
  def test_camelized_caller_method
    result = test_camelized_caller_method_helper
    assert_equal(result, "testCamelizedCallerMethod")
  end
  
  def test_camelize
    result = Jira4R::Utils.camelize("my_test_method", false)
    assert_equal(result, "myTestMethod")
  end
  
  def teardown
  end
  
  private
  def test_camelized_caller_method_helper
    Jira4R::Utils.camelized_caller_method
  end
  
  def test_caller_method_helper
    Jira4R::Utils.caller_method
  end
end
