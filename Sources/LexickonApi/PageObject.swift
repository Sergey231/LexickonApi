
import Foundation

struct PageObject<T: Decodable>: Decodable {
    struct Metadata: Decodable {
        let page: Int
        let per: Int
        let total: Int
    }
    let metadata: Metadata
    let items: [T]
}
