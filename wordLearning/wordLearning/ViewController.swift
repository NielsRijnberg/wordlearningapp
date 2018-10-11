//
//  ViewController.swift
//  wordLearning
//
//  Created by Niels Rijnberg on 04/10/2018.
//  Copyright © 2018 Niels Rijnberg. All rights reserved.
//

import UIKit
import Firestore

class TableViewController: UITableViewController {

    var db:Firestore!
    var wordsToLearnArray = [wordToLearn]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        db = Firestore.firestore()
        loadData()
        checkForUpdates()
    }
    
    func loadData() {
        db.collection("words").getDocuments {
            querySnapshot, error in
            if let error = error {
                print("\(error.localizedDescription)")
            } else {
                self.wordsToLearnArray = querySnapshot!.documents.compactMap({wordToLearn(dictionary: $0.data())})
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func checkForUpdates() {
        db.collection("words").addSnapshotListener {
            querySnapshot, error in
            
            guard let snapshot = querySnapshot else {return}
            snapshot.documentChanges.forEach {
                diff in
                
                if diff.type == .added{
                    self.wordsToLearnArray.append(wordToLearn(dictionary: diff.document.data())!)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordsToLearnArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let wordToLearn = wordsToLearnArray[indexPath.row]
        cell.textLabel?.text = "\(wordToLearn.dutchWord) --> \(wordToLearn.englishWord)"
        
        return cell
    }
}

