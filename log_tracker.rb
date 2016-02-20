class LogTracker

	attr_accessor :start_time

	def initialize
		@start_time = start_time
	end

	def git_log
		`git log --after="yesterday"`
	end

end
