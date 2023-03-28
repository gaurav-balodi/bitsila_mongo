# require 'rexml/document'
# include ::REXML::Document
# Nokogiri options
# https://readysteadycode.com/howto-extract-data-from-html-with-ruby
# https://gist.github.com/carolineartz/10276637

class Pages::SourcePage
  attr_accessor :page, :url

  def initialize(page:, url:)
  	@page = Nokogiri::HTML(page)
  	@url = url
  end

  def id
    return @id if defined?(@id)

    @id = restaurant&.id
  end
  alias_method :restaurant_id, :id

  def attributes
    return @attributes if defined?(@attributes)

    @attributes = {
      name: restaurant_name,
      phone_number: phone_number,
      source: source,
      url: url,
      location: location,
      orders: orders,
      order_items: order_items,
      categories: categories,
      products: products
    }
    @attributes = @attributes.merge(id: id) if id.present?
    @attributes
  end

  def restaurant
    return @restaurant if defined?(@restaurant)

    @restaurant = Restaurant.find_by(url: @url)
  end

  protected

  def log(msg)
  	Rails.logger.info(msg)
  end

  def content(selector)
  	node(selector).text
  end

  def node(selector)
  	@page.at(selector)
  end

  def content_array(selector)
  	@page.search(selector)
  end

  def node_content(element, selector)
    element_node(element, selector).text
  end

  def element_node(element, selector)
  	element.at(selector)
  end

  def element_nodes(element, selector)
  	element.search(selector)
  end

  def clean_whitespace(text)
  	text.squish
  end

  def encode_and_strip(value)
    value.to_s.encode("ASCII", "UTF-8", invalid: :replace, undef: :replace, replace: "").strip
  end
end
