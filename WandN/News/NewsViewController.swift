//
//  NewsViewController.swift
//  WandN
//
//  Created by jeyaram-pt4154 on 25/05/21.
//

import UIKit

class NewsViewController: UIViewController {
    let apiFetch = FetchApi()
    @IBOutlet var topView: UIView!
    @IBOutlet var newsView: UIView!
    
    let tabView = Tabs()
    let mainView = MainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topView.addInnerView(innerView: tabView)
        newsView.addInnerView(innerView: mainView)
        mainView.delegate = self
        tabView.delegate = self
        
        topView.addSubview(tabView)
        newsView.addSubview(mainView)
        requestForNews(ApiUrl.news)
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        createSearchBar()
    }
    
    func createSearchBar(){
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
    }
   
    
    
    func requestForNews(_ url:String){
        var fetchedData : News?
        apiFetch.request(url: url, completion: {data in
            print("Request")
            do{
                let json = try JSONDecoder().decode(News.self,from:data)
                fetchedData = json
            }catch{
                print("ERRORs")
            }
            guard let fetchedData = fetchedData else{ return }
            print("Callback",fetchedData.articles.count)
            self.mainView.NewsData = fetchedData.articles
        })
        
    }
}
extension NewsViewController:UISearchBarDelegate,MainViewDelegate,TabsDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else{return}
        let searchUrl = ApiUrl.search + searchText
        requestForNews(searchUrl)
        searchBar.endEditing(true)
    }
    func reloadNews(with category: String) {
        let categoryUrl = ApiUrl.news+"&category="+category
        requestForNews(categoryUrl)
    }
    
    func openNews(with url: String) {
        let webVc = WebViewController(nibName: "WebViewController", bundle: nil)
        webVc.urlToLoad = url
        webVc.title = "News"
        guard let navigationVC = self.navigationController else {  return }
        navigationVC.pushViewController(webVc, animated: true)
    }
    
    
}
/*
 guard let data = apiFetch.request(url: url) else{return}
 
 var json: News?
 do{
     json = try JSONDecoder().decode(News.self,from:data)
 }catch{
     print("ERRORs")
 }
 guard let fetchedData = json else{ return }
 print(fetchedData.articles.count)
 self.mainView.NewsData = fetchedData.articles
 
 DispatchQueue.main.async {
     print(self.mainView.NewsData.count)
     self.mainView.table.reloadData()
     
 }
 */
/*
 apiFetch.request(url: url, completion: {data in
     print("Request")
     do{
         json = try JSONDecoder().decode(News.self,from:data)
     }catch{
         print("ERRORs")
     }
     guard let fetchedData = json else{ return }
     print("Callback",fetchedData.articles.count)
     self.mainView.NewsData = fetchedData.articles
     reload()
 })
 */
