//
//  DataCollection.swift
//  Change
//
//  Created by kato hideki on 2017/07/21.
//  Copyright © 2017年 mycompany. All rights reserved.
//

import UIKit

class DataCollection: NSObject, NSCoding {
    
    static let sharedInstance = DataCollection()
    
    var datas: [Data] = []
    func addDataCollection(data: Data) {
        self.datas.insert(data, atIndex: 0)
    }
 
    override init() {
        
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(datas, forKey: "datas_key")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.datas = aDecoder.decodeObjectForKey("datas_key") as! [Data]
    }
    
}
