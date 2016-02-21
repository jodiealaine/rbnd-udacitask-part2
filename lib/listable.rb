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
  def format_priority priority
    value = " ⇧".colorize(:red) if priority == "high"
    value = " ⇨".colorize(:yellow) if priority == "medium"
    value = " ⇩".colorize(:white) if priority == "low"
    value = "" if !priority
    return value
  end
  def format_name site_name
    site_name ? site_name : ""
  end
  def format_type 
    "#{self.class.to_s.gsub('Item','')}: "
  end
end

