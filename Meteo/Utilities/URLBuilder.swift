import Foundation

enum Endpoint: String {
    case woeid = "/location"
    case locations = "/location/search/?lattlong="
}

class URLBuilder: URLBuilderProtocol {
    var baseURLString: String
    
    required init(baseURL: String) {
        self.baseURLString = baseURL
    }
    
    func build(for endpoint: Endpoint, with query: String) -> URL? {
        switch endpoint {
        case .woeid:
            return URL(string: "\(baseURLString)\(endpoint.rawValue)/\(query)")
        case .locations:
            return URL(string: "\(baseURLString)\(endpoint.rawValue)\(query)")
        }
    }
}
