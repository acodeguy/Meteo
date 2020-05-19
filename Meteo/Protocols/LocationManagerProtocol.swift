import CoreLocation

protocol LocationManagerProtocol {
    var locationManagerDelegate: LocationManagerDelegate? { get set }
    var desiredAccuracy: CLLocationAccuracy { get set }
    func startUpdatingLocation()
    func requestWhenInUseAuthorization()
}
