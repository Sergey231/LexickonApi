
import Foundation

public enum StudyType: String, Codable {
    case fire
    case ready
    case new
    case waiting
}

public struct LxWordList: Codable {
    
    public init(
        id: UUID,
        studyWord: String,
        translates: [String],
        nextLessonDate: Date?,
        image: String
    ) {
        self.id = id
        self.studyWord = studyWord
        self.translates = translates
        self.nextLessonDate = nextLessonDate
        self.image = image
    }
    
    public enum StudyType: String, Codable {
        case fire
        case ready
        case new
        case waiting
        
        public var canBeReseted: Bool {
            switch self {
            case .new:
                return false
            default:
                return true
            }
        }
        
        public var canBeLearnt: Bool {
            switch self {
            case .waiting:
                return false
            default:
                return true
            }
        }
    }
    
    public let id: UUID
    public let studyWord: String
    public let translates: [String]
    public let nextLessonDate: Date?
    public let image: String
    
    // MARK: Test Implementation
    public var studyType: StudyType {
        if studyWord == "Cup" || studyWord == "Car" {
            return .fire
        } else if studyWord == "Knife" || studyWord == "dog" || studyWord == "cat" {
            return .ready
        } else if studyWord == "study" || studyWord == "keyboard" {
            return .new
        }
        
        return .waiting
    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case studyWord
        case translates
        case nextLessonDate
        case image
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(UUID.self, forKey: .id)
        studyWord = try container.decode(String.self, forKey: .studyWord)
        translates = try container.decode([String].self, forKey: .translates)
        image = try container.decode(String.self, forKey: .image)
        
        let nextLessonDateString = try container.decode(String.self, forKey: .nextLessonDate)
        let dateFormatter = DateFormatter.iso8601
        nextLessonDate = dateFormatter.date(from: nextLessonDateString)
    }
}

public struct LxWordGet: Codable {
    
    public init(
        id: UUID,
        studyWord: String,
        translates: [String],
        nextLessonDate: Date,
        image: String
    ) {
        self.id = id
        self.studyWord = studyWord
        self.translates = translates
        self.nextLessonDate = nextLessonDate
        self.image = image
    }
    
    public let id: UUID
    public let studyWord: String
    public let translates: [String]
    public let nextLessonDate: Date
    public let image: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case studyWord
        case translates
        case nextLessonDate
        case image
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(UUID.self, forKey: .id)
        studyWord = try container.decode(String.self, forKey: .studyWord)
        translates = try container.decode([String].self, forKey: .translates)
        image = try container.decode(String.self, forKey: .image)
        
        let nextLessonDateString = try container.decode(String.self, forKey: .nextLessonDate)
        let dateFormatter = DateFormatter.iso8601
        if let date = dateFormatter.date(from: nextLessonDateString) {
            nextLessonDate = date
        } else {
            throw DecodingError.dataCorruptedError(
                forKey: .nextLessonDate,
                in: container,
                debugDescription: "Date string does not match format expected by formatter."
            )
        }
    }
}

public struct LxWordCreate: Codable {
    
    public init(
        studyWord: String,
        translates: [String],
        image: String
    ) {
        self.studyWord = studyWord
        self.translates = translates
        self.image = image
    }
    
    public var studyWord: String
    public var translates: [String]
    public var imageKey: String?
    public var image: String
    
    public init(
        studyWord: String,
        translates: [String],
        imageKey: String?,
        image: String
    ) {
        self.studyWord = studyWord
        self.translates = translates
        self.imageKey = imageKey
        self.image = image
    }
}

public struct LxWordUpdate: Codable {
    public let nextLessonDate: Date
    
    public init(nextLessonDate: Date) {
        self.nextLessonDate = nextLessonDate
    }
    
    private enum CodingKeys: String, CodingKey {
        case nextLessonDate
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let nextLessonDateString = try container.decode(String.self, forKey: .nextLessonDate)
        let dateFormatter = DateFormatter.iso8601
        if let date = dateFormatter.date(from: nextLessonDateString) {
            nextLessonDate = date
        } else {
            throw DecodingError.dataCorruptedError(
                forKey: .nextLessonDate,
                in: container,
                debugDescription: "Date string does not match format expected by formatter."
            )
        }
    }
}

public struct LxWordPatch: Codable {
    public let nextLessonDate: Date
    
    public init(nextLessonDate: Date) {
        self.nextLessonDate = nextLessonDate
    }
    
    private enum CodingKeys: String, CodingKey {
        case nextLessonDate
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let nextLessonDateString = try container.decode(String.self, forKey: .nextLessonDate)
        let dateFormatter = DateFormatter.iso8601
        if let date = dateFormatter.date(from: nextLessonDateString) {
            nextLessonDate = date
        } else {
            throw DecodingError.dataCorruptedError(
                forKey: .nextLessonDate,
                in: container,
                debugDescription: "Date string does not match format expected by formatter."
            )
        }
    }
}

extension DateFormatter {
  public static let iso8601: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
    formatter.calendar = Calendar(identifier: .iso8601)
    formatter.timeZone = TimeZone(secondsFromGMT: 0)
    return formatter
  }()
}
