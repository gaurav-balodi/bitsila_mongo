class Pages::SwiggyPage < Pages::SourcePage
  def address
  	
  end

  def city
  	
  end

  def state
  	
  end

  def zip
  	
  end

  def location
    {
      id: restaurant&.locations&.first&.id,
      address: address,
      city: city,
      state: state,
      zip: zip
    }
  end

  def phone_number
    ''
  end

  def orders
    []
  end

  def order_items
    []
  end

  def categories
    []
  end

  def products
    []
  end

  def restaurant_name
    ''
  end

  def source
    'swiggy'
  end

  private
end
