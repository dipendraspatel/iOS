//
//  WebViewController.swift
//  User Auth
//
//  Created by ChawTech Solutions on 10/08/19.
//  Copyright © 2019 Dipendra. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController ,WKNavigationDelegate{

    @IBOutlet weak var webView: WKWebView!
    var tokenString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self

        let url = URL(string: "https://www.mckinleyrice.com/?token=" + tokenString)!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }


}
