# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
def xth(number)
#This is the function definition
  case number%10
    when 1
    return "st"
    when 2
    return "nd"
    when 3
    return "rd"
    else
    return "th"
  end
  
end
end
