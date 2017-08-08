//
//  MyData.swift
//  Search
//
//  Created by kato hideki on 2017/08/08.
//  Copyright © 2017年 mycompany. All rights reserved.
//

import UIKit

class MyData: NSObject, NSCoding {
    var text: String?
    var url: String?
    var currentTime: String?
    
    override init() {
        
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(text, forKey: "text")
        aCoder.encodeObject(url, forKey: "url")
        aCoder.encodeObject(currentTime, forKey: "currentTime")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.text = aDecoder.decodeObjectForKey("text") as? String
        self.url = aDecoder.decodeObjectForKey("url") as? String
        self.currentTime = aDecoder.decodeObjectForKey("currentTime") as? String
    }
    
}
