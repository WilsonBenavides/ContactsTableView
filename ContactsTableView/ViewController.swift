//
//  ViewController.swift
//  ContactsTableView
//
//  Created by willix on 5/05/18.
//  Copyright © 2018 willix. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let cellId = "cellIdid123123"
    
    let names = [
        "Amy", "Bill", "Zack", "Steve", "Jack", "Amy", "Bill"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Contacts"
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        } else {
        }
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "Header"
        label.backgroundColor = UIColor.lightGray
        return label
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        let name = self.names[indexPath.row]
        cell.textLabel?.text = name
        
        cell.textLabel?.text = "\(name) Section:\(indexPath.section) Row.\(indexPath.row)"
        return cell
    }
}

