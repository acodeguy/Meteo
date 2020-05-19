import CoreLocation

class LocationService: NSObject {
    var locationManager: LocationManagerProtocol
    private var currentLocationCallback: ((CLLocation) -> Void)?
    
    init(manager: LocationManagerProtocol = CLLocationManager()) {
        self.locationManager = manager
        super.init()
    }
    
    func getCurrentLocation(completion: @escaping (CLLocation) -> Void) {
        currentLocationCallback = { location in
            completion(location)
        }
        
        self.locationManager.locationManagerDelegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
    private func locationCallBack(locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        self.currentLocationCallback?(location)
        self.currentLocationCallback = nil
    }
}

extension LocationService: LocationManagerDelegate {
    func locationManager(_ manager: LocationManagerProtocol, didUpdateLocations locations: [CLLocation]) {
        locationCallBack(locations: locations)
    }

    func locationManager(_ manager: LocationManagerProtocol, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}

extension LocationService: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationCallBack(locations: locations)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
