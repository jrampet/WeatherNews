//
//  MainView.swift
//  WandN
//
//  Created by jeyaram-pt4154 on 27/05/21.
//

import UIKit
protocol MainViewDelegate{
    func openNews(with url:String)
}

class MainView: UIView {
    let identifier = "TableCell"
    @IBOutlet var table : UITableView!
    var delegate: MainViewDelegate?
    var NewsData = [Article](){
        didSet{
            DispatchQueue.main.async {
                self.table.reloadData()
            }
            
        }
    }
    override init(frame: CGRect){
        super.init(frame: frame)
        let xibView = Bundle.main.loadNibNamed("MainView", owner: self, options: nil)![0] as! UIView
        self.addInnerView(innerView: xibView)
        addSubview(xibView)
        createTable()
        self.backgroundColor = UIColor.clear
    }

    
    func createTable(){
        table.register(UINib(nibName: self.identifier, bundle: nil), forCellReuseIdentifier: self.identifier)
        table.delegate = self
        table.dataSource = self
        table.showsVerticalScrollIndicator = false
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension MainView:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Newsdata:",NewsData.count)
        return NewsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: self.identifier,for: indexPath) as! TableCell
        cell.configure(with: NewsData[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let newsUrl = NewsData[indexPath.row].url else{return}
        delegate?.openNews(with: newsUrl)
    }
  
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}
