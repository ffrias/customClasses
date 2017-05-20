//
//  APIClient.swift
//  customClasses
//
//  Created by Federico Frias on 5/18/17.
//  Copyright © 2017 ffrias. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import UIKit

class APIClient: NSObject{
    
    static let sharedInstance = APIClient()
    
    fileprivate override init(){}
    
    let jsonURL = "https://jsonplaceholder.typicode.com/posts"
    
    var data = [dataModel]()
    
    
    func getDataFromServer(withProgress: CustomNSProgress){
        
        Alamofire.request(jsonURL)
            
        .validate()
            
        .responseJSON { response in
                
                switch response.result {
                    
                case .success:
                    
                    if let data = response.result.value {
                        
                        self.data.removeAll()
                        
                        let json = JSON(data)
                      
                        let progress = withProgress
                        
                        progress.totalUnitCount = json.arrayValue.count     //Instanciate a new custom progress object
                        
                        for result in json.arrayValue{
                            
                            let userId = result["userId"].intValue
                            
                            let id = result["id"].intValue
                            
                            let title = result["title"].stringValue
                            
                            let body = result["body"].stringValue
                            
                            let newDataObject = dataModel(userId: userId, id: id, title: title, body: body)
                            
                            self.data.append(newDataObject)
                            
                            progress.completedUnitCount += 1
                        }
                        
                        progress.completedUnitCount = progress.totalUnitCount    //Progres task finished
                        
                        CustomNotificationCenter.custom.post()       //Notify that I finish getting data
                    }
                    break
                    
                    case .failure(let error):
                        
                        print(error)
                        
                    break
                }
        }
    }
}
