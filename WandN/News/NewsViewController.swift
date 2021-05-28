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
        createSearchBar()
        tabView.frame = CGRect(x: 10, y: 10, width: topView.frame.width, height: topView.frame.height)
        mainView.frame = newsView.bounds
        
        mainView.delegate = self
        tabView.delegate = self
        
//        topView.addSubview(tabView)
        newsView.addSubview(mainView)
        requestForNews(APIURL.news)
        // Do any additional setup after loading the view.
    }
    
    func createSearchBar(){
        
        let searchController = UISearchController(searchResultsController: nil)
        
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        
    }
   
    func requestForNews(_ url:String){
        
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
    }
}
extension NewsViewController:UISearchBarDelegate,MainViewDelegate,TabsDelegate{
    func reloadNews(with category: String) {
        let categoryUrl = APIURL.news+"&category="+category
        requestForNews(categoryUrl)
    }
    
    func openNews(with url: String) {
        let webVc = WebViewController()
        webVc.urlToLoad = url
        webVc.title = "News"
        guard let navigationVC = self.navigationController else {  return }
        navigationVC.pushViewController(webVc, animated: true)
    }
    
    
}
