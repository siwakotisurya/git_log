module LogFormatter

	def format_json(git_log)
		 beautify_format = '{"git_commit":['+git_log+"]}"
		 json_format = beautify_format.split(",]").join("]")
		 return json_format 
	end

end


