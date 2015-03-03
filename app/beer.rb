class Beer
  
  attr_reader :name, :location
  
  def initialize(latitude, longitude, name)
    @title = name
    @coordinate = CLLocationCoordinate2D.new
    @coordinate.latitude = latitude
    @coordinate.longitude = longitude
  end

  def title
    @title
  end

  def coordinate
    @coordinate
  end

  # Brew fixture data
  All = [
    Beer.new(45.571534, -122.656782, "Breakside Brewery"),
    Beer.new(45.558855, -122.642749, "The Mash Tun"),
    Beer.new(45.526153, -122.636398, "Migration Brewing"),
    Beer.new(45.528934, -122.643994, "Culmination Brewing"),
    Beer.new(45.530994, -122.685235, "Bridgeport Brewpub")
  ]
end