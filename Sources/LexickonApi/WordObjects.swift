
import Foundation

public struct WordListObject: Codable {
    var id: String
    var studyWord: String
    var translates: [String]
    var nextLessonDate: Date
    var image: String
    
    init(
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
    var id: String
    var studyWord: String
    var translates: [String]
    var nextLessonDate: Date
    var image: String
    
    init(
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

public struct WordCreateObject: Codable {
    var studyWord: String
    var translates: [String]
    var imageKey: String?
    var image: String
    
    init(
        studyWord: String,
        translates: [String],
        nextLessonDate: Date,
        image: String
    ) {
        self.studyWord = studyWord
        self.translates = translates
        self.nextLessonDate = nextLessonDate
        self.image = image
    }
}

public struct WordUpdateObject: Codable {
    var nextLessonDate: String
    
    init(nextLessonDate: String) {
        self.nextLessonDate = nextLessonDate
    }
}
