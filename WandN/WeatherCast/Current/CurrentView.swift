//
//  CurrentView.swift
//  WandN
//
//  Created by jeyaram-pt4154 on 26/05/21.
//

import UIKit
import CoreLocation

class CurrentView: UIView {

    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var TempLabel: UILabel!
    @IBOutlet var labelToday: UILabel!
    @IBOutlet var imageIcon: UIImageView!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        let xibView = Bundle.main.loadNibNamed("CurrentView", owner: self, options: nil)![0] as! UIView
        xibView.frame = self.bounds
        addSubview(xibView)
        
    }
    
    func setTopView(currentData:Current,location:CLLocation){
        imageIcon.setImage(urlString: currentData.weather[0].icon)
        self.labelToday.text = currentData.dt.getDayForDate(dateFormat: "E, MMM d")
        self.TempLabel.text = "\(Int(currentData.temp))\(current.temperature.unit())"
        self.TempLabel.textColor = UIColor.systemPurple
        location.fetchCityAndCountry { [self] city, country, error in
            guard let city = city, let country = country, error == nil else { return }
            let selectedCity = "\(city), \(country)"
            self.locationLabel.text = selectedCity
        }
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        tapRecognizer.numberOfTapsRequired = 1
        tapRecognizer.numberOfTouchesRequired = 1
        locationLabel.addGestureRecognizer(tapRecognizer)
        
    }
    @objc func handleTap(sender: UITapGestureRecognizer){
        print("SDF")
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
