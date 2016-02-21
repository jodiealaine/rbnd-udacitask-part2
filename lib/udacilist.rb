class UdaciList
  include Listable
  attr_reader :title, :items

  def initialize(options={})
    @title = options[:title] ? @title = options[:title] : @title = "Untitled List"
    @items = []
  end
  def add(type, description, options={})
    type = type.downcase
    if validItemType? type
      @items.push TodoItem.new(description, options) if type == "todo"
      @items.push EventItem.new(description, options) if type == "event"
      @items.push LinkItem.new(description, options) if type == "link"
    else
      raise UdaciListErrors::InvalidItemType, "#{type} is not a valid list item."
    end
  end
  def delete(index)
    (index - 1) <= @items.length ?  @items.delete_at(index - 1) : (raise UdaciListErrors::IndexExceedsListSize, "#{index} exceeds the size of the list.")
  end
  def all
    list_data = [] 
    list_name = Formatador.display_line "\n[indent][bold][underline]#{@title.upcase}\n[/][/][/]"
    @items.each do |item|
      list_data.push item.list_details(@items.index(item)+1)
    end
    Formatador.display_table list_data, [:position, :type, :description, :date, :priority, :site_name]
  end

  def filter item_type
    filtered_list_data = [] 
    filtered_list_name = "\n[indent][bold][underline]#{@title.upcase} - Filtered By: #{item_type.capitalize}\n[/][/][/]"
    @items.each do |item|
      filtered_list_data.push item.list_details(@items.index(item)+1) if item.class.to_s.downcase.include? item_type
    end
    Formatador.display_line filtered_list_name
    Formatador.display_table filtered_list_data, format_display(item_type.downcase)
  end

  private
  def validItemType? type
    validItemTypes.include? type
  end
  def validItemTypes
    ["todo", "event", "link"]
  end
  def display_formats type

  end
end
