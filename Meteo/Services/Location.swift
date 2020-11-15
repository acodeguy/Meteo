import Foundation

// MARK: - LocationProtocol

protocol LocationProtocol {
    var latitude: Double { get }
    var longitude: Double { get }
}

// MARK: - Location

class Location: LocationProtocol {
    var latitude: Double
    var longitude: Double
    
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}
