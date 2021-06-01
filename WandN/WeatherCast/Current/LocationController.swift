//
//  LocationController.swift
//  WandN
//
//  Created by jeyaram-pt4154 on 31/05/21.
//

import UIKit
import CoreLocation
class LocationController: UIViewController {
    
    
//    var table : LocationTable?
    var filteredData = [String]()
    var tableData = [String](){
        didSet{
            filteredData = tableData
        }
    }
   
    var tableIndex = [CLLocation]()
    
    var pushLocation :((CLLocation,String)->())?
    @IBOutlet var searchBar : UISearchBar!
    @IBOutlet var dataView : UIView!
    @IBOutlet var table : UITableView!
    let cellId = "cell"
    override func viewDidLoad() {
        super.viewDidLoad()
        createSearch()
        // Do any additional setup after loading the view.
    }
    func createSearch(){
        table.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        searchBar.delegate = self
        table.delegate = self
        table.dataSource = self
    }
    
   
   
}
extension LocationController:UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId,for: indexPath)
        cell.textLabel?.text = filteredData[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.pushLocation?(self.tableIndex[indexPath.row],self.filteredData[indexPath.row])
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        filteredData = searchText.isEmpty ? tableData : tableData.filter(
            {
                return $0.contains(searchText)
            }
        )
        table.reloadData()
    }
    
}

