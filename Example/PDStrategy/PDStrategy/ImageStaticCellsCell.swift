//
//  ImageStaticCellsCell.swift
//  PDStrategy
//
//  Created by Pavel Deminov on 05/11/2017.
//  Copyright © 2017 Pavel Deminov. All rights reserved.
//

import UIKit

class ImageStaticCellsCell: PDTableViewCell {

    var titleLabel: PDTitleLabel!
    var imgView: UIImageView!
    
    override func setup() {
        selectionStyle = .none
        let titleValue = TitleImageBuilder.addTitleImage(to: contentView)
        titleLabel = titleValue.titleLabel
        imgView = titleValue.imageView
    }
    
    override func updateUI() {
        titleLabel.text = itemInfo?.pdTitle
        
        if let image = itemInfo?.pdImage {
            imgView.image = image
        }
//        else if let url = itemInfo?.imageUrl {
//            
//        }
    }

}
