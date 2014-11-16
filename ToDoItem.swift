//
//  ToDoItem.swift
//  Taskmate_alpha
//
//  Created by Daniel Tse on 15/11/2014.
//  Copyright (c) 2014 Daniel Tse. All rights reserved.
//

import UIKit

class ToDoItem: NSObject {
    var itemName: NSString = ""
    var completed: Bool = false
    var createDate: NSDate = NSDate()
    
    init(name: String) {
        self.itemName = name
    }
}
