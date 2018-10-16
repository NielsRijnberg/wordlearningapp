//
//  ViewController.swift
//  wordLearning
//
//  Created by Niels Rijnberg on 04/10/2018.
//  Copyright © 2018 Niels Rijnberg. All rights reserved.
//

import UIKit
import Firestore

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var db:Firestore!
    var wordListLibrary: WordListLibrary = WordListLibrary(wordLists: [])
    var wordLists = [WordList]()
    
    //var wordsToLearnArray = [wordToLearn]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        db = Firestore.firestore()
        wordLists = wordListLibrary.getWordLists()
        //loadData()
        //checkForUpdates()
    }
    
    func loadData() {
        
//        db.collection("words").getDocuments {
//            querySnapshot, error in
//            if let error = error {
//                print("\(error.localizedDescription)")
//            } else {
//                self.wordsToLearnArray = querySnapshot!.documents.compactMap({wordToLearn(dictionary: $0.data())})
//                DispatchQueue.main.async {
//                    self.tableView.reloadData()
//                }
//            }
//        }
    }
    
//    func checkForUpdates() {
//        db.collection("words").addSnapshotListener {
//            querySnapshot, error in
//
//            guard let snapshot = querySnapshot else {return}
//            snapshot.documentChanges.forEach {
//                diff in
//
//                if diff.type == .added{
//                    self.wordsToLearnArray.append(wordToLearn(dictionary: diff.document.data())!)
//                    DispatchQueue.main.async {
//                        self.tableView.reloadData()
//                    }
//                }
//            }
//        }
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let wordList = wordLists[indexPath.row]
        //let wordToLearn = wordsToLearnArray[indexPath.row]
        cell.textLabel?.text = "\(wordList.name)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected cell \(indexPath.row)!")
    }
}

