//
//  Data.swift
//  Change
//
//  Created by kato hideki on 2017/07/21.
//  Copyright © 2017年 mycompany. All rights reserved.
//

import UIKit

class Data: NSObject, NSCoding {
    
    var text: String?
    var currentTime: String?
    var todoDone: Bool = false
    
    override init() {
        
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(text, forKey: "text")
        aCoder.encodeObject(currentTime, forKey: "currentTime")
        aCoder.encodeBool(todoDone, forKey: "todoDone")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.text = aDecoder.decodeObjectForKey("text") as? String
        self.currentTime = aDecoder.decodeObjectForKey("currentTime") as? String
        self.todoDone = aDecoder.decodeBoolForKey("todoDone")
    }
    
}