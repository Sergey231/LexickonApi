
import Foundation

public struct UserListObject: Codable {
    var email: String
}

public struct UserGetObject: Codable {
    var email: String
}

public struct UserCreateObject: Codable {
    var email: String
    var password: String
}

public struct UserUpdateObject: Codable {
    var email: String
}
