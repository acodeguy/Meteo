import Foundation
@testable import Meteo

class LocationManagerDummy: LocationManagerProtocol {
    weak var locationManagerDelegate: LocationManagerDelegate?
    var desiredAccuracy: Double = 0.0
    
    func startUpdatingLocation() {}
    func requestWhenInUseAuthorization() {}
    func stopUpdatingLocation() {}
}
