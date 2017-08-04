//
//  ViewController.swift
//  Web
//
//  Created by kato hideki on 2017/08/04.
//  Copyright © 2017年 mycompany. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    let myWKWebView = WKWebView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myWKWebView.frame = CGRectMake(0, 64, self.view.frame.width, self.view.frame.height - (64 + 44))
        self.view.addSubview(myWKWebView)
        
        self.myWKWebView.navigationDelegate = self
        
        self.myWKWebView.addObserver(self, forKeyPath: "title", options: NSKeyValueObservingOptions.New, context: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func webView(webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    
    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        self.titleLabel.text = self.myWKWebView.title
    }
    
    deinit {
        self.myWKWebView.removeObserver(self, forKeyPath: "title")
    }
    
    @IBAction func tabGoogle(sender: AnyObject) {
        let myUrl = NSURL(string: "https://www.google.co.jp")
        let myUrlRequest = NSURLRequest(URL: myUrl!)
        self.myWKWebView.loadRequest(myUrlRequest)
        
    }
    
    @IBAction func tapYahoo(sender: AnyObject) {
        let myUrl = NSURL(string: "https://www.yahoo.co.jp")
        let myUrlRequest = NSURLRequest(URL: myUrl!)
        self.myWKWebView.loadRequest(myUrlRequest)
        
    }
    
    @IBAction func tapAmazon(sender: AnyObject) {
        let myUrl = NSURL(string: "https://www.amazon.co.jp")
        let myUrlRequest = NSURLRequest(URL: myUrl!)
        self.myWKWebView.loadRequest(myUrlRequest)
        
    }
    
    @IBAction func tapBack(sender: AnyObject) {
        self.myWKWebView.goBack()
        
    }
    
    @IBAction func tapNext(sender: AnyObject) {
        self.myWKWebView.goForward()
        
    }
    
    @IBAction func tapReload(sender: AnyObject) {
        self.myWKWebView.reload()
        
    }

}

