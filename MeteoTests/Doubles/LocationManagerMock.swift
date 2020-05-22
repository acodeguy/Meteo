import CoreLocation
@testable import Meteo

class LocationManagerMock: LocationManagerProtocol {
    var locationManagerDelegate: LocationManagerDelegate?
    var desiredAccuracy: CLLocationAccuracy = 0
    var location: (() -> CLLocation)?
    
    func startUpdatingLocation() {
        guard let location = location?() else { return }
        
        locationManagerDelegate?.locationManager(self, didUpdateLocations: [location])
    }
    
    func requestWhenInUseAuthorization() {
        
    }
}
