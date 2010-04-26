class MathfuncsController < ApplicationController
def index
#link to all the functions in the index page
@types = ["Decimal", "Hexadecimal", "Binary", "Octal"]
end
def fromdec 
@types = ["Decimal", "Hexadecimal", "Binary", "Octal"]
case request.method
	when :post
	case params[:inp][:type]
	when "Decimal"
		unless too_long? params[:input][:decimal]
		@answer_2bin = params[:input][:decimal].to_i.to_s(2)
		@answer_2oct = params[:input][:decimal].to_i.to_s(8)
		@answer_2hex = params[:input][:decimal].to_i.to_s(16)
		@answer_2dec = params[:input][:decimal]
		else
		flash[:error_layout] = "ERROR: input should be less than 20 digits"
		end
	when "Hexadecimal"
		unless too_long? params[:input][:decimal]
		@answer_2bin = params[:input][:decimal].to_s.to_i(16).to_s(2)
		@answer_2oct = params[:input][:decimal].to_s.to_i(16).to_s(8)
		@answer_2hex = params[:input][:decimal]
		@answer_2dec = params[:input][:decimal].to_s.to_i(16)
		else
		flash[:error_layout] = "ERROR: input should be less than 20 digits"
		end
	when "Binary"
		unless too_long? params[:input][:decimal]
		@answer_2bin = params[:input][:decimal]
		@answer_2dec = params[:input][:decimal].to_s.to_i(2)
		@answer_2hex = params[:input][:decimal].to_s.to_i(2).to_s(16)
		@answer_2oct=params[:input][:decimal].to_s.to_i(2).to_s(8)
		else
		flash[:error_layout] = "ERROR: input should be less than 20 digits"
		end
	when "Octal"
		unless too_long? params[:input][:decimal]
		@answer_2bin = params[:input][:decimal].to_s.to_i(8).to_s(2)
		@answer_2dec = params[:input][:decimal].to_s.to_i(8)
		@answer_2hex = params[:input][:decimal].to_s.to_i(8).to_s(16)
		@answer_2oct=params[:input][:decimal]
		else
		flash[:error_layout] = "ERROR: input should be less than 20 digits"
		end
end
		render :controller=>'mathfuncs', :action=>'index'
end

end

def dec2bin
case request.method
	when :post
		unless too_long? params[:input][:decimal]
		@answer_dec2bin = params[:input][:decimal].to_i.to_s(2) 
		else
		@answer_dec2bin = "ERROR: input should be less than 20 digits"
		flash[:error_layout] = "ERROR: input should be less than 20 digits"
		end
		render :controller=>'mathfuncs', :action=>'index'
end
end

def dec2oct
case request.method
	when :post
		unless too_long? params[:input][:decimal]
		@answer_dec2oct = params[:input][:decimal].to_i.to_s(8)
		else
		@answer_dec2oct = "ERROR: input should be less than 20 digits"
		flash[:error_layout] = "ERROR: input should be less than 20 digits"
		end
		render :controller=>'mathfuncs', :action=>'index'
end
end
def dec2hex
case request.method
	when :post
		unless too_long? params[:input][:decimal]
		@answer_dec2hex = params[:input][:decimal].to_i.to_s(16)
		else
		@answer_dec2hex = "ERROR: input should be less than 20 digits"
		flash[:error_layout] = "ERROR: input should be less than 20 digits"
		end
		render :controller=>'mathfuncs', :action=>'index'
end
end
def bin2dec
case request.method
	when :post
		unless too_long? params[:input][:binary]
		@answer_bin2dec = params[:input][:binary].to_s.to_i(2)
		else
		@answer_bin2dec = "ERROR: input should be less than 20 digits"
		flash[:error_layout] = "ERROR: input should be less than 20 digits"
		end
		render :controller=>'mathfuncs', :action=>'index'
end
end
def bin2hex
case request.method
	when :post
		unless too_long? params[:input][:binary]
		@answer_bin2hex = params[:input][:binary].to_s.to_i(2).to_s(16)
		else
		@answer_bin2hex = "ERROR: input should be less than 20 digits"
		flash[:error_layout] = "ERROR: input should be less than 20 digits"
		end
		render :controller=>'mathfuncs', :action=>'index'
end
end
def bin2oct
case request.method
	when :post
		unless too_long? params[:input][:binary]
		@answer_bin2oct = params[:input][:binary].to_s.to_i(2).to_s(8)
		else
		@answer_bin2oct = "ERROR: input should be less than 20 digits"
		flash[:error_layout] = "ERROR: input should be less than 20 digits"
		end
		render :controller=>'mathfuncs', :action=>'index'
end
end
def oct2hex
case request.method
	when :post
		unless too_long? params[:input][:oct]
		@answer_oct2hex = params[:input][:oct].to_s.to_i(8).to_s(16)
		else
		@answer_oct2hex = "ERROR: input should be less than 20 digits"
		flash[:error_layout] = "ERROR: input should be less than 20 digits"
		end
		render :controller=>'mathfuncs', :action=>'index'
end
end
def oct2bin
case request.method
	when :post
		unless too_long? params[:input][:oct]
		@answer_oct2bin = params[:input][:oct].to_s.to_i(8).to_s(2)
		else
		@answer_oct2bin = "ERROR: input should be less than 20 digits"
		flash[:error_layout] = "ERROR: input should be less than 20 digits"
		end
		render :controller=>'mathfuncs', :action=>'index'
end
end
def oct2dec
case request.method
	when :post
		unless too_long? params[:input][:oct]
		@answer_oct2dec = params[:input][:oct].to_s.to_i(8)
		else
		@answer_oct2dec = "ERROR: input should be less than 20 digits"
		flash[:error_layout] = "ERROR: input should be less than 20 digits"
		end
		render :controller=>'mathfuncs', :action=>'index'
end
end
def hex2dec
case request.method
	when :post
		unless too_long? params[:input][:hexd]
		@answer_hex2dec = params[:input][:hexd].to_s.to_i(16)
		else
		@answer_hex2dec = "ERROR: input should be less than 20 digits"
		flash[:error_layout] = "ERROR: input should be less than 20 digits"
		end
		render :controller=>'mathfuncs', :action=>'index'
end
end
def hex2bin
case request.method
	when :post
		unless too_long? params[:input][:hexd]
		@answer_hex2bin = params[:input][:hexd].to_s.to_i(16).to_s(2)
		else
		@answer_hex2bin = "ERROR: input should be less than 20 digits"
		flash[:error_layout] = "ERROR: input should be less than 20 digits"
		end
		render :controller=>'mathfuncs', :action=>'index'
end
end
def hex2oct
case request.method
	when :post
		unless too_long? params[:input][:hexd]
		@answer_hex2oct = params[:input][:hexd].to_s.to_i(16).to_s(8)
		else
		@answer_hex2oct = "ERROR: input should be less than 20 digits"
		flash[:error_layout] = "ERROR: input should be less than 20 digits"
		end
		render :controller=>'mathfuncs', :action=>'index'
end
end

private
def too_long?(str)
	if str.length > 20
		puts "too big"
		return true
	else 
		puts "not big"
		return false
	end

end
end
