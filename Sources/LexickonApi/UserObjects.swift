
import Foundation

public struct UserList: Codable {
    var email: String
}

public struct UserGet: Codable {
    var email: String
}

public struct UserCreate: Codable {
    var email: String
    var password: String
}

public struct UserUpdate: Codable {
    var email: String
}
