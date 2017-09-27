//
//  DocumentBaseDataModel.swift
//  PositiveClub
//
//  Created by Pavel Deminov on 07/08/2017.
//  Copyright © 2017 Company. All rights reserved.
//

import UIKit

class NumbersDataModel: BaseDataModel {
    
    override func updateObjectFromTextFieldValue() {
        object = textFieldValue as Any
    }
    
    override func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return string.isNumberString
    }
    
    override func updateApiValueFromObject() {
        apiValue = object as? String
    }
    
}
