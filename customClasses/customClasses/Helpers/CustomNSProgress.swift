//
//  CustomNSProgress.swift
//  customClasses
//
//  Created by Federico Frias on 5/19/17.
//  Copyright © 2017 ffrias. All rights reserved.
//

import UIKit

class CustomNSProgress: NSObject {
    
    var totalUnitCount: Int
    
    dynamic var completedUnitCount: Int
    
    var localizedDescription: String
    
    
    init(withTotalUnitCount: Int) {
        
        self.totalUnitCount = withTotalUnitCount
    
        self.localizedDescription = ""
        
        self.completedUnitCount = 0
    }
    
    func setLocalizedDescription(description:String){
        
        self.localizedDescription = description
    }
    

}
