import Foundation
@testable import Meteo

class URLSessionMock: URLSessionProtocol {
    var lastURLRequested: URL?
    
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        let data = Constants.API.jsonResponseExample.data(using: .utf8)
        defer { completionHandler(data, nil, nil) }
        lastURLRequested = url
        
        return URLSessionDataTaskMock()
    }
}
