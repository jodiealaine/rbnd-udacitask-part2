module Listable
  # Listable methods go here
  def format_description description
    "#{description}".ljust(25)
  end
  def format_date options={}
  	start_date = options[:start_date]
  	end_date = options[:end_date]
    if start_date 
    	dates = start_date.strftime("%D") if start_date
    	dates << " -- " + end_date.strftime("%D") if end_date
    	dates = "N/A" if !dates
    	return dates
    else	
    	end_date ? end_date.strftime("%D") : "No due date"
    end
  end
end

