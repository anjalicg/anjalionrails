class MainController < ApplicationController
before_filter :logged_in?, :only=>'admin'
require 'rexml/document'
include REXML
def logging
@filename = "production.log"
@fLog = File.open("#{RAILS_ROOT}/log/#{@filename}").read.split("\n\n\n")
end

def index
begin
	@quotation=Quotation.new
	q=Quotation.find(:all)
	l=rand(q.length)
	if q[l]
		@quote=q[l]
	end
	@visit_details=Hash.new()
	#Have to store the place info in session, otherwise it will get queried everytime the home page is accessed and it is a time-consuming operation.
	unless session["Your Place"]
		@visitor=Visitor.new()
		place=find_location_main(request.remote_addr)
		if place["city"]
		@visitor.city=place["city"]
		end
		if place["country"]
		@visitor.country=place["country"]
		end
		@visitor.ip= request.env["REMOTE_ADDR"]
		time_now = Time.new
		@visitor.vtime=time_now
		@visitor.vdate=Date.civil(time_now.year, time_now.month, (time_now-time_now.gmt_offset).day)
		@visitor.save
		session["Your Place"] = place["city"] +","+ place["country"]
		session["Your Browser"]= request.env["HTTP_USER_AGENT"]
		session["Your IP"]= request.env["REMOTE_ADDR"]
		session["Supported Charset"]= request.env["HTTP_ACCEPT_CHARSET"]
	end
	@visit_details["Your Place"] = session["Your Place"]
	@visit_details["Your Browser"]= session["Your Browser"]
	@visit_details["Your IP"]= session["Your IP"]
	@visit_details["Supported Charset"]= session["Supported Charset"]
	@count = Visitor.find(:all).length
	time_now = Time.new
	@count_today =Visitor.find(:all, :conditions=>{:vdate=>Date.civil(time_now.year, time_now.month, (time_now-time_now.gmt_offset).day)}).length
	city_country=@visit_details["Your Place"].split(",")
	@count_place = Visitor.find(:all, :conditions=>{:city=>city_country[0]}).length
	@word_of_day = scrap_word()
	begin
	@weather = get_weather(session["Your Place"].split(",")[0])
	rescue Exception => err
	end
rescue Exception=>@exception_happened

end

end

def clear
reset_session
redirect_to :back
end
def about_site
end
def about_me
end
def login
if session[:user]=="admin"
render :controller=>'main', :action=>'admin'
end
case request.method
when :post
if params[:login][:user]=="anjaliIsDAdmin.com" and params[:login][:password] == "A1!A1!B2@C3#E5%H8*MU"
session[:user]="admin"
redirect_to :controller=>"main", :action=>"admin"
end
end

end
def admin
end
def logout
reset_session
redirect_to :controller=>'main', :action=>'index'
end

private

def get_weather (place)
require 'net/http'
require 'rexml/document' 
require 'uri'
#puts ".......................................Place is #{place} ......................................."
begin
Timeout::timeout(5) {
http = Net::HTTP.new('www.google.com')
resp,data=http.get2("/ig/api?weather=#{place}",{'User-Agent'=>'ruby/net::http' , 'Connection'=> 'keep-alive'})
#puts resp
#puts data
xmlstr= REXML::Document.new data
weather = Hash.new(0)
found = false
XPath.each(xmlstr, "//current_conditions") { |e|
e.elements.each {|p|
weather[p.name] = p.attributes["data"]
found  = true
} # End of each element
} # End of XPath loop

if found
return weather
else 
return nil
end
} #End of timeout
rescue Timeout::Error
#puts "Weather api timed out............"
return nil
end

end

def scrap_word()
require 'net/http'
require 'strscan'
result=Hash.new()
begin
	Timeout::timeout(5) {
		http=Net::HTTP.start('www.merriam-webster.com') {|h|
			resp,body=h.get('/cgi-bin/mwwod.pl')
			if resp.code=="200"
			str=StringScanner.new(resp.body)
			str.skip_until(/headword.>/)
			word=str.scan_until(/</).chomp("<")
			str.skip_until(/func.>/)
			type=str.scan_until(/</).chomp("<")
			str.skip_until(/"sense_marker"/)
			str.skip_until(/<\/span>/)
			meaning=str.scan_until(/<\/dd>/)
			#puts meaning
			result["word"]=word
			result["type"]=type
			result["meaning"]=meaning
			return result
			else
			return nil
			end
		}
	}
rescue Timeout::Error
	#puts "Geting word of the day timed out................................."
	return nil
end
end

def find_location_main(ip_add)
require 'timeout'
require 'net/http'
#ip_add = "122.167.31.3" #this works
begin
Timeout::timeout(5) {
	http=Net::HTTP.post_form(URI.parse('http://api.hostip.info/get_html.php'), {'ip'=>ip_add})
	if http
	#puts ".......................... #{http.body}..." 
	location=Hash.new()
	country_str=http.body.split("\n")[0].split(":")[1].split("(")[0].strip
	city_str=http.body.split("\n")[1].split(":")[1].split(",")[0].strip
	location["country"]=country_str
	location["city"]=city_str
	#puts location
	return location
	end
}
rescue Timeout::Error
#puts "Resolving location from ip timed out................................."
location={"country"=>"timed out", "city"=>"timed out"}
return location
end		
end
def logged_in?
unless session[:user]
flash[:error_layout]="You should be logged in to perform the requested action"
else
return true
end
end
end
