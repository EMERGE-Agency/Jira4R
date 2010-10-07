require 'xmlrpc/client'

module JiraXMLRPC4R
  #returns the name of the calling method. Will be used to find files named for tests.
	class Utils
	  def self.caller_method(depth=1)
		parse_caller(caller(depth+1).first).last
	  end
    
    def self.camelized_caller_method(depth=1)
		  camelize(parse_caller(caller(depth+1).first).last)
    end
    
    #From http://github.com/rails/rails/blob/master/activesupport/lib/active_support/inflector/methods.rb
    def self.camelize(lower_case_and_underscored_word, first_letter_in_uppercase = false)
      if first_letter_in_uppercase
        lower_case_and_underscored_word.to_s.gsub(/\/(.?)/) { "::#{$1.upcase}" }.gsub(/(?:^|_)(.)/) { $1.upcase }
      else
        lower_case_and_underscored_word.to_s[0].chr.downcase + camelize(lower_case_and_underscored_word)[1..-1]
      end
    end
    
	  private
	  #Stolen from ActionMailer, where this was used but was not made reusable
	  def self.parse_caller(at)
  		if /^(.+?):(\d+)(?::in `(.*)')?/ =~ at
  		  file   = Regexp.last_match[1]
  		  line   = Regexp.last_match[2].to_i
  		  method = Regexp.last_match[3]
  		  [file, line, method]
  		end
	  end
	end

  
  class JiraTool
    
    def initialize(host=nil,path=nil,port=nil,username=nil,password=nil, default_remote_object = "jira1")
      @service = XMLRPC::Client.new(host, path, port)
      @default_remote_object = default_remote_object
    end
    
    def login(username, password)
      @token = call_remote_method(username, password)
    end
    
    def call_remote_method(*args)
      args.insert(0, @token) if @token
      @service.call("#{@default_remote_object}.#{Utils.camelized_caller_method}", *args)
    end
    
    #boolean	addComment(string token, string issueKey, string comment) 
    #Adds a comment to an issue
    
    #hash	createIssue(string token, hash rIssueStruct) 
    #Creates an issue in JIRA from a Hashtable object.
    
    #array	getComments(string token, string issueKey) 
    #Returns all comments associated with the issue
    
    #array	getComponents(string token, string projectKey) 
    #Returns all components available in the specified project
    
    #hash	getIssue(string token, string issueKey) 
    #Gets an issue from a given issue key.
    
    #array	getIssuesFromFilter(string token, string filterId) 
    #Executes a saved filter
    
    #array	getIssuesFromTextSearch(string token, string searchTerms) 
    #Find issues using a free text search
    
    #array	getIssuesFromTextSearchWithProject(string token, array projectKeys, string searchTerms, int maxNumResults) 
    #Find issues using a free text search, limited to certain projects

    #array	getIssueTypesForProject(string token, string projectId) 
    #Returns all visible (non-sub task) issue types for the specified project id
    #array	getSubTaskIssueTypesForProject(string token, string projectId) 
    #Returns all visible sub task issue types for the specified project id.
    
    #hash	getUser(string token, string username) 
    #Returns a user's information given a username
    
    #array	getVersions(string token, string projectKey) 
    #Returns all versions available in the specified project
    
    #string	login(string username, string password) 
    #Logs the user into JIRA.
    
    #hash	updateIssue(string token, string issueKey, hash fieldValues) 
    #Updates an issue in JIRA from a Hashtable object.
    
    #TODO: Construct these from array.
    #array	getFavouriteFilters(string token) 
    #Gets all favourite filters available for the currently logged in user
    
    #array	getIssueTypes(string token) 
    #Returns all visible issue types in the system
    
    #array	getPriorities(string token) 
    #Returns all priorities in the system
    
    #array	getProjectsNoSchemes(string token) 
    #Returns a list of projects available to the user
    
    #array	getResolutions(string token) 
    #Returns all resolutions in the system
    
    #hash	getServerInfo(string token) 
    #Returns the Server information such as baseUrl, version, edition, buildDate, buildNumber.
    
    #array	getStatuses(string token) 
    #Returns all statuses in the system
    
    #array	getSubTaskIssueTypes(string token) 
    #Returns all visible subtask issue types in the system
    
    #boolean	logout(string token) 
    #Logs the user out of JIRA
  end  
end
