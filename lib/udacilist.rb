class UdaciList
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
    puts "-" * @title.length
    puts @title
    puts "-" * @title.length
    @items.each_with_index do |item, position|
      puts "#{position + 1}) #{item.details}"
    end
  end
  private
  def validItemType? type
    validItemTypes.include? type
  end
  def validItemTypes
    ["todo", "event", "link"]
  end
end
