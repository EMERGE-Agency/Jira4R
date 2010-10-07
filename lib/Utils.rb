module JiraXMLRPC4R
  class Utils
	  def self.caller_method(depth=1)
		parse_caller(caller(depth+1).first).last
	  end
    
    def self.camelized_caller_method(depth=1)
		  result = parse_caller(caller(depth+1).first).last
		  camelize(result, false)
    end
    
    private
    #copied from http://github.com/rails/rails/blob/master/activesupport/lib/active_support/inflector/methods.rb
    def self.camelize(lower_case_and_underscored_word, first_letter_in_uppercase = true)
      if first_letter_in_uppercase
        lower_case_and_underscored_word.to_s.gsub(/\/(.?)/) { "::#{$1.upcase}" }.gsub(/(?:^|_)(.)/) { $1.upcase }
      else
        lower_case_and_underscored_word.to_s[0].chr.downcase + camelize(lower_case_and_underscored_word)[1..-1]
      end
    end
    
	  #From ActionMailer
	  def self.parse_caller(at)
  		if /^(.+?):(\d+)(?::in `(.*)')?/ =~ at
  		  file   = Regexp.last_match[1]
  		  line   = Regexp.last_match[2].to_i
  		  method = Regexp.last_match[3]
  		  [file, line, method]
  		end
	  end
	end
end
