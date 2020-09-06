
import Foundation

public struct UserListObject: Codable {
    public var email: String
    
    public init(email: String) {
        self.email = email
    }
}

public struct UserGetObject: Codable {
    public var email: String
    
    public init(email: String) {
        self.email = email
    }
}

public struct UserCreateObject: Codable {
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

public struct UserUpdateObject: Codable {
    public var email: String
    
    public init(email: String) {
        self.email = email
    }
}

public struct UserPatchObject: Codable {
    public var email: String
    
    public init(email: String) {
        self.email = email
    }
}
