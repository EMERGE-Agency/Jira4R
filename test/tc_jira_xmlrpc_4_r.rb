require 'test/unit'
require 'jira_xmlrpc_4_r.rb'

class TC_JiraXMLRPC4R < Test::Unit::TestCase
  def setup
    @jira = JiraXMLRPC4R::JiraTool.new("server", "/rpc/xmlrpc", port, "jira1")
  end
  
  def test_login
    assert_nothing_raised do  
      @jira.login("username", "password")
    end  
  end
  
  def test_getIssue
    assert_nothing_raised do
      @jira.getIssue
    end
  end
  
  def teardown
    @jira = nil
  end
end
