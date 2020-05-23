import Foundation

enum Endpoint: String {
    case icon = "/static/img/weather"
    case locations = "/location/search/?lattlong="
    case woeid = "/location"
}

class URLBuilder: URLBuilderProtocol {
    var baseURLString: String
    
    required init(baseURL: String) {
        self.baseURLString = baseURL
    }
    
    func build(for endpoint: Endpoint, with query: String) -> URL? {
        switch endpoint {
        case.icon:
            return URL(string: "\(baseURLString)\(endpoint.rawValue)/\(query).svg")
        case .locations:
            return URL(string: "\(baseURLString)\(endpoint.rawValue)\(query)")
        case .woeid:
            return URL(string: "\(baseURLString)\(endpoint.rawValue)/\(query)")
        }
    }
}
