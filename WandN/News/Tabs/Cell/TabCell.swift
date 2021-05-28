//
//  TabCell.swift
//  WandN
//
//  Created by jeyaram-pt4154 on 27/05/21.
//

import UIKit

class TabCell: UICollectionViewCell {
    static let identifier = "TabCell"
    @IBOutlet var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(with title:String){
        self.title.text = title.firstUppercased
        self.backgroundColor = .clear
   
    }

}
