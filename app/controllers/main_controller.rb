class MainController < ApplicationController
def index
@quotation=Quotation.new
q=Quotation.find(:all)
l=rand(q.length)
if q[l]
@quote=q[l]
end
@visit_details=Hash.new()
#Have to store the place info in session, otherwise it will get queried everytime the home page is accessed and it is a time-consuming operation.
unless session["Your Place"]
place=find_location_main(request.remote_addr)
session["Your Place"] = place["city"] +","+ place["country"]
session["Your Browser"]= request.env["HTTP_USER_AGENT"]
session["Your IP"]= request.env["REMOTE_ADDR"]
session["Supported Charset"]= request.env["HTTP_ACCEPT_CHARSET"]
end
@visit_details["Your Place"] = session["Your Place"]
@visit_details["Your Browser"]= session["Your Browser"]
@visit_details["Your IP"]= session["Your IP"]
@visit_details["Supported Charset"]= session["Supported Charset"]


end

def clear
reset_session
redirect_to :back
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
