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
    var delegate :TabsDelegate?
    var tabView = UICollectionView(frame:.zero ,collectionViewLayout:UICollectionViewFlowLayout())
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    override func didMoveToSuperview() {
        createCollectionView()
        self.backgroundColor = UIColor.clear
    }
    func createCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        tabView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        tabView.register(UINib(nibName: TabCell.identifier, bundle: nil), forCellWithReuseIdentifier: TabCell.identifier)
        tabView.delegate = self
        tabView.dataSource = self
        tabView.frame = self.bounds
        tabView.backgroundColor = UIColor.clear
        tabView.showsHorizontalScrollIndicator = false
        self.addSubview(tabView)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension Tabs: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Available.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = UICollectionViewCell()
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TabCell.identifier, for: indexPath) as! TabCell
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
