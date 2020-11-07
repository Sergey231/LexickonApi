
import Foundation

public struct WordListObject: Codable {
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

public struct WordGetObject: Codable {
    public var id: UUID
    public var studyWord: String
    public var translates: [String]
    public var nextLessonDate: String
    public var image: String
    
    public init(
        id: UUID,
        studyWord: String,
        translates: [String],
        nextLessonDate: String,
        image: String
    ) {
        self.id = id
        self.studyWord = studyWord
        self.translates = translates
        self.nextLessonDate = nextLessonDate
        self.image = image
    }
}

public struct WordCreateObject: Codable {
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

public struct WordUpdateObject: Codable {
    public var nextLessonDate: Date
    
    public init(nextLessonDate: Date) {
        self.nextLessonDate = nextLessonDate
    }
}

public struct WordPatchObject: Codable {
    public var nextLessonDate: Date
    
    public init(nextLessonDate: Date) {
        self.nextLessonDate = nextLessonDate
    }
}
