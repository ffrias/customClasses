//
//  dataModel.swift
//  customClasses
//
//  Created by Federico Frias on 5/18/17.
//  Copyright © 2017 ffrias. All rights reserved.
//

import Foundation

class dataModel{
    
    var userId: Int
    
    var id: Int
    
    var title: String
    
    var body: String
    
    
    init(userId:Int, id: Int, title: String, body: String) {
    
        self.userId = userId
        
        self.id = id
        
        self.title = title
        
        self.body = body
    }
}
