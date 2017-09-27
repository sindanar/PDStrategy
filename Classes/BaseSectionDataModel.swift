//
//  BaseSectionDataModel.swift
//  PositiveClub
//
//  Created by Pavel Deminov on 06/08/2017.
//  Copyright © 2017 Company. All rights reserved.
//

import UIKit

class BaseSectionDataModel: BaseModel {
    var valid: Bool?
    var modelWithError: BaseDataModel?
    
    var sectionDataArray = [(section: String?, data: [BaseDataModel])]()
    
    func addSection(sectionName: String?, dataModel: [BaseDataModel]) {
        sectionDataArray.append((sectionName , dataModel))
    }
    
    func removeSections() {
        sectionDataArray = [(String?, [BaseDataModel])]()
    }
    
    func validate() -> BaseDataModel? {
        invalidate()
        var modelWithError: BaseDataModel?
        var valid = true
        
        for sectionInfo in sectionDataArray {
            for model in sectionInfo.data {
                model.validate()
                valid = model.isValid == .valid
                if (!valid) {
                    modelWithError = model
                    break
                }
            }
            if (!valid) {
                break
            }
        }
        
        self.valid = valid
        self.modelWithError = modelWithError
        
        return modelWithError;
    }
    
    internal func invalidate() {
        valid = nil
        self.modelWithError = nil
        for sectionInfo in sectionDataArray {
            for model in sectionInfo.data {
                model.invalidate()
            }
        }
    }
    
    func objectToDictionary() -> [String: Any] {
        var dict = [String: Any]()
        for section in sectionDataArray {
            for cellInfo in section.data {
                if let container = cellInfo as? ContainerDataModel, let containerData = container.containerData {
                    for cellInfoInContainer in containerData {
                        if let value = cellInfoInContainer.apiValue, let key = cellInfoInContainer.apiKey {
                            dict[key] = value
                        }
                    }
                } else {
                    if let value = cellInfo.apiValue, let key = cellInfo.apiKey {
                        dict[key] = value
                    }
                }
            }
        }
        
        return dict;
    }
}
