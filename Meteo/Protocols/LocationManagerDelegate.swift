import CoreLocation

protocol LocationManagerDelegate: class {
    func locationManager(_ manager: LocationManagerProtocol, didUpdateLocations locations: [CLLocation])
    func locationManager(_ manager: LocationManagerProtocol, didFailWithError error: Error)
}
