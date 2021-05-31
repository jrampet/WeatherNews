//
//  WeatherCell.swift
//  WandN
//
//  Created by jeyaram-pt4154 on 25/05/21.
//

import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet var dayLabel: UILabel!
    @IBOutlet var TempLabel: UILabel!
    @IBOutlet var descriptLabel : UILabel!
    @IBOutlet var weatherImage : UIImageView!
    
    var imageLoader = ImageLoader()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with model : Daily){
        self.TempLabel.text = "\(Int(model.temp.max))° / \(Int(model.temp.min)) \(current.temperature.unit())"
        self.dayLabel.text =  model.dt.getDayForDate(dateFormat: "E")
        self.descriptLabel.text = model.weather[0].weatherDescription.rawValue.capitalized
//        weatherImage.setImage(urlString: model.weather[0].icon)
        
        let urlImage = model.weather[0].icon.getUrlforWeatherIcon()
            imageLoader.obtainImageWithPath(imagePath: urlImage) { (image) in
                self.weatherImage.image = image
            }
        
        self.TempLabel.contentMode = .scaleAspectFit
        self.descriptLabel.contentMode = .scaleAspectFit
        self.selectionStyle = .none
        self.backgroundColor = UIColor.clear
        self.contentView.backgroundColor = .clear
        
    }
    
}
