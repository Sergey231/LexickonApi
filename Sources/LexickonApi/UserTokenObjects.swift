
import Foundation

public struct LxUserTokenGet: Codable {
    
    public var value: String
    public var id: String
    
    public init(
        value: String,
        id: String
    ) {
        self.value = value
        self.id = id
    }
}
