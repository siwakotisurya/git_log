class LogTracker 

	require './modules/log_formatter'

	DIR_NAME =  `git rev-parse --show-toplevel`

	include LogFormatter

	def initialize
		repo_name = DIR_NAME.split("\n").join("").split("/")
		@git_log = `git log --pretty=format:'{%n  "commit": "%H",%n  "author": "%an <%ae>",%n  "date": "%ad",%n  "title": "%s",%n "description": "%b", %n "project_name": "#{repo_name.pop}"%n},' --since="yesterday"` 
	end

	def output_log
		json_data = self.format_json(@git_log)
	end

end

git = LogTracker.new

git.output_log