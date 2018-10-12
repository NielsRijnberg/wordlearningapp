//
//  NieuweWoordenViewController.swift
//  wordLearning
//
//  Created by issd on 12/10/2018.
//  Copyright © 2018 Niels Rijnberg. All rights reserved.
//

import UIKit

class NieuweWoordenViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    // MARK: properties
    @IBOutlet weak var NaamWoordenlijstTextField: UITextField!
    @IBOutlet weak var taalATextField: UITextField!
    @IBOutlet weak var taalBTextField: UITextField!
    @IBOutlet weak var woordenTableView: UITableView!
    var wordTextFields = [[UITextField]]() // The textfields in the tableView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        woordenTableView.register(woordInputCell.self, forCellReuseIdentifier: "woordInputCel")
        woordenTableView.delegate = self
        woordenTableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return wordTextFields.count
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "woordInputCel", for: indexPath)
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

class woordInputCell: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Sample item"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupViews() {
        addSubview(nameLabel)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":nameLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":nameLabel]))
    }
}
