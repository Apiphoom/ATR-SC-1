//
//  Internet test.swift
//  ATR SC
//
//  Created by Apiphoom Chuenchompoo on 22/12/2562 BE.
//  Copyright © 2562 Apiphoom Chuenchompoo. All rights reserved.
//

import UIKit
import WebKit
class Internet: UIViewController, WKNavigationDelegate {
    
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var ActInd: UIActivityIndicatorView!
    
    @IBOutlet weak var Text: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string:"https://speedtest.telstra.com")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        
        webView.addSubview(Text)
        webView.addSubview(ActInd)
        ActInd.startAnimating()
        
        webView.navigationDelegate = self
        ActInd.hidesWhenStopped = true
        
    }
    
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        ActInd.stopAnimating()
        Text.isHidden = true
        
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        ActInd.stopAnimating()
        Text.isHidden = true
    }
    
    
    
    
    
}

