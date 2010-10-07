module JiraXMLRPC4R
  class JiraTool
    def initialize(host=nil,path=nil,port=nil,username=nil,password=nil)
      
    end
    
    #boolean	addComment(java.lang.String token, java.lang.String issueKey, java.lang.String comment) 
    #Adds a comment to an issue
    #java.util.Hashtable	createIssue(java.lang.String token, java.util.Hashtable rIssueStruct) 
    #Creates an issue in JIRA from a Hashtable object.
    #java.util.Vector	getComments(java.lang.String token, java.lang.String issueKey) 
    #Returns all comments associated with the issue
    #java.util.Vector	getComponents(java.lang.String token, java.lang.String projectKey) 
    #Returns all components available in the specified project
    #java.util.Vector	getFavouriteFilters(java.lang.String token) 
    #Gets all favourite filters available for the currently logged in user
    #java.util.Hashtable	getIssue(java.lang.String token, java.lang.String issueKey) 
    #Gets an issue from a given issue key.
    #java.util.Vector	getIssuesFromFilter(java.lang.String token, java.lang.String filterId) 
    #Executes a saved filter
    #java.util.Vector	getIssuesFromTextSearch(java.lang.String token, java.lang.String searchTerms) 
    #Find issues using a free text search
    #java.util.Vector	getIssuesFromTextSearchWithProject(java.lang.String token, java.util.Vector projectKeys, java.lang.String searchTerms, int maxNumResults) 
    #Find issues using a free text search, limited to certain projects
    #java.util.Vector	getIssueTypes(java.lang.String token) 
    #Returns all visible issue types in the system
    #java.util.Vector	getIssueTypesForProject(java.lang.String token, java.lang.String projectId) 
    #Returns all visible (non-sub task) issue types for the specified project id
    #java.util.Vector	getPriorities(java.lang.String token) 
    #Returns all priorities in the system
    #java.util.Vector	getProjectsNoSchemes(java.lang.String token) 
    #Returns a list of projects available to the user
    #java.util.Vector	getResolutions(java.lang.String token) 
    #Returns all resolutions in the system
    #java.util.Hashtable	getServerInfo(java.lang.String token) 
    #Returns the Server information such as baseUrl, version, edition, buildDate, buildNumber.
    #java.util.Vector	getStatuses(java.lang.String token) 
    #Returns all statuses in the system
    #java.util.Vector	getSubTaskIssueTypes(java.lang.String token) 
    #Returns all visible subtask issue types in the system
    #java.util.Vector	getSubTaskIssueTypesForProject(java.lang.String token, java.lang.String projectId) 
    #Returns all visible sub task issue types for the specified project id.
    #java.util.Hashtable	getUser(java.lang.String token, java.lang.String username) 
    #Returns a user's information given a username
    #java.util.Vector	getVersions(java.lang.String token, java.lang.String projectKey) 
    #Returns all versions available in the specified project
    #java.lang.String	login(java.lang.String username, java.lang.String password) 
    #Logs the user into JIRA.
    #boolean	logout(java.lang.String token) 
    #Logs the user out of JIRA
    #java.util.Hashtable	updateIssue(java.lang.String token, java.lang.String issueKey, java.util.Hashtable fieldValues) 
    #Updates an issue in JIRA from a Hashtable object.
  end
end
