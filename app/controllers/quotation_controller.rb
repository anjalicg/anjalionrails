class QuotationController < ApplicationController
before_filter :logged_in?, :only=>'new'
def new
@quotation=Quotation.new
case request.method
when :post
@quotation=Quotation.new(params[:quotation])
if @quotation.save
flash[:info_layout] = "Thanks for your contribution"
redirect_to :controller=>'main', :action=>'admin'
end # end of if
end #end of case
end

def show
q=Quotation.find(:all)
l=rand(q.length +1)
if q[1]
@quote=q[l]
end

end

end
