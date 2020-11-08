
import Foundation

public struct LxWordList: Codable {
    public var id: UUID
    public var studyWord: String
    public var translates: [String]
    public var nextLessonDate: Date
    public var image: String
    
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
}

public struct LxWordGet: Codable {
    public var id: UUID
    public var studyWord: String
    public var translates: [String]
    public var nextLessonDate: Date
    public var image: String
    
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

public struct LxWordCreate: Codable {
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
    public var nextLessonDate: Date
    
    public init(nextLessonDate: Date) {
        self.nextLessonDate = nextLessonDate
    }
}

public struct LxWordPatch: Codable {
    public var nextLessonDate: Date
    
    public init(nextLessonDate: Date) {
        self.nextLessonDate = nextLessonDate
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
