// swiftlint:disable force_cast
import Foundation
@testable import Meteo

class JSONDecoderDummy: JSONDecoderProtocol {
    func decode<T>(_ type: T.Type, from data: Data) throws -> T where T: Decodable {
        
        return "" as! T
    }
}
