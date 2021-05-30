//
//  Tabs.swift
//  WandN
//
//  Created by jeyaram-pt4154 on 27/05/21.
//

import UIKit
protocol TabsDelegate{
    func reloadNews(with url:String)
}
class Tabs: UIView {
    let identifier = "TabCell"
    var delegate :TabsDelegate?
    @IBOutlet var tabView : UICollectionView!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        let xibView = Bundle.main.loadNibNamed("Tabs", owner: self, options: nil)![0] as! UIView
        self.addInnerView(innerView: xibView)
        addSubview(xibView)
        createCollectionView()
    }
    func createCollectionView(){
        tabView.register(UINib(nibName: self.identifier, bundle: nil), forCellWithReuseIdentifier: self.identifier)
        tabView.delegate = self
        tabView.dataSource = self
    }
   
    required init?(coder: NSCoder) {
        super.init(coder: coder)
//        fatalError("init(coder:) has not been implemented")
    }
    
}


extension Tabs: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Available.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = UICollectionViewCell()
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.identifier, for: indexPath) as! TabCell
        cell.configure(with: Available.categories[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 130, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        delegate?.reloadNews(with: Available.categories[indexPath.row])
        
    }

    
    
}
/*
 var tabView = UICollectionView(frame:.zero ,collectionViewLayout:UICollectionViewFlowLayout())
 
 override func didMoveToSuperview() {
     createCollectionView()
     self.backgroundColor = UIColor.clear
 }
 func createCollectionView(){
     let layout = UICollectionViewFlowLayout()
     layout.scrollDirection = .horizontal
     tabView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
     tabView.register(UINib(nibName: self.identifier, bundle: nil), forCellWithReuseIdentifier: self.identifier)
     tabView.delegate = self
     tabView.dataSource = self
     tabView.frame = self.bounds
     tabView.backgroundColor = UIColor.clear
     tabView.showsHorizontalScrollIndicator = false
     self.addSubview(tabView)
 }
 */
