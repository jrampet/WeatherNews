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
    let indicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        indicator.center = view.center
        indicator.startAnimating()
        view.addSubview(indicator)
        webView.navigationDelegate = self
        createWebView()
        // Do any additional setup after loading the view.
    }
    
    func createWebView(){
        webView.frame = view.frame
        guard let url = URL(string:urlToLoad) else{print("NIL");return}
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
extension WebViewController: WKNavigationDelegate{
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("finished")
        indicator.stopAnimating()
        view = webView
    }
}
