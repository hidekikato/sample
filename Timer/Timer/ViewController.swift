//
//  ViewController.swift
//  Timer
//
//  Created by kato hideki on 2017/07/27.
//  Copyright © 2017年 mycompany. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myLabel_002: UILabel!
    @IBOutlet weak var myLabel_003: UILabel!
    
    let myDataCollection = MyDataCollection.sharedInstance
    
    var timer: NSTimer!
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        if let archivedData = userDefaults.objectForKey("archiveData") as? NSData {
            if let storedData = NSKeyedUnarchiver.unarchiveObjectWithData(archivedData) as? MyDataCollection {
                self.myDataCollection.timeDatas = storedData.timeDatas
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func timeDataHistoryButton(sender: AnyObject) {
        self.performSegueWithIdentifier("TimeDataTableViewControllerSegue", sender: self)
    }
    
    @IBAction func myPlayButton(sender: AnyObject) {
        if self.timer != nil {
            self.timer.invalidate()
        }
        
        self.timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("increaseTimer:"), userInfo: nil, repeats: true)
        
    }
    
    @IBAction func myPauseButton(sender: AnyObject) {
        if self.timer != nil {
            self.timer.invalidate()
        }
    }
    
    @IBAction func myStopButton(sender: AnyObject) {
        if self.timer != nil {
            self.timer.invalidate()
            getTimeData()
            reset()
        }
    }
    
    func increaseTimer(sender: NSTimer) {
        self.count++
        let ms = self.count % 100
        let s = (self.count - ms) / 100 % 60
        let m = (self.count - ms - s) / 6000 % 3600
        
        self.myLabel.text = String(format: "%02d", m)
        self.myLabel_002.text = String(format: "%02d", s)
        self.myLabel_003.text = String(format: "%02d", ms)
        print(self.count)
        
    }
    
    func getTimeData() {
        let min = self.myLabel.text!
        let sec = self.myLabel_002.text!
        let msec = self.myLabel_003.text!
        let timeData = "\(min)" + ":" + "\(sec)" + "." + "\(msec)"
        print(timeData)
        
        let myData = MyData()
        myData.timeData = timeData
        self.myDataCollection.addMyDataCollection(myData)
        
        let archiveData = NSKeyedArchiver.archivedDataWithRootObject(self.myDataCollection)
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setObject(archiveData, forKey: "archiveData")
        userDefaults.synchronize()
        
    }
    
    func reset() {
        self.count = 0
        self.myLabel.text = "00"
        self.myLabel_002.text = "00"
        self.myLabel_003.text = "00"
    }
    
}

