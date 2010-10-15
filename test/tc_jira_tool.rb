require 'pp'
require 'yaml'
require 'rubygems'
require 'test/unit'
$LOAD_PATH << './lib'
require 'lib/jira_tool'

class TC_Jira4R_JiraTool < Test::Unit::TestCase
  def setup
    
    server_info = YAML.load_file("test/server_info.yaml")
    @jira = Jira4R::JiraTool.new(server_info['host'], server_info['path'], server_info['port'], server_info['default_remote_object'])
    @jira.login(server_info['username'], server_info['password'])
  end
  
  def test_get_fields_for_action
    result = @jira.get_fields_for_action("SP-4","2")
    assert(result.keys.member?("Resolution") && result.values.member?("resolution"))
  end
  
  def test_progress_workflow_action
    # 6 is the id for closed status. 2 is the action item.
    result = @jira.progress_workflow_action("SP-4", "2", {})
    assert_equal("6", result['status'])
    
    #reopen issue
    result = @jira.progress_workflow_action("SP-4", "3", {})
    assert_equal("4", result['status'])
  end
  
  def test_get_available_actions
    result = @jira.get_available_actions("SP-4")
    assert(result.keys.member?("Close Issue") && result.values.member?("2"))
  end
  
  def test_get_comments
    result = @jira.get_comments("SP-4")
    assert_equal(result.class, Array)
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
