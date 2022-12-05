require 'net/http'
require 'uri'
require 'date'

day = ARGV[0] || (puts "Usage: ruby generate.rb <day>"; exit)

# Generate the structure of a ruby file for the day
File.open("day#{day}.rb", "w") do |file|
    file.puts "# Advent of Code 2022, day #{day}"
    file.puts
    file.puts "def star_one(input)"
    file.puts "end"
    file.puts
    file.puts "def star_two(input)"
    file.puts "end"
    file.puts
    file.puts "input = File.read(\"input/#{day}\")"
    file.puts "puts \"star one: \#{star_one(input)}\""
    file.puts "puts \"star two: \#{star_two(input)}\""
end

# Download the input for the day using personal cookie
# Read cookie from enviroment variable
session = ENV['AOC_session'] || (puts "Missing 'session' cookie."; exit)
ru = ENV['AOC_ru'] || (puts "Missing 'ru' cookie.'"; exit)

uri = URI.parse("https://adventofcode.com/#{Time.now.year}/day/#{day}/input")
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
request = Net::HTTP::Get.new(uri.request_uri)
request['Cookie'] = "session=#{session}; ru=#{ru}"
response = http.request(request)
File.write("input/#{day}", response.body)
