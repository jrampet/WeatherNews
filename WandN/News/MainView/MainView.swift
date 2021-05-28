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
    var table = UITableView()
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
        
    }
    
    
    override func didMoveToSuperview() {
        
        createTable()
        self.backgroundColor = UIColor.clear
    }
    
    func createTable(){
        
        table.register(UINib(nibName: TableCell.identifier, bundle: nil), forCellReuseIdentifier: TableCell.identifier)
        table.frame = CGRect(x: 10, y: 10, width: self.frame.width-20, height: self.frame.height-20)
        table.delegate = self
        table.dataSource = self
        self.addSubview(table)
        
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
      
        let cell = tableView.dequeueReusableCell(withIdentifier: TableCell.identifier,for: indexPath) as! TableCell
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
