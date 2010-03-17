class MainController < ApplicationController
def index
@visit_details=Hash.new()
place=find_location_main(request.remote_addr)
@visit_details["Your Place"] = place["city"] +","+ place["country"]
@visit_details["Your Browser"]= request.env["HTTP_USER_AGENT"]
@visit_details["Your IP"]= request.env["REMOTE_ADDR"]
@visit_details["Supported Charset"]= request.env["HTTP_ACCEPT_CHARSET"]
end


private
def find_location_main(ip_add)
require 'timeout'
require 'net/http'
#ip_add = "122.167.31.3" #this works
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
