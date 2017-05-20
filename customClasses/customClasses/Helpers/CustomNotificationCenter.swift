//
//  customNotificationCenter.swift
//  customClasses
//
//  Created by Federico Frias on 5/19/17.
//  Copyright © 2017 ffrias. All rights reserved.
//

import Foundation
import UIKit

class CustomNotificationCenter{
    
    static let custom = CustomNotificationCenter()
    
    fileprivate init(){}
    
    var observers = [Observer]()
    
    
    func addObserver(observer:Observer){
    
        observers.append(observer)
    }
    
    func removeObserver(){}
    
    func removeAllObservers(){
        
        observers.removeAll()
    }
    
    func post(){
        
        for observer in observers{
        
            observer.update()
        
        }
    
    }
}

class Observer: NSObject{
    
    let object: AnyObject?
    let selector: String
    
    
    init(object: AnyObject, selector: String){
        self.object = object
        self.selector = selector
    }
    
        func update(){
            
        print("notification updated in CusrtomNotificationCenter")
        
        //My very own implementation for this use case.
            if object is ViewController{
                
                let vc = object as! ViewController
                
                vc.update()
            }
    }
}
