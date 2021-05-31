//
//  Functions.swift
//  WandN
//
//  Created by jeyaram-pt4154 on 25/05/21.
//

import Foundation

import UIKit
import CoreLocation

extension CLLocation{
    func getUrl(for type:WeatherType)->String{
        let latLong = "&lat=\(self.coordinate.latitude)&lon=\(self.coordinate.longitude)"
        switch(type){
        case .singleCity: return ApiUrl.Single + latLong
        case .cityAround: return ApiUrl.cities + latLong
        }
    }
}
extension Int{
    func getDayForDate(dateFormat:String) -> String{
        let date = Date(timeIntervalSince1970: Double(self))
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        let returnDate = formatter.string(from: date )
        return returnDate
    }
    
    func getTimeForDate(_ cardView:CardView) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm:a"
        let currenDate = Date()
        let currentHour = formatter.string(from: currenDate)
        let date = Date(timeIntervalSince1970: Double(self))
        let returnDate = formatter.string(from: date )
        let currentHourSplit = currentHour.components(separatedBy: ":")
        let returnDateSplit = returnDate.components(separatedBy: ":")
        if(currentHourSplit[0] == returnDateSplit[0] && (currentHourSplit[2] == returnDateSplit[2])){
            cardView.backgroundColor = Colors.shrinePink
            return "Now"
        }
        return returnDate
    }
}

extension String{
    func UTCToLocal() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss" //Input Format
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        let UTCDate = dateFormatter.date(from: formatDate(date:self))
        dateFormatter.dateFormat = "yyyy-MMM-dd hh:mm:a"  //Output Format
        dateFormatter.timeZone = TimeZone.current
        let UTCToCurrentFormat = dateFormatter.string(from: UTCDate!)
        return UTCToCurrentFormat
    }

    func formatDate(date:String)->String{
        var newDate = date.replacingOccurrences(of: "T", with: " ")
        newDate = newDate.replacingOccurrences(of: "Z", with: "")
        return newDate
    }
    func getUrlforWeatherIcon()->String{
        return "http://openweathermap.org/img/wn/" + self + ".png"
    }
}

extension UIImageView {
    func setImage(urlString:String="",url:String=""){
        var urlLink = ""
        if urlString != ""{
            urlLink = "http://openweathermap.org/img/w/" + urlString + ".png";
        }
        if url != ""{
            urlLink = url
        }
        guard let iconurl = URL(string: urlLink) else {
            return
        }
        let data = try? Data(contentsOf: iconurl)

        if let imageData = data {
            let image = UIImage(data: imageData)
           self.image = image
        }
    }
}
extension UIViewController{
    func pushController(_ controller: UIViewController,with title:String){
        controller.title = title
        guard let newController = self.navigationController else { return }
        newController.pushViewController(controller, animated: true)
    }
}
extension UIView{
    func addInnerView(innerView:UIView){
        self.addSubview(innerView)
        
        innerView.translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraint = innerView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let verticalConstraint = innerView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        
        let widthConstraint = innerView.widthAnchor.constraint(equalTo:self.widthAnchor)
        let heightConstraint = innerView.heightAnchor.constraint(equalTo:self.heightAnchor)
        
        let topConstraint = innerView.topAnchor.constraint(equalTo: self.topAnchor)
        let bottomConstraint = innerView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        let leadingConstraint = innerView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        let trailingConstraint = innerView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        
        self.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint,topConstraint,bottomConstraint,leadingConstraint,trailingConstraint])
    }
    
    func register(with identifier:String){
        let xibView = Bundle.main.loadNibNamed(identifier, owner: self)![0] as! UIView
        self.addInnerView(innerView: xibView)
        addSubview(xibView)
    }
    
}
