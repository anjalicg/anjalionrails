class MiscController < ApplicationController
def index
case request.method
when :post
	case params[:subaction]
	when "unix2human"
	puts "Inside timestamp...unix2human #{params[:misc][:unixT]}"
	t=Time.new
	@zone=t.to_s.split(" ")[4]
	@unix2human = Time.at(params[:misc][:unixT].to_i).strftime("%m-%d-%Y %H:%M:%S")
	@unixT = params[:misc][:unixT]
	#flash[:notice_unix2human] = "Unix epoch time <b>#{@unixT} = #{@unix2human} GMT #{@zone} </b>"
	when "human2unix"
	puts "Inside timestamp...human2unix"
	ts=params[:misc][:currDnT2]
	begin
	date= ts.split(" ")[0].split("-")
	time = ts.split(" ")[1].split(":")
	t= Time.gm(date[2],date[0],date[1],time[0],time[1],time[2])
	@human2unix = t.to_i
	@humanT = params[:misc][:currDnT2]
	rescue
	flash[:error_human2unix] = "Please enter time in the format <b>month-date-year Hour(24 hr clock)-minute-second</b>. "
	end
	end
end #case end
end

end
