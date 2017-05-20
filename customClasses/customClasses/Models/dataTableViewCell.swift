//
//  dataTableViewCell.swift
//  customClasses
//
//  Created by Federico Frias on 5/19/17.
//  Copyright © 2017 ffrias. All rights reserved.
//

import UIKit

class dataTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dataCellUserId: UILabel!
    
    @IBOutlet weak var dataCellId: UILabel!
    
    @IBOutlet weak var dataCellTitle: UILabel!
    
    @IBOutlet weak var dataCellBody: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadData(userId:Int, id:Int, title:String, body:String){
        
        self.dataCellUserId.text = String(userId)
        
        self.dataCellId.text = String(id)
        
        self.dataCellTitle.text = title
        
        self.dataCellBody.text = body
    }
    
    override func prepareForReuse() {
        
        self.dataCellUserId.text = nil
        
        self.dataCellId.text = nil
        
        self.dataCellTitle.text = nil
        
        self.dataCellBody.text = nil
        
        super.prepareForReuse()
    }
}
