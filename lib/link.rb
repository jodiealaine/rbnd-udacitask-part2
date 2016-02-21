class LinkItem
  include Listable
  attr_reader :description, :site_name

  def initialize(url, options={})
    @description = url
    @site_name = options[:site_name]
  end
  def list_details position
    {position: position, type: format_type, description: format_description(@description), site_name: format_name(@site_name)}
  end
end
