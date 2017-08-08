//
//  MyWebViewController.swift
//  Search
//
//  Created by kato hideki on 2017/08/08.
//  Copyright © 2017年 mycompany. All rights reserved.
//

import UIKit
import WebKit

class MyWebViewController: UIViewController, WKNavigationDelegate {

    let myWebView = WKWebView()
    var currentSelectedCell: MyData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myWebView.navigationDelegate = self
        
        self.myWebView.frame = self.view.frame
        self.view.addSubview(myWebView)

        let url = self.currentSelectedCell!.url!
        let myURL = NSURL(string: url.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!)
        let myURLRequest = NSURLRequest(URL: myURL!)
        self.myWebView.loadRequest(myURLRequest)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
