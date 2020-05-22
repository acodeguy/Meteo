import Foundation
@testable import Meteo

class LocationServiceDummy: LocationServiceProtocol {
    var locationManager: LocationManagerProtocol
    
    required init(manager: LocationManagerProtocol) {
        locationManager = manager
    }
    
    func getCurrentLocation(completion: @escaping (LocationProtocol) -> Void) {}
}
