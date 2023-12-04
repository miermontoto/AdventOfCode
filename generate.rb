require 'net/http'
require 'uri'
require 'date'

# read arguments or use defaults
session = ENV['AOC_session'] || (puts "Missing 'session' cookie."; exit)
day = ARGV[0] || Time.now.day
year = ARGV[1] || Time.now.year

# generate folders if they don't already exist
Dir.mkdir("#{year}") unless File.directory?("#{year}")
Dir.mkdir("#{year}/input") unless File.directory?("#{year}/input")

# generate the structure of a ruby file for the day
File.open("#{year}/day#{day}.rb", "w") do |file|
    file.puts "# advent of code #{year}, day #{day}"
    file.puts "# solution by miermontoto"
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
uri = URI.parse("https://adventofcode.com/#{year}/day/#{day}/input")
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
request = Net::HTTP::Get.new(uri.request_uri)
request['Cookie'] = "session=#{session};"
response = http.request(request)
File.write("#{year}/input/#{day}", response.body)
