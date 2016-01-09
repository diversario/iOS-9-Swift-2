//
//  ViewController.swift
//  web-request-test
//
//  Created by Ilya Shaisultanov on 1/9/16.
//  Copyright © 2016 Ilya Shaisultanov. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet weak var container: UIView!
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView = WKWebView()
        container.addSubview(webView)
    }

    override func viewDidAppear(animated: Bool) {
        let frame = CGRectMake(0, 0, container.bounds.width, container.bounds.height)
        webView.frame = frame
        
        let urlStr = "https://developer.apple.com/swift/blog/"
        let url = NSURL(string: urlStr)!
        let request = NSURLRequest(URL: url)
        
        webView.loadRequest(request)
    }

    @IBAction func loadSwift(sender: UIButton) {
        loadUrl("https://developer.apple.com/swift/blog/")
    }
    
    @IBAction func loadSoylent(sender: UIButton) {
        loadUrl("https://soylent.me")
    }
    
    @IBAction func loadTwitter(sender: UIButton) {
        loadUrl("https://twitter.com")
    }
    
    func loadUrl(urlStr: String) {
        let url = NSURL(string: urlStr)!
        let request = NSURLRequest(URL: url)
        
        webView.loadRequest(request)
    }
}

