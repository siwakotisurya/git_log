module LogFormatter


	require "pry"

	def format_json(git_log)
		 beautify_format = '{"git_commit":['+git_log+"]}"
		 json_format = beautify_format.split(",]").join("]")
		 puts json_format  
	end

end


