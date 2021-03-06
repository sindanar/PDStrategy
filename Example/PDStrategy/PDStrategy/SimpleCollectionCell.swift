//
//  SimpleCollectionCell.swift
//  PDStrategy
//
//  Created by Pavel Deminov on 12/11/2017.
//  Copyright © 2017 Pavel Deminov. All rights reserved.
//

import UIKit

class SimpleCollectionCell: PDCollectionViewCell {
    var titleLabel: PDTitleLabel!
    
    override func setup() {
        weak var wSelf = self
        TitleBuilder.addTitle(to: contentView, with: { (titleLabel) in
            wSelf?.titleLabel = titleLabel;
        })
        
        titleLabel.textAlignment = .center
        contentView.layer.borderColor = UIColor.gray.cgColor
        contentView.layer.borderWidth = 1 / UIScreen.main.scale
    }
    
    override func updateUI() {
        titleLabel.text = itemInfo?.pdTitle
    }
    
    
}
