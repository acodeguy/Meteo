import CoreLocation

extension CLLocation: LocationProtocol {
    var locationCoordinate: LocationCoordinate2D {
        return self.coordinate
    }
}
