//
//  wordToLearn.swift
//  wordLearning
//
//  Created by Niels Rijnberg on 11/10/2018.
//  Copyright © 2018 Niels Rijnberg. All rights reserved.
//

import Foundation
import Firestore

protocol DocumentSerializable {
    init?(dictionary:[String:Any])
}

struct wordToLearn {
    var englishWord: String
    var dutchWord: String
    
    var dictionary:[String:Any] {
        return [
            "englishWord": englishWord,
            "dutchWord": dutchWord
        ]
    }
}

extension wordToLearn : DocumentSerializable {
    init?(dictionary: [String:Any]) {
        guard let englishWord = dictionary["englishWord"] as? String,
              let dutchWord = dictionary["dutchWord"] as? String
        else {return nil}
        
        self.init(englishWord: englishWord, dutchWord: dutchWord)
    }
}
