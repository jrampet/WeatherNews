//
//  Functions.swift
//  WandN
//
//  Created by jeyaram-pt4154 on 25/05/21.
//

import Foundation

import UIKit
func generateURL(with lat:Double, and long: Double,for type:url)->String{
//        lat=8.699525&lon=77.516735
    switch(type){
    case .cityAround :  return "https://api.openweathermap.org/data/2.5/find?lat=\(lat)&lon=\(long)&cnt=50&appid=3540e704b9a91cce081155a9f4acefc6"
    case .singleCity :
        return "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(long)&exclude=minutely&units=metric&appid=3540e704b9a91cce081155a9f4acefc6"
    }
}
func getDayForDate(_ inputDate: Int) -> String{
    let date = Date(timeIntervalSince1970: Double(inputDate))
    let formatter = DateFormatter()
    formatter.dateFormat = "E"
    let returnDate = formatter.string(from: date )
    return returnDate
}

func getDateForDate(_ inputDate: Int) -> String{
    let formatter = DateFormatter()
    formatter.dateFormat = "E, MMM d"
    let date = Date(timeIntervalSince1970: Double(inputDate))
    
    let returnDate = formatter.string(from: date )
    
    return returnDate
}
func getTimeForDate(_ inputDate: Int,_ cardView:CardView) -> String{
    let formatter = DateFormatter()
    formatter.dateFormat = "h:mm:a"
    let currenDate = Date()
    let currentHour = formatter.string(from: currenDate)
    let date = Date(timeIntervalSince1970: Double(inputDate))
    let returnDate = formatter.string(from: date )
    let currentHourSplit = currentHour.components(separatedBy: ":")
    let returnDateSplit = returnDate.components(separatedBy: ":")
    if(currentHourSplit[0] == returnDateSplit[0] && (currentHourSplit[2] == returnDateSplit[2])){
        cardView.backgroundColor = Colors.shrinePink
        return "Now"
    }
    return returnDate
}

func UTCToLocal(UTCDateString: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss" //Input Format
    dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
    let UTCDate = dateFormatter.date(from: formatDate(date:UTCDateString))
    dateFormatter.dateFormat = "yyyy-MMM-dd hh:mm:ss:a" // Output Format
    dateFormatter.timeZone = TimeZone.current
    let UTCToCurrentFormat = dateFormatter.string(from: UTCDate!)
    return UTCToCurrentFormat
}

func formatDate(date:String)->String{
    var newDate = date.replacingOccurrences(of: "T", with: " ")
    newDate = newDate.replacingOccurrences(of: "Z", with: "")
    return newDate
}

extension StringProtocol {
    var firstUppercased: String { prefix(1).uppercased() + dropFirst() }
    var firstCapitalized: String { prefix(1).capitalized + dropFirst() }
}

extension UIImageView {
    func setImage(urlString:String){
        let iconurl = "http://openweathermap.org/img/w/" + urlString + ".png";
        guard let iconurl = URL(string: iconurl) else {
            return
        }
        let data = try? Data(contentsOf: iconurl)

        if let imageData = data {
            let image = UIImage(data: imageData)
           self.image = image
        }
    }
    func setImage(urlLink:String){
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
