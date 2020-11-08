
import Foundation

public struct LxPage<T: Decodable>: Decodable {
    public struct Metadata: Decodable {
        let page: Int
        let per: Int
        let total: Int
        
        public init(
            page: Int,
            per: Int,
            total: Int
        ) {
            self.page = page
            self.per = per
            self.total = total
        }
        
        private enum CodingKeys: String, CodingKey {
            case page
            case per
            case total
        }
        
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.page = try container.decode(Int.self, forKey: .page)
            self.per = try container.decode(Int.self, forKey: .per)
            self.total = try container.decode(Int.self, forKey: .total)
        }
    }
    let metadata: Metadata
    let items: [T]
    
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
        do {
            self.items = try container.decode([T].self, forKey: .items)
            self.metadata = try container.decode(Metadata.self, forKey: .metadata)
        } catch {
            print(error)
            throw LxHTTPObject.Error.unknown
        }
    }
}
