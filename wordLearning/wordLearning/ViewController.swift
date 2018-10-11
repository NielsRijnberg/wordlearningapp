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
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

