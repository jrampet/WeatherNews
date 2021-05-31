//
//  Weekly.swift
//  WandN
//
//  Created by jeyaram-pt4154 on 25/05/21.
//

import UIKit

class Weekly: CardView {
    let identifier = "WeatherCell"
    @IBOutlet var table : UITableView!
    
    var models = [Daily]()
    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor =  Colors.skyblue
        self.register(with: "Weekly")
        addTable()
    }
    
   
    
    func addTable(){
        table.register(UINib(nibName: "WeatherCell", bundle: nil), forCellReuseIdentifier: self.identifier)
        table.delegate = self
        table.dataSource = self
        table.isOpaque = false
        table.backgroundColor = .clear
        table.backgroundView = nil
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
        let cell =  tableView.dequeueReusableCell(withIdentifier: self.identifier,for: indexPath) as! WeatherCell
        cell.configure(with: models[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
}
