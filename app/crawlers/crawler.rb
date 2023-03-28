require 'open-uri'
require 'json'
require 'nokogiri'
require 'mechanize'

class Crawler
  def initialize
  end

  def save_record(record)
    puts "save_record got called with record: #{record.inspect}"
    if record.id.present?
      #Rails.logger.info "************** updating record with id: #{record.id} **************"
      #record.restaurant.update(record.attributes)
      #response = record.restaurant
      response = OpenStruct.new(errors: [])
    else
      Rails.logger.info "************** creating record **************"
      #response = Restaurant.create(record.attributes)
      response = OpenStruct.new(errors: [])
    end
    #Rails.logger.info(response.errors.inspect) #if response.errors.present?
    puts "save_record end"
  end
  
  protected
  def fetch_page(url)
    iteration = 0
    parsed_url = URI(url)
    Rails.logger.info("Fetching #{parsed_url.to_s}")
    while iteration < 4
      begin
        page = URI.open(parsed_url).read
        iteration = 4
      rescue Exception => e
        puts("Error with #{parsed_url.to_s} => #{e}")
        puts "Lets Retry #{url}"
        sleep iteration if iteration == 0
        iteration += 1
      end
    end
    page
  end

  def fetch_page_using_mechanize(url)
    iteration = 0
    parsed_url = URI(url)
    Rails.logger.info("Fetching #{parsed_url.to_s}")
    while iteration < 4
      begin
        response = mechanize_request.get(parsed_url)
        page = response.body.force_encoding('UTF-8')
        iteration = 4
      rescue Exception => e
        puts("Error with #{parsed_url.to_s} => #{e}")
        puts "Lets Retry #{url}"
        sleep iteration if iteration == 0
        iteration += 1
      end
    end
    page
  end

  def mechanize_request
    @mechanize_request ||= Mechanize.new
  end
end
