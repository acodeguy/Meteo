// swiftlint:disable type_name
import Foundation

class JSONParser: JSONParserProtocol {
    var decoder: JSONDecoderProtocol
    typealias T = Decodable
    
    func parse<T: Decodable>(type: T.Type, from data: Data) -> Result<T, Error> {
        do {
            let decodedJSON: T = try decoder.decode(T.self, from: data)
            return .success(decodedJSON)
        } catch let error {
            return .failure(error)
        }
    }
    
    required init(decoder: JSONDecoderProtocol) {
        self.decoder = decoder
    }
}
