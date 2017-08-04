//
//  ViewController.swift
//  Slider
//
//  Created by kato hideki on 2017/08/03.
//  Copyright © 2017年 mycompany. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var RGBLabel: UILabel!
    
    @IBOutlet weak var redValue: UISlider!
    @IBOutlet weak var greenValue: UISlider!
    @IBOutlet weak var blueValue: UISlider!
    
    @IBOutlet weak var myTable: UITableView!
    
    var red = 255, green = 255, blue = 255
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myTable.delegate = self
        self.myTable.dataSource = self
        
        self.redLabel.text = String(format: "R：%03d", red)
        self.greenLabel.text = String(format: "G：%03d", green)
        self.blueLabel.text = String(format: "B：%03d", blue)
        self.RGBLabel.text = "RGB value is #" + String(format: "%02x%02x%02x", red, green, blue).uppercaseString
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func rgb(r: Int, g: Int, b: Int, alpha: CGFloat) -> UIColor {
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 13
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
//        switch indexPath.row {
//        case 1:
//            self.red = check(self.red - 20)
//        case 2:
//            self.red = check(self.red - 10)
//        case 3:
//            self.red = check(self.red + 10)
//        case 4:
//            self.red = check(self.red + 20)
//        case 5:
//            self.green = check(self.green - 20)
//        case 6:
//            self.green = check(self.green - 10)
//        case 7:
//            self.green = check(self.green + 10)
//        case 8:
//            self.green = check(self.green + 20)
//        case 9:
//            self.blue = check(self.blue - 20)
//        case 10:
//            self.blue = check(self.blue - 10)
//        case 11:
//            self.blue = check(self.blue + 10)
//        case 12:
//            self.blue = check(self.blue + 20)
//        default:
//            break
//        }
        
        cell.backgroundColor = rgb(self.red, g: self.green, b: self.blue, alpha: 1)
        cell.textLabel?.text = String(format: "#%02x%02x%02x", red, green, blue).uppercaseString
        
        return cell
    }
    
//    func check(var value: Int) -> Int {
//        if value > 255 {
//            value = 255
//        } else if value < 0 {
//            value = 0
//        }
//        
//        return value
//    }
    
    @IBAction func redSlider(sender: AnyObject) {
        self.red = Int(self.redValue.value)
        print("R:\(red)")
        self.redLabel.text = String(format: "R：%03d", red)
        self.RGBLabel.text = "RGB value is #" + String(format: "%02x%02x%02x", red, green, blue).uppercaseString
        myTable.reloadData()
    }
    
    @IBAction func greenSlider(sender: AnyObject) {
        self.green = Int(self.greenValue.value)
        print("R:\(green)")
        self.greenLabel.text = String(format: "G：%03d", green)
        self.RGBLabel.text = "RGB value is #" + String(format: "%02x%02x%02x", red, green, blue).uppercaseString
        myTable.reloadData()
    }
    
    @IBAction func blueSlider(sender: AnyObject) {
        self.blue = Int(self.blueValue.value)
        print("R:\(blue)")
        self.blueLabel.text = String(format: "B：%03d", blue)
        self.RGBLabel.text = "RGB value is #" + String(format: "%02x%02x%02x", red, green, blue).uppercaseString
        myTable.reloadData()
    }
    
}

