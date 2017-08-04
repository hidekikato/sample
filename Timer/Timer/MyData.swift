//
//  MyData.swift
//  Timer
//
//  Created by kato hideki on 2017/07/28.
//  Copyright © 2017年 mycompany. All rights reserved.
//

import UIKit

class MyData: NSObject, NSCoding {
    
    var timeData: String?
    
    override init() {
        
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(timeData, forKey: "timeData")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.timeData = aDecoder.decodeObjectForKey("timeData") as? String
    }
    
}
