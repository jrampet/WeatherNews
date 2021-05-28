//
//  CollectionViewCell.swift
//  WandN
//
//  Created by jeyaram-pt4154 on 26/05/21.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet var card: CardView!
    @IBOutlet var tempLabel: UILabel!
    @IBOutlet var hourLabel: UILabel!
    @IBOutlet var iconImage: UIImageView!
    
    static let identifier = "CollectionViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.cornerRadius = 10
        card.backgroundColor = Colors.dirtyWhite
    }
    func configure(with hourData:Current){
        self.iconImage.setImage(urlString: hourData.weather[0].icon)
        self.hourLabel.text = getTimeForDate(hourData.dt,card)
        self.tempLabel.text = "\(Int(hourData.temp))\(current.temperature.unit())"
        
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        card.backgroundColor = Colors.dirtyWhite
    }
}
