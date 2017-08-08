//
//  MyDataCollection.swift
//  Search
//
//  Created by kato hideki on 2017/08/08.
//  Copyright © 2017年 mycompany. All rights reserved.
//

import UIKit

class MyDataCollection: NSObject, NSCoding {
    
    static let sharedInstance = MyDataCollection()
    
    var myDatas: [MyData] = []
    func addMyDataCollection(myData: MyData) {
        self.myDatas.insert(myData, atIndex: 0)
    }
    
    override init() {
        
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(myDatas, forKey: "myDatas")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.myDatas = aDecoder.decodeObjectForKey("myDatas") as! [MyData]
    }
    
}
