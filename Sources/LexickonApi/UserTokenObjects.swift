
import Foundation

public struct UserTokenGetObject: Codable {
    
    public var value: String
    public var id: String
    
    public init(
        value: String,
        id: String
    ) {
        self.value = value
        self.id = id
    }
    
//    public enum CodingKeys: String, CodingKey {
//        case value
//        case userId
//    }
//
//    public init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        value = try container.decode(String.self, forKey: .value)
//        userId = try container.decode(String.self, forKey: .userId)
//    }
}
