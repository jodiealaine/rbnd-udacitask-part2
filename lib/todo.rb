class TodoItem
  include Listable
  attr_reader :description, :due, :priority

  def initialize(description, options={})
    @description = description
    @due = options[:due] ? Date.parse(options[:due]) : options[:due]
    add_priority options[:priority] if options.include? :priority
  end
  def details
    format_description(@description) + "due: " +
    format_date(end_date: @due) +
    format_priority(@priority)
  end
  def add_priority priority
    (valid_priority_value? priority) ? @priority = priority : (raise UdaciListErrors::InvalidPriorityValue, "#{priority} is not a valid priority value.")
  end

  private
  def valid_priority_value? priority
    valid_priority_values.include? priority
  end
  def valid_priority_values
    ["high","medium","low"]
  end

end
