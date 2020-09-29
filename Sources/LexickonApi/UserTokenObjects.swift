
import Foundation

public struct UserTokenGetObject: Codable {
    
    public var value: String
    public var userId: String
    
    public init(
        value: String,
        userId: String
    ) {
        self.value = value
        self.userId = userId
    }
    
    public enum CodingKeys: String, CodingKey {
        case value
        case userId
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        value = try container.decode(String.self, forKey: .value)
        userId = try container.decode(String.self, forKey: .userId)
    }
}
