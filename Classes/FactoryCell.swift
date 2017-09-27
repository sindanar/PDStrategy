//
//  FactoryCell.swift
//  ExpertService
//
//  Created by Pavel Deminov on 26/09/2017.
//  Copyright © 2017 Pavel Deminov. All rights reserved.
//

import UIKit

protocol FactoryCellDelegate {
    func editingShouldStart(cell: FactoryCell) -> Bool
    func editingDidBegin(cell: FactoryCell)
    func editingDidEnd(cell: FactoryCell)
}

extension FactoryCellDelegate {
    func editingShouldStart(cell: FactoryCell) -> Bool {
        return true
    }
    func editingDidBegin(cell: FactoryCell) {}
    func editingDidEnd(cell: FactoryCell) {}
}

class FactoryCell: UITableViewCell {
    
    @IBOutlet weak internal(set) var textField: UITextField?
    @IBOutlet weak internal(set) var iconImageView: UIImageView?
    @IBOutlet weak internal(set) var titleLabel: UILabel?
    @IBOutlet weak internal(set) var valueLabel: UILabel?
    @IBOutlet weak internal(set) var errorLabel: UILabel?
    
    var delegate: FactoryCellDelegate?
    var errorLabelBorderColor = UIColor.red
    
    internal var elementModel: BaseDataModel? {
        didSet {
            updateUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        textField?.addTarget(self, action: #selector(editingDidChanged(sender:)), for: .valueChanged)
        textField?.delegate = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    internal func updateUI() {
        guard let element = elementModel else {
            return
        }
        
        textField?.placeholder = element.placeholder
        textField?.text = element.textFieldValue
        valueLabel?.text = element.textFieldValue
        iconImageView?.image = element.icon
        titleLabel?.text = element.title;
        
        switch element.isValid {
        case .valid, .none:
            errorLabel?.isHidden = true
            textField?.layer.borderWidth = 0.0
            errorLabel?.text = " "
            
        case .invalid(let error) :
            errorLabel?.isHidden = false
            errorLabel?.text = error
            textField?.layer.borderColor = errorLabelBorderColor.cgColor
            textField?.layer.borderWidth = 1.0
        }
        
    }
    
    public func editingDidChanged(sender: UITextField) {
        elementModel?.textFieldValue = sender.text
    }

}

extension FactoryCell: UITextFieldDelegate {
    /*
     func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
     //print(self)
     return delegate != nil ? delegate!.editingShouldStart(cell: self) : true
     }
     */
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let elementModel = elementModel {
            return elementModel.textField(textField, shouldChangeCharactersIn: range, replacementString:string)
        } else {
            return true
        }
        
    }
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        elementModel?.invalidate()
        updateUI()
        delegate?.editingDidBegin(cell: self)
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        updateUI()
        delegate?.editingDidEnd(cell: self)
        
    }
}
