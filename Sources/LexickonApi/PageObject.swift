
import Foundation

public struct PageObject<T: Decodable>: Decodable {
    public struct Metadata: Decodable {
        let page: Int
        let per: Int
        let total: Int
    }
    let metadata: Metadata
    let items: [T]
}
