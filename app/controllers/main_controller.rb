class MainController < ApplicationController
def index
#puts request.inspect
@place = find_location_main(request.remote_addr)
#@browser = request.http_user_agent
@browser = "dummy"
puts ".............................................................#{request.env}........................................."
#puts "-----------------------#{request.referrer}---------------------------------------------"
end
def visit_browser
@browser = request.http_user_agent
end
def visit_place
@place= "Bangalore"
end

private

def find_location_main(ip_add)
require 'timeout'
require 'net/http'
ip_add = "122.22.47.125"
begin
Timeout::timeout(5) {
	http=Net::HTTP.post_form(URI.parse('http://api.hostip.info/get_html.php'), {'ip'=>ip_add})
	if http
	puts ".......................... #{http.body}..." 
	location=Hash.new()
	country_str=http.body.split("\n")[0].split(":")[1].split("(")[0].strip
	city_str=http.body.split("\n")[1].split(":")[1].split(",")[0].strip
	location["country"]=country_str
	location["city"]=city_str
	puts location
	return location
	end
}
rescue Timeout::Error
puts "Resolving location from ip timed out................................."
location={"country"=>"timed out", "city"=>"timed out"}
return location
end		
end
end
