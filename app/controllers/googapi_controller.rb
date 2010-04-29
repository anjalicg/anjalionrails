class GoogapiController < ApplicationController
def index
end
def qrcode
require 'timeout'
require 'net/http'
case request.method
when :post
qr='qr'
chs=params[:qr][:size]
chl=params[:qr][:textc]
puts "#{chl}..................."
begin
Timeout::timeout(5) {
	http=Net::HTTP.post_form(URI.parse('http://chart.apis.google.com/chart'), {'cht'=>qr, 'chs'=>chs, 'chl'=>chl})
	if http 
	chl=chl.gsub(/http:\/\//,"")
	f=File.new("public/qrcode/qrcode_#{chl}_#{chs}.png",'w')
	@inp_str_qrcode=chl
	@qr_file="qrcode_#{chl}_#{chs}.png"
	f << http.body
	f.close
	end
}
end #begin end
end #Case end
end #function end
end
