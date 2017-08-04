//
//  ViewController.swift
//  Score
//
//  Created by kato hideki on 2017/07/27.
//  Copyright © 2017年 mycompany. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    
    var score = Int(arc4random() % 101)
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myTextField.delegate = self
        
        print(self.score)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func myButton(sender: AnyObject) {
        let answer = Int(self.myTextField.text!)
        
        if answer == self.score {
            self.count += 1
            self.myLabel.text = "\(self.count)回目で正解！"
            self.myImageView.image = UIImage(named: "correct@2x")
            self.score = Int(arc4random() % 101)
            self.count = 0
            
            print(self.score)
            
        } else if answer < 0 || answer > 100 {
            self.myLabel.text = "0〜100を入力して下さい。"
            self.myImageView.image = nil
            
        } else if answer < self.score {
            self.count += 1
            self.myLabel.text = "もっと高いです！"
            self.myImageView.image = UIImage(named: "incorrect@2x")

        } else {
            self.count += 1
            self.myLabel.text = "もっと低いです！"
            self.myImageView.image = UIImage(named: "incorrect@2x")

        }
        
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.myTextField.resignFirstResponder()
        return true
    }
    
}

