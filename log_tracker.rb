class LogTracker 

	attr_accessor :user_choice

	require './modules/log_formatter'

	require "pry"

	require "json"

	require "date"

	DIR_NAME =  `git rev-parse --show-toplevel`

	include LogFormatter

	def initialize
		repo_name = DIR_NAME.split("\n").join("").split("/")
		@git_log = `git log --pretty=format:'{%n  "commit": "%H",%n  "author": "%an <%ae>",%n  "date": "%ad",%n  "title": "%s",%n "description": "%b", %n "project_name": "#{repo_name.pop}"%n},' --since="yesterday"` 
		@tasks_array = Array.new
	end

	def output_log
		json_data = self.format_json(@git_log)
		if valid_json?(@git_log)
			puts json_data
		else
			puts "Sorry Json Data is in bad format"
		end
	end


	def parse_json
		tasks = ["bug fixing", "development"]
		tasks.each_with_index do |value, key|
			task_hash = Hash.new
			task_hash[key] = value
			@tasks_array.push(task_hash)
		end
	end

	def user_data
		@tasks_array.each do |tasks|
			tasks.each do |key, value|
				puts key
				puts value
			end
		end
		puts "When Did You start The Project ?"
		user_time = gets.chomp
		begin
			parse_date = DateTime.parse(user_time)
		rescue DateTime::ParserError => e
			return false
		end
	end

	private 

	def valid_json?(git_data)
		begin
		  JSON.parse(git_data)
		  return true  
		rescue JSON::ParserError => e  
			return true
		end 
	end	

end

git = LogTracker.new
git.parse_json
git.user_data
git.output_log