//
//  WebViewController.swift
//  WandN
//
//  Created by jeyaram-pt4154 on 27/05/21.
//

import UIKit
import WebKit
class WebViewController: UIViewController {
    var urlToLoad:String=""
    let webView = WKWebView()
    override func viewDidLoad() {
        super.viewDidLoad()
        createWebView()
        // Do any additional setup after loading the view.
    }
    
    func createWebView(){
        webView.frame = view.frame
        view = webView
//        guard let url = URL(string:"https://google.com") else{return}
        guard let url = URL(string:urlToLoad) else{print("NIL");return}

        let request = URLRequest(url: url)
        webView.load(request)
//        view.addSubview(webView)
    }

}
