//
//  HourlyView.swift
//  WandN
//
//  Created by jeyaram-pt4154 on 26/05/21.
//

import UIKit

class HourlyView: UIView {
    var collection = UICollectionView(frame:.zero ,collectionViewLayout:UICollectionViewFlowLayout())
    var hourlyData = [Current]()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
    }
    override func didMoveToSuperview() {
        setCollectionView()
    }
    func setCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let frameofCollection = CGRect(x: 0, y: 0, width: self.frame.width , height: self.frame.height)
       collection = UICollectionView(frame: frameofCollection, collectionViewLayout: layout)
        
                collection.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CollectionViewCell.identifier)
       
        

        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = UIColor.clear
        collection.showsHorizontalScrollIndicator = false
        self.addSubview(collection)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
extension HourlyView:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 150)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hourlyData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        cell.configure(with: hourlyData[indexPath.row])
        return cell
    }
    
    
}