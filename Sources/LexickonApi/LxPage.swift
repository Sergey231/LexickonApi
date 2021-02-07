
import Foundation

public struct LxPage<T: Decodable>: Decodable {
    public struct Metadata: Decodable {
        
        public init(
            page: Int,
            per: Int,
            total: Int
        ) {
            self.page = page
            self.per = per
            self.total = total
        }
        
        let page: Int
        let per: Int
        let total: Int
    }
    
    public let metadata: Metadata
    public let items: [T]
    
    public init(
        metadata: Metadata,
        items: [T]
    ) {
        self.metadata = metadata
        self.items = items
    }
    
    private enum CodingKeys: String, CodingKey {
        case metadata
        case items
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.items = try container.decode([T].self, forKey: .items)
        self.metadata = try container.decode(Metadata.self, forKey: .metadata)
    }
}
