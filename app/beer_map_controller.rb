class BeerMapController < UIViewController
  
  def loadView
    self.view = MKMapView.alloc.init
    self.view.delegate = self
  end

  def viewDidLoad
    view.frame = tabBarController.view.bounds

    # Sets default starting region to Portland, OR
    region = MKCoordinateRegionMake(
      CLLocationCoordinate2D.new(45.55, -122.68), MKCoordinateSpanMake(0.15, 0.15)
    )
    self.view.setRegion(region)
    
    Beer::All.each { |beer| self.view.addAnnotation(beer) }
  end

  ViewIdentifier = 'ViewIdentifier'

  def mapView(mapView, viewForAnnotation:beer)
    view = MKPinAnnotationView.alloc.initWithAnnotation(beer, reuseIdentifier:ViewIdentifier)
    view.canShowCallout = true
    view.animatesDrop = true
    button = UIButton.buttonWithType(UIButtonTypeDetailDisclosure)
    button.addTarget(self, action: :'showDetails:', forControlEvents:UIControlEventTouchUpInside)
    view.rightCalloutAccessoryView = button
    view
  end

  def showDetails(sender)
    view.selectedAnnotations[0]
  end
end