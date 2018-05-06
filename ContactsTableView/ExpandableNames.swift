//
//  ExpandableNames.swift
//  ContactsTableView
//
//  Created by willix on 5/05/18.
//  Copyright © 2018 willix. All rights reserved.
//

import Foundation

struct ExpandableNames {
    
    var isExpanded: Bool
    var names: [Contact]
}

struct Contact {
    let name: String
    var hasFavorited: Bool
}
