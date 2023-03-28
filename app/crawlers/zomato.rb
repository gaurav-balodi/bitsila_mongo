class Zomato < Crawler
  SOURCE_URL = 'https://www.zomato.com/%{path}'

  def call
    restaurant_urls.each do |item|
      restaurant_url = format(SOURCE_URL, item)
      restaurant_page = fetch_page(restaurant_url)
      save_record(Pages::ZomatoPage.new(page: restaurant_page, url: restaurant_url))
    end
  end

  def fetch(url: 'https://magicpin.in/Hyderabad/Miyapur/Restaurant/Chef-Bakers/store/55b016/delivery/')
    puts "*********** Fetching started ***********"
    if url.present?
      # restaurant_url = format(SOURCE_URL, path: url)
      # restaurant_page = fetch_page(restaurant_url)
      restaurant_url = url
      restaurant_page = fetch_page_using_mechanize(url)

      puts restaurant_page
      save_record(Pages::ZomatoPage.new(page: restaurant_page, url: restaurant_url))
    end
    puts "*********** Fetching completed ***********"
  end

  private

  # TODO: Fetch only the unique URLs from DB
  def restaurant_urls
    [
      { path: 'bangalore/chef-bakers-5-marathahalli-bangalore/order' }
    ]
  end
end