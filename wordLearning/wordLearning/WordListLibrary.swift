//
//  wordListLibrary.swift
//  wordLearning
//
//  Created by Niels Rijnberg on 12/10/2018.
//  Copyright © 2018 Niels Rijnberg. All rights reserved.
//

import Foundation

class WordListLibrary {
    var wordLists = [WordList]()
    
    init(wordLists: [WordList]) {
        self.wordLists = wordLists
        
        //init the wordpairs of a wordlist
        var wordpairs = [WordPair]()
        wordpairs.append(WordPair(originalWord: "mok", translatedWord: "mug"))
        wordpairs.append(WordPair(originalWord: "stoel", translatedWord: "chair"))
        
        //init the word lists
        addWordList(wordList: WordList(name: "English Chapter 1", wordPairs: wordpairs))
        addWordList(wordList: WordList(name: "English Chapter 2", wordPairs: wordpairs))
    }
    
    public func addWordList(wordList: WordList) {
        wordLists.append(wordList)
    }
    
    public func getWordLists() -> [WordList] {
        return wordLists
    }
}
