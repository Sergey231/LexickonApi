
import Foundation

public struct WordListObject: Codable {
    var id: String
    var studyWord: String
    var translates: [String]
    var nextLessonDate: Date
    var image: String
}

public struct WordGetObject: Codable {
    var id: String
    var studyWord: String
    var translates: [String]
    var nextLessonDate: Date
    var image: String
}

public struct WordCreateObject: Codable {
    var studyWord: String
    var translates: [String]
    var imageKey: String?
    var image: String
}

public struct WordUpdateObject: Codable {
    var nextLessonDate: String
}
