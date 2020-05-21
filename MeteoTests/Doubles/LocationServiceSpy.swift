import Foundation
@testable import Meteo

class LocationServiceSpy: LocationServiceProtocol {
    var locationManager: LocationManagerProtocol
    var numberOfTimesGetCurrentLocationWasCalled: Int = 0
    
    required init(manager: LocationManagerProtocol) {
        self.locationManager = manager
    }
    
    func getCurrentLocation(completion: @escaping (LocationProtocol) -> Void) {
        numberOfTimesGetCurrentLocationWasCalled += 1
    }
}
