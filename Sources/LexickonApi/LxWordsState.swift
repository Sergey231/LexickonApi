//
//  File.swift
//  
//
//  Created by Sergey Borovikov on 25.05.2021.
//

import Foundation

public struct LxWordsState: Codable {
    
    public let fireWordsCount: UInt
    public let readyWordsCount: UInt
    public let newWordsCount: UInt
    public let waitingWordsCount: UInt
    
    public init(
        fireWordsCount: UInt,
        readyWordsCount: UInt,
        newWordsCount: UInt,
        waitingWordsCount: UInt
    ) {
        self.fireWordsCount = fireWordsCount
        self.readyWordsCount = readyWordsCount
        self.newWordsCount = newWordsCount
        self.waitingWordsCount = waitingWordsCount
    }
}
