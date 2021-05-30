//
//  WebViewController.swift
//  WandN
//
//  Created by jeyaram-pt4154 on 30/05/21.
//

import UIKit
import WebKit
class WebViewController: UIViewController {
    

    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    let webView = WKWebView()
    var urlToLoad : String = ""
    override func viewDidLoad() {
        activityIndicator.startAnimating()
        webView.navigationDelegate = self
        super.viewDidLoad()
        createWebView()

        // Do any additional setup after loading the view.
    }

    func createWebView(){
          webView.frame = view.frame
          guard let url = URL(string:urlToLoad) else{return}
          let request = URLRequest(url: url)
          webView.load(request)
      }

}
extension WebViewController: WKNavigationDelegate{
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("finished")
        activityIndicator.stopAnimating()
        view = webView
    }
}
