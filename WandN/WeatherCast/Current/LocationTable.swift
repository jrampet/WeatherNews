//
//  LocationTable.swift
//  WandN
//
//  Created by jeyaram-pt4154 on 31/05/21.
//

import UIKit
import CoreLocation
class LocationTable: UITableView {
    var dataArray = [String]()
    var filteredArray = [String]()
    var indexArray = [CLLocation]()
    var currentLocation: CLLocation?
    let cellId = "Cell"
    var getlocation:((Int)->())?
    override func awakeFromNib() {
        register(UITableViewCell.self, forCellReuseIdentifier: cellId)

        self.delegate = self
        self.dataSource = self
        
    }
}
extension LocationTable:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId,for: indexPath)
        cell.textLabel?.text = dataArray[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(dataArray[indexPath.row])
        getlocation?(indexPath.row)
    }
    
    
}
