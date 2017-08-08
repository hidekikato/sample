//
//  ViewController.swift
//  Search
//
//  Created by kato hideki on 2017/08/08.
//  Copyright © 2017年 mycompany. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, UISearchBarDelegate, WKNavigationDelegate {

    @IBOutlet weak var mySearchBar: UISearchBar!
    
    var myDataCollection = MyDataCollection.sharedInstance
    
    let myWKWebView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.mySearchBar.delegate = self
        self.myWKWebView.navigationDelegate = self
        
        self.myWKWebView.frame = CGRectMake(0, self.mySearchBar.frame.maxY, self.view.frame.width, self.view.frame.height - self.mySearchBar.frame.height)
        self.view.addSubview(myWKWebView)
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        if let archiveMyData = userDefaults.objectForKey("archiveMyData") as? NSData {
            if let storedMyData = NSKeyedUnarchiver.unarchiveObjectWithData(archiveMyData) as? MyDataCollection {
                self.myDataCollection.myDatas = storedMyData.myDatas
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func searchDataHistoryButton(sender: AnyObject) {
        performSegueWithIdentifier("SearchDataTableViewControllerSegue", sender: self)
    }

    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        
        let mySearchWord = self.mySearchBar.text!
        let mySearchURL = "https://ja.wikipedia.org/wiki/" + "\(mySearchWord)"
        let myURL = NSURL(string: mySearchURL.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!)
        let myURLRequest = NSURLRequest(URL: myURL!)
        self.myWKWebView.loadRequest(myURLRequest)
        self.mySearchBar.resignFirstResponder()

        let myData = MyData()
        myData.text = mySearchWord
        myData.url = mySearchURL
        myData.currentTime = getCurrentTime()
        self.myDataCollection.addMyDataCollection(myData)
        
        let archiveMyData = NSKeyedArchiver.archivedDataWithRootObject(self.myDataCollection)
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setObject(archiveMyData, forKey: "archiveMyData")
        userDefaults.synchronize()
        
        print(self.myDataCollection.myDatas)
        
    }

    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        self.mySearchBar.text = ""
        defaulURL()
        self.mySearchBar.resignFirstResponder()
    }
    
    func getCurrentTime() -> String {
        let now = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.timeStyle = .MediumStyle
        dateFormatter.dateStyle = .MediumStyle
        let currentTime = dateFormatter.stringFromDate(now)
        
        return currentTime
    }
    
    func defaulURL() {
        let defaultURL = NSURL(string: "https://ja.wikipedia.org/wiki/")
        let defaultURLRequest = NSURLRequest(URL: defaultURL!)
        self.myWKWebView.loadRequest(defaultURLRequest)
    }
    
    func webView(webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }
    
}

