//
//  PhoneTextDataTableCell.swift
//  PDStrategy
//
//  Created by Pavel Deminov on 06/11/2017.
//  Copyright © 2017 Pavel Deminov. All rights reserved.
//

import UIKit

class PhoneTextDataTableCell: TextDataTableCell {
    
    let phoneFormatter: TextFieldFormatter = {
        let textFieldFormatter = TextFieldFormatter()
        textFieldFormatter.format = "+7(xxx)xx-xx-xxx"
        textFieldFormatter.dynamicSymbol = "x"
        textFieldFormatter.characterSet = CharacterSet.decimalDigits
        textFieldFormatter.staticAttributes = [
            NSAttributedStringKey.foregroundColor: UIColor.gray,
            NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14),
        ]
        textFieldFormatter.dynamicAttributes = [
            NSAttributedStringKey.foregroundColor:UIColor.black,
            NSAttributedStringKey.font: UIFont.systemFont(ofSize: 16),
        ]
        return textFieldFormatter
    }()
    
    override func setup() {
        super.setup()
        textField.keyboardType = .numberPad
        phoneFormatter.valueChangedBlock = valueChanged
    }
    
    override func updateUI() {
        super.updateUI()
        if let value = itemInfo?.pdValue as? String {
            phoneFormatter.applyText(text: value, textField: textField)
        } else {
            phoneFormatter.applyText(text: "", textField: textField)
        }
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return phoneFormatter.textField(textField, shouldChangeCharactersIn: range, replacementString:string)
    }
    
    override func textFieldDidBeginEditing(_ textField: UITextField) {
        super.textFieldDidBeginEditing(textField)
        
    }
    
    @objc override func valueChanged() {
        let raw = phoneFormatter.rawFromText(text: textField.text)
        if let pdItem = itemInfo as? PDItem {
            pdItem.value = raw
        }
        
    }
}
