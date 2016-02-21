module Listable
  # Listable methods go here
  def format_description description
    "#{description}".ljust(25)
  end
  def format_date options={}
  	start_date = options[:start_date]
  	end_date = options[:end_date]
    if start_date 
    	dates = "[green]Start: #{start_date.strftime("%D")}[/]" if start_date
    	dates << " -- [red]End: #{end_date.strftime("%D")}[/]" if end_date
    	dates = "N/A" if !dates
    	return dates
    else	
    	end_date ? (self.expired? ? "[red]Due: #{end_date.strftime("%D")}[/]" : "Due: #{end_date.strftime("%D")}") : "No due date"
    end
  end
  def format_priority priority
    value = "[red]⇧ [/]" if priority == "high"
    value = "[white]⇨ [/]" if priority == "medium"
    value = "[yellow]⇩ [/]" if priority == "low"
    value = "" if !priority
    return value
  end
  def format_name site_name
    site_name ? site_name : ""
  end
  def format_type 
    value = "[magenta]#{type}[/]" if type == "Todo"
    value = "[green]#{type}[/]" if type == "Event"
    value = "[blue]#{type}[/]" if type == "Link"
    value
  end
  def format_display filter
    format = [:position, :type, :description, :date, :priority] if filter == "todo"
    format = [:position, :type, :description, :date] if filter == "event"
    format = [:position, :type, :description, :site_name] if filter == "link"
    format
  end
  def type
    "#{self.class.to_s.gsub('Item','')}"
  end
end

