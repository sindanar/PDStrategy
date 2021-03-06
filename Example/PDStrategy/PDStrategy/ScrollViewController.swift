//
//  ScrollViewController.swift
//  PDStrategy
//
//  Created by Pavel Deminov on 07/01/2018.
//  Copyright © 2018 Pavel Deminov. All rights reserved.
//

import UIKit

class ScrollViewController: PDScrollViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func cellIdentifier(for indexPath: IndexPath) -> String {
        guard let item = itemInfo(for: indexPath), let type = item.pdType as? ScrollControllerItemType else {
            return super.cellIdentifier(for: indexPath)
        }
        
        switch type {
        
        case .titleValue:
            return TitleValueScrollCell.reuseIdentifier()
         default:
            return super.cellIdentifier(for: indexPath)
        }
    }
    
    override func scrollView(_ scrollView: UIScrollView, didSelectItemAt indexPath: IndexPath) {
        guard let item = itemInfo(for: indexPath) else {
            return
        }
        //item.value = String(describing: indexPath)
        //self.controller?.updateItem(at: indexPath)
        self.dataSource?.removeItem(at: indexPath)
    }

}
