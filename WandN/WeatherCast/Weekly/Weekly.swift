//
//  Weekly.swift
//  WandN
//
//  Created by jeyaram-pt4154 on 25/05/21.
//

import UIKit

class Weekly: CardView {
    var table = UITableView()
    var models = [Daily]()
    override init(frame: CGRect){
        super.init(frame: frame)
//        self.backgroundColor = UIColor.systemTeal
        self.backgroundColor =  Colors.skyblue
    }
    
    override func didMoveToSuperview() {
        addTable()
    }
    
    func addTable(){
        table.register(UINib(nibName: "WeatherCell", bundle: nil), forCellReuseIdentifier: WeatherCell.identifier)
        table.frame = CGRect(x: 0, y: 0, width: self.frame.width , height: self.frame.height)
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = UIColor.clear
        table.separatorStyle = .none
        table.showsVerticalScrollIndicator = false
        self.addSubview(table)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
extension Weekly: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(models.count)
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: WeatherCell.identifier,for: indexPath) as! WeatherCell
        cell.configure(with: models[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
}
