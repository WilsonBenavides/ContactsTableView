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
        
        //build all the indexPaths we want to reload
        var indexPathsToReload = [IndexPath]()
        
        for section in twoDimensionalArray.indices {
            
            
            for row in twoDimensionalArray[section].indices {
                print(section, row)
            }
        }
        
//        for index in twoDimensionalArray[0].indices {
//            let indexPath = IndexPath(row: index, section: 0)
//            indexPathsToReload.append(indexPath)
//        }
        
        tableView.reloadRows(at: indexPathsToReload, with: .right)
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

