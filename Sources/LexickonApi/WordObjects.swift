
import Foundation

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

// MARK: LxWordList

public struct LxWordList: Codable {
    
    public let id: UUID
    public let studyWord: String
    public let translates: [String]
    public let nextLessonDate: Date?
    public let image: String
    
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

// MARK: LxWordGet

public struct LxWordGet: Codable {
    
    public let id: UUID
    public let studyWord: String
    public let translates: [String]
    public let nextLessonDate: Date
    public let image: String
    
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

// MARK: LxWordCreate

public struct LxWordCreate: Codable {
    
    public var studyWord: String
    public var translates: [String]
    public var imageKey: String?
    public var image: String
    
    public init(
        studyWord: String,
        translates: [String],
        image: String
    ) {
        self.studyWord = studyWord
        self.translates = translates
        self.image = image
    }
    
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

// MARK: LxWordsCreate

public struct LxWordsCreate: Codable {
    
    public init(
        words: [LxWordCreate]
    ) {
        self.words = words
    }
    
    public var words: [LxWordCreate]
    
    private enum CodingKeys: String, CodingKey {
        case words
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        words = try container.decode([LxWordCreate].self, forKey: .words)
    }
}

// MARK: LxWordUpdate

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

// MARK: LxWordPanch

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
