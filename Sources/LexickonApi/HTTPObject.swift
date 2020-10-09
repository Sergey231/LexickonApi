
import Foundation

public enum HTTPObject {
    
    public enum Method: String {
        case get
        case post
        case put
        case patch
        case delete
    }
    
    public enum Error: LocalizedError {
        case invalidResponse
        case unauthorized
        case statusCode(Int)
        case unknown
    
        public func handleError(with statusCode: Int?) -> Self {
            switch statusCode {
            case 401:
                return HTTPObject.Error.unauthorized
            default:
                return HTTPObject.Error.unknown
            }
        }
    }
}
