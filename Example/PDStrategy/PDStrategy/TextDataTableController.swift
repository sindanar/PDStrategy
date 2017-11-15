//
//  TextDataTableController.swift
//  PDStrategy
//
//  Created by Pavel Deminov on 06/11/2017.
//  Copyright © 2017 Pavel Deminov. All rights reserved.
//

import UIKit

enum TextDataTableType {
    case text;
    case date;
    case phone;
    case money;
    case number;
    case selectorOne;
    case selectorMany;
    case validate;
}

class TextDataTableController: PDController {
    override func setup() {
        let section = PDSection.section()
        
        var items = [PDItem]()
        
        var item = PDItem.item()
        item.type = TextDataTableType.text
        item.placeholder = "Plane text"
        items.append(item)
        
        item = PDItem.item()
        item.title = "Date"
        item.type = TextDataTableType.date
        item.placeholder = "Date"
        item.date = Date()
        items.append(item)
        
        item = PDItem.item()
        item.title = "Phone"
        item.apiKey = "Phone"
        item.type = TextDataTableType.phone
        items.append(item)
        
        let phoneRule = PDRule()
        phoneRule.error = "Phone Rule Error"
        phoneRule.validationBlock = { value in
            return false
        }
        item.rules = [phoneRule]
        
        item = PDItem.item()
        item.title = "Amount"
        item.type = TextDataTableType.money
        items.append(item)
        
        item = PDItem.item()
        item.title = "Number"
        item.type = TextDataTableType.number
        items.append(item)
        
        item = PDItem.item()
        item.title = "Validate"
        item.type = TextDataTableType.validate
        items.append(item)
        
        section.items = items
        
        sections = [section]
    }
}
