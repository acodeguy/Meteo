import Foundation
@testable import Meteo

class JSONParserDummy: JSONParserProtocol {
    var decoder: JSONDecoderProtocol
    
    func parse<T>(type: T.Type, from data: Data) -> Result<T, Error> where T: Decodable {
        do {
            let decodedJSON = try decoder.decode(T.self, from: data)
            return .success(decodedJSON)
        } catch let error {
            return .failure(error)
        }
    }
    
    required init(decoder: JSONDecoderProtocol) {
        self.decoder = decoder
    }
}
