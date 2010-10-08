require 'rubygems'
gem 'test-unit'
require 'test/unit'
$LOAD_PATH << './lib'
require 'lib/jira_4_r'

class TC_Jira4R < Test::Unit::TestCase
  def setup
    @jira = Jira4R::JiraTool.new("server", "/rpc/xmlrpc", port, "jira1")
    @jira.login("username", "password")
  end
  
  def test_camelize
    result = Jira4R::Utils.camelize("my_test_method", false)
    assert_equal(result, "myTestMethod")
  end
  
  def test_login
    @jira = Jira4R::JiraTool.new("server", "/rpc/xmlrpc", port, "jira1")
    assert_nothing_raised do  
      @jira.login("username", "password")
    end  
  end
  
  def test_get_issue
    result = ''
    assert_nothing_raised do
      result = @jira.get_issue("SP-4")
    end
    assert_equal(result['summary'], "It don't work")
  end
  
  def test_add_comment
    assert(@jira.add_comment("SP-4", "#{Time.now}"))
  end
  
  def test_get_statuses
    result = @jira.get_statuses
    result.collect!{|status| status['name']}
    assert(result.member? "Closed")
  end
  
  def teardown
    @jira.logout
    @jira = nil
  end
end
