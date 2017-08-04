//
//  MyDataCollection.swift
//  Timer
//
//  Created by kato hideki on 2017/07/28.
//  Copyright © 2017年 mycompany. All rights reserved.
//

import UIKit

class MyDataCollection: NSObject, NSCoding {
    
    static let sharedInstance = MyDataCollection()
    
    var timeDatas: [MyData] = []
    
    func addMyDataCollection(timeData: MyData) {
        self.timeDatas.insert(timeData, atIndex: 0)
    }
    
    override init() {
        
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(timeDatas, forKey: "timeDatas")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.timeDatas = aDecoder.decodeObjectForKey("timeDatas") as! [MyData]
    }
    
}
