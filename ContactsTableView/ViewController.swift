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
    
    //you should use Custom Delegation properly instea
    func someMethodIWantToCall(cell: UITableViewCell) {
        //print("Inside of ViewController now...")
        
        //we're going to figure out which name we're clicking on
        let indexPathTapped = tableView.indexPath(for: cell)
        //print(indexPathTapped)
        
        let name = twoDimensionalArray[indexPathTapped!.section].names[indexPathTapped!.row]
        print(name)
    }
    
    var twoDimensionalArray = [
//        ExpandableNames(isExpanded: false, names: ["Amy", "Bill", "Zack", "Steve", "Jack", "Amy", "Bill"]),
//        ExpandableNames(isExpanded: false, names: ["Carl", "Homer", "Marge", "Bart", "Lisa"]),
//        ExpandableNames(isExpanded: false, names: ["David", "Dan"]),
        ExpandableNames(isExpanded: false, names: [Contact(name: "Patrick", hasFavorited: false)])
    ]
    
    var showIndexPaths = false
    
    @objc func handleShowIndexPath() {
        
        print("attemiping reload animaiton of indexPaths...")
        
        //build all the indexPaths we want to reload
        var indexPathsToReload = [IndexPath]()
        
        for section in twoDimensionalArray.indices {
            
            
            for row in twoDimensionalArray[section].names.indices {
                print(section, row)
                let indexPath = IndexPath(row: row, section: section)
                indexPathsToReload.append(indexPath)
            }
        }
        
//        for index in twoDimensionalArray[0].indices {
//            let indexPath = IndexPath(row: index, section: 0)
//            indexPathsToReload.append(indexPath)
//        }
        
        showIndexPaths = !showIndexPaths
        
        let animationStyle = showIndexPaths ? UITableViewRowAnimation.right : .left
        
        tableView.reloadRows(at: indexPathsToReload, with: animationStyle)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Show IndexPath", style: .plain, target: self, action: #selector(handleShowIndexPath))
        
        navigationItem.title = "Contacts"
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        } else {   }
        tableView.register(ContactCell.self, forCellReuseIdentifier: cellId)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let button = UIButton(type: .system)
        button.setTitle("Close", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .yellow
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        
        button.addTarget(self, action: #selector(handleExpandClose), for: .touchUpInside)
        
        button.tag = section
        return button
    }
    
    @objc func handleExpandClose(button: UIButton) {
        print("Trying to expand and close section...")
        
        print(button.tag)
        let section = button.tag
        //we'll try to close the section first by deleting the rows
        var indexPaths = [IndexPath]()
        for row in twoDimensionalArray[section].names.indices {
            print(0, row)
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
        }
        
        let isExpanded = twoDimensionalArray[section].isExpanded
        twoDimensionalArray[section].isExpanded = !isExpanded
        
        button.setTitle(isExpanded ? "Open" : "Close", for: .normal)
        
        if isExpanded {
            tableView.insertRows(at: indexPaths, with: .fade)
        } else {
            tableView.deleteRows(at: indexPaths, with: .fade)
        }
        //twoDimensionalArray[section].removeAll()
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 36
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return twoDimensionalArray.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if twoDimensionalArray[section].isExpanded {
            return 0
        }
        return twoDimensionalArray[section].names.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ContactCell
        
        cell.link = self
        
        let contact = twoDimensionalArray[indexPath.section].names[indexPath.row]
        cell.textLabel?.text = contact.name
        
        if showIndexPaths {
            cell.textLabel?.text = "\(contact.name) Section:\(indexPath.section) Row.\(indexPath.row)"
        }
        
        return cell
    }
}

