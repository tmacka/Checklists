//
//  CheckListItem.swift
//  Checklists
//
//  Created by Tom MacKay on 12/08/2019.
//  Copyright © 2019 Tom MacKay. All rights reserved.
//

import Foundation

class CheckListItem: NSObject {
    
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
}
