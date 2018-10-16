//
//  wordPair.swift
//  wordLearning
//
//  Created by Niels Rijnberg on 12/10/2018.
//  Copyright © 2018 Niels Rijnberg. All rights reserved.
//

import Foundation

class WordPair {
    var originalWord: String
    var translatedWord: String
    
    init(originalWord: String, translatedWord: String){
        self.originalWord = originalWord
        self.translatedWord = translatedWord
    }
}
