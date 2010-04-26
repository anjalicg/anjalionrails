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
