
import Foundation

public enum LxStudyStateTimePeriodPercentages {
    static let waiting: CGFloat = 0.7
    static let ready: CGFloat = 0.2
    static let fire: CGFloat = 0.1
}

public enum StudyState: String, Codable {
    
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
    public let updatingStudyRatingDate: Int?
    public let studyRating: Int
    public let image: String
    
    public init(
        id: UUID,
        studyWord: String,
        translates: [String],
        updatingStudyRatingDate: Int?,
        studyRating: Int,
        image: String
    ) {
        self.id = id
        self.studyWord = studyWord
        self.translates = translates
        self.updatingStudyRatingDate = updatingStudyRatingDate
        self.studyRating = studyRating
        self.image = image
    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case studyWord
        case translates
        case updatingStudyRatingDate
        case studyRating
        case image
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(UUID.self, forKey: .id)
        studyWord = try container.decode(String.self, forKey: .studyWord)
        translates = try container.decode([String].self, forKey: .translates)
        updatingStudyRatingDate = try container.decode(Int.self, forKey: .updatingStudyRatingDate)
        studyRating = try container.decode(Int.self, forKey: .studyRating)
        image = try container.decode(String.self, forKey: .image)
    }
}

// MARK: LxWordGet

public struct LxWordGet: Codable {
    
    public let id: UUID
    public let studyWord: String
    public let translates: [String]
    public let updatingStudyRatingDate: Int?
    public let studyRating: Int
    public let image: String
    
    public init(
        id: UUID,
        studyWord: String,
        translates: [String],
        updatingStudyRatingDate: Int?,
        studyRating: Int,
        image: String
    ) {
        self.id = id
        self.studyWord = studyWord
        self.translates = translates
        self.updatingStudyRatingDate = updatingStudyRatingDate
        self.studyRating = studyRating
        self.image = image
    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case studyWord
        case translates
        case updatingStudyRatingDate
        case studyRating
        case image
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(UUID.self, forKey: .id)
        studyWord = try container.decode(String.self, forKey: .studyWord)
        translates = try container.decode([String].self, forKey: .translates)
        updatingStudyRatingDate = try container.decode(Int.self, forKey: .updatingStudyRatingDate)
        studyRating = try container.decode(Int.self, forKey: .studyRating)
        image = try container.decode(String.self, forKey: .image)
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
    
    public let updatingStudyRatingDate: Int?
    
    public init(updatingStudyRatingDate: Int) {
        self.updatingStudyRatingDate = updatingStudyRatingDate
    }
    
    private enum CodingKeys: String, CodingKey {
        case updatingStudyRatingDate
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        updatingStudyRatingDate = try container.decode(Int.self, forKey: .updatingStudyRatingDate)
    }
}

// MARK: LxWordPanch

public struct LxWordPatch: Codable {
    
    public let updatingStudyRatingDate: Int?
    
    public init(updatingStudyRatingDate: Int) {
        self.updatingStudyRatingDate = updatingStudyRatingDate
    }
    
    private enum CodingKeys: String, CodingKey {
        case updatingStudyRatingDate
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        updatingStudyRatingDate = try container.decode(Int.self, forKey: .updatingStudyRatingDate)
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
