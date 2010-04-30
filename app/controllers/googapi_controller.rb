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
@url2visit = "http://chart.apis.google.com/chart?cht=qr&chs=#{chs}&chl=#{chl}"
@inp_str_qrcode=chl
end #Case end
end #function end
end
