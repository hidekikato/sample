//
//  ViewController.swift
//  Change
//
//  Created by kato hideki on 2017/07/21.
//  Copyright © 2017年 mycompany. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myLabel: UILabel!
    
    var dataCollection = DataCollection.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myTextField.delegate = self
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        if let storeData = userDefaults.objectForKey("dataCollection") as? NSData {
            if let unarchivedData = NSKeyedUnarchiver.unarchiveObjectWithData(storeData) as? DataCollection {
                self.dataCollection.datas = unarchivedData.datas
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func myButton(sender: AnyObject) {
        if self.myTextField.text!.isEmpty {
            self.myLabel.text = "未入力です。"
            
        } else {
            let text = self.myTextField.text
            self.myLabel.text = text
            
            let data = Data()
            data.text = text
            data.currentTime = getCurrentTime()
            self.dataCollection.addDataCollection(data)
            
            let archiveData = NSKeyedArchiver.archivedDataWithRootObject(self.dataCollection)
            let userDefaults = NSUserDefaults.standardUserDefaults()
            userDefaults.setObject(archiveData, forKey: "dataCollection")
            userDefaults.synchronize()
            
            print(self.dataCollection.datas)
        }
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.myTextField.resignFirstResponder()
        return true
    }

    func getCurrentTime() -> String {
        let now = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.timeStyle = .MediumStyle
        dateFormatter.dateStyle = .MediumStyle
        let currentTime = dateFormatter.stringFromDate(now)
        
        return currentTime
    }
    
}