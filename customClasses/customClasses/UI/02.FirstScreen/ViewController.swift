//
//  ViewController.swift
//  customClasses
//
//  Created by Federico Frias on 5/18/17.
//  Copyright © 2017 ffrias. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tableData = [dataModel]()
    
    var mainProgress: CustomNSProgress!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        
        tableView.delegate = self
        
        tableView.dataSource = self
        
        setUpProgressObserver()
        
        getData()
        
        setUpCustomNotificationCenter()
    }
    
    func update(){
        
        reloadViewData()
    }
    func getData(){
        
        APIClient.sharedInstance.getDataFromServer(withProgress: mainProgress)
    }
    
    func reloadViewData(){
        
        tableData = APIClient.sharedInstance.data
        
        tableView.reloadData()
    }
    
    func setUpProgressObserver(){
        
        mainProgress = CustomNSProgress(withTotalUnitCount: -1)
        
        addObserver(self, forKeyPath: #keyPath(mainProgress.completedUnitCount), options: [.old, .new], context: nil)
    }
    
    func setUpCustomNotificationCenter(){
        
        let addNotification = Observer(object: self as AnyObject!, selector: "ViewController.reloadViewData:")
        
        CustomNotificationCenter.custom.addObserver(observer: addNotification)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if keyPath == #keyPath(mainProgress.completedUnitCount){
            
            let progresBarValue = (mainProgress.completedUnitCount / mainProgress.totalUnitCount)
            
            progressBar.setProgress(Float(progresBarValue), animated: true)
        }
    }
}

extension ViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataTableViewCell") as! dataTableViewCell
        
        let id = tableData[indexPath.row].id
        
        let userId = tableData[indexPath.row].userId
        
        let title = tableData[indexPath.row].title
        
        let body = tableData[indexPath.row].body
        
        cell.loadData(userId: id, id: userId, title: title, body: body)
        
        return cell
    }
}

extension ViewController:UITableViewDelegate{}
