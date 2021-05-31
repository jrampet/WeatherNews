//
//  CurrentView.swift
//  WandN
//
//  Created by jeyaram-pt4154 on 26/05/21.
//

import UIKit
import CoreLocation
protocol currentDelegate: AnyObject{
    func opentable(for location:CLLocation)
}
class CurrentView: UIView {

    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var TempLabel: UILabel!
    @IBOutlet var labelToday: UILabel!
    @IBOutlet var imageIcon: UIImageView!
    weak var delegate : currentDelegate?
    var currentLocation : CLLocation?
    override init(frame: CGRect){
        super.init(frame: frame)
        self.register(with: "CurrentView")
        
    }
    
    func setTopView(currentData:Current,location:CLLocation,country:String=""){
        currentLocation = location
        imageIcon.setImage(urlString: currentData.weather[0].icon)
        self.labelToday.text = currentData.dt.getDayForDate(dateFormat: "E, MMM d")
        self.TempLabel.text = "\(Int(currentData.temp))\(current.temperature.unit())"
        self.TempLabel.textColor = UIColor.systemPurple
        if country != ""{
            self.locationLabel.text = country
        }else{
            location.fetchCityAndCountry { [self] city, country, error in
                guard let city = city, let country = country, error == nil else { return }
                let selectedCity = "\(city), \(country)"
                self.locationLabel.text = selectedCity
            }
        }
        
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(sender:)))
        locationLabel.isUserInteractionEnabled = true
        locationLabel.addGestureRecognizer(tapRecognizer)
        
    }
    @objc func handleTap(sender: UITapGestureRecognizer){
        guard let returnLocation = currentLocation else{return }
        delegate?.opentable(for: returnLocation)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
