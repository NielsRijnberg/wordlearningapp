//
//  wordList.swift
//  wordLearning
//
//  Created by Niels Rijnberg on 12/10/2018.
//  Copyright © 2018 Niels Rijnberg. All rights reserved.
//

import Foundation

class WordList {
    var name: String
    var wordPairs = [WordPair]()
    
    init(name: String, wordPairs: [WordPair]) {
        self.name = name
        self.wordPairs = wordPairs
    }
    
    func addWordPair(wordPair: WordPair) {
        wordPairs.append(wordPair)
    }
}
