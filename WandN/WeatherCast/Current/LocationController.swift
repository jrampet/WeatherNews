//
//  LocationController.swift
//  WandN
//
//  Created by jeyaram-pt4154 on 31/05/21.
//

import UIKit
import CoreLocation
class LocationController: UIViewController {
    
    
    var table : LocationTable?
    var tableData = [String]()
    
    var tableIndex = [CLLocation]()
    var pushLocation :((CLLocation,String)->())?
    @IBOutlet var searchBar : UITextField!
    @IBOutlet var dataView : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTable()
        
        // Do any additional setup after loading the view.
    }
    func createTable(){
        table = Bundle.main.loadNibNamed("LocationTable", owner: nil, options: nil)![0] as? LocationTable
        table?.frame = self.dataView.bounds
        guard let table = table else{return }
        table.dataArray = tableData
        table.indexArray = tableIndex
        print(tableIndex.count)
        self.dataView.addSubview(table)
        
        table.getlocation = { (index) in
        
            self.pushLocation?(self.tableIndex[index],self.tableData[index])
            if let navController = self.navigationController {
                navController.popViewController(animated: true)
            }
        }
        
       
    }
    
   
   
}
