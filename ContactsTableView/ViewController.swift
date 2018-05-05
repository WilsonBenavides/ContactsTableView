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
    
    let names = ["Amy", "Bill", "Zack", "Steve", "Jack", "Amy", "Bill"]
    
    let cNames = ["Carl", "Homer", "Marge", "Bart", "Lisa"]
    
    let dNames = ["David", "Dan"]
    
    let twoDimensionalArray = [
        ["Amy", "Bill", "Zack", "Steve", "Jack", "Amy", "Bill"],
        ["Carl", "Homer", "Marge", "Bart", "Lisa"],
        ["David", "Dan"],
        ["Patrick", "Patty"]
    ]
    
    @objc func handleShowIndexPath() {
        print("attemiping reload animaiton of indexPaths...")
        
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.reloadRows(at: [indexPath], with: .left)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Show IndexPath", style: .plain, target: self, action: #selector(handleShowIndexPath))
        
        navigationItem.title = "Contacts"
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        } else {   }
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "Header"
        label.backgroundColor = UIColor.lightGray
        return label
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return twoDimensionalArray.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return twoDimensionalArray[section].count
//        if section == 0 {
//            return names.count
//        }
//        return cNames.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        //let name = self.names[indexPath.row]
        //let name = indexPath.section == 0 ? names[indexPath.row] : cNames[indexPath.row]
        
        let name = twoDimensionalArray[indexPath.section][indexPath.row]
        cell.textLabel?.text = name
        cell.textLabel?.text = "\(name) Section:\(indexPath.section) Row.\(indexPath.row)"
        return cell
    }
}

