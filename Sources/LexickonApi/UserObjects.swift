
import Foundation

public struct LxUserList: Codable {
    public var email: String
    
    public init(email: String) {
        self.email = email
    }
}

public struct LxUserGet: Codable {
    public var email: String
    
    public init(email: String) {
        self.email = email
    }
}

public struct LxUserCreate: Codable {
    public var email: String
    public var password: String
    
    public init(
        email: String,
        password: String
    ) {
        self.email = email
        self.password = password
    }
}

public struct LxUserUpdate: Codable {
    public var email: String
    
    public init(email: String) {
        self.email = email
    }
}

public struct LxUserPatch: Codable {
    public var email: String
    
    public init(email: String) {
        self.email = email
    }
}
