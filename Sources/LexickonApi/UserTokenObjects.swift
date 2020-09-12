//
//  File.swift
//  
//
//  Created by Sergey Borovikov on 12.09.2020.
//

import Foundation

public struct UserTockenGetObject: Codable {
    
    public var value: String
    public var userId: String
    
    public init(
        value: String,
        userId: String
    ) {
        self.value = value
        self.userId = userId
    }
}
