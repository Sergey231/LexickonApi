
import Foundation

public enum LxHTTPObject {
    
    public enum Method: String {
        case get
        case post
        case put
        case patch
        case delete
    }
    
    public enum Error: LocalizedError {
        case invalidRepositoryRequest
        case invalidResponse
        case unauthorized
        case statusCode(Int)
        case unknown
    
        public init(with statusCode: Int?) {
            switch statusCode {
            case 401:
                self = .unauthorized
            default:
                self = .unknown
            }
        }
    }
}
