class EventItem
  include Listable
  attr_reader :description, :start_date, :end_date

  def initialize(description, options={})
    @description = description
    @start_date = Chronic.parse(options[:start_date]) if options[:start_date]
    @end_date = Chronic.parse(options[:end_date]) if options[:end_date]
  end
  def list_details position
    {position: position, type: format_type, description: format_description(@description), date: format_date(start_date: @start_date, end_date: @end_date)}
  end
  def expired?
    @end_date < Time.now if @end_date 
  end
end
