//
//  WeatherCastViewController.swift
//  WandN
//
//  Created by jeyaram-pt4154 on 25/05/21.
//

import UIKit
import CoreLocation

class WeatherCastViewController: UIViewController,CLLocationManagerDelegate{
    let location = CLLocationManager()
    var currentLocation : CLLocation?
    var weeklyView = Weekly()
    var hourlyView = HourlyView()
    
    var current = CurrentView()
    let apiFetch = FetchApi()

    @IBOutlet var weekView: UIView!
    @IBOutlet var hourView: UIView!
    @IBOutlet var currentViews: UIView!
    
    let weatherStoryboard: UIStoryboard = UIStoryboard(name: "Weather", bundle: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        location.delegate = self
        current.delegate = self
        fetchLocation()
        weekView.addInnerView(innerView: weeklyView)
        weekView.addSubview(weeklyView)
        hourView.addInnerView(innerView: hourlyView)
        hourView.addSubview(hourlyView)
        current.frame = CGRect(x: 10, y: 10, width: currentViews.frame.width-20, height: currentViews.frame.height)
        currentViews.addSubview(current)
        view.backgroundColor = Colors.dirtyWhite
        // Do any additional setup after loading the view.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            if let location = locations.first {
                currentLocation = location
                self.location.stopUpdatingLocation()
                requestForWeather(at: location)
            }
        
        }


    func requestForWeather(at location:CLLocation,selectedCountry:String=""){
        let url = location.getUrl(for: .singleCity)
        
        var fetchedData : WeatherResponse?
        apiFetch.request(url: url, completion: {data in
            print("Request")
            do{
                let json = try JSONDecoder().decode(WeatherResponse.self,from:data)
                fetchedData = json
            }catch{
                print("ERRORs")
            }
            guard let fetchedData = fetchedData else{ return }
            self.weeklyView.models = fetchedData.daily
            self.hourlyView.hourlyData = fetchedData.hourly
            print("LAAAT",fetchedData.lat)
           DispatchQueue.main.async {
               self.weeklyView.table.reloadData()
               self.current.setTopView(currentData: fetchedData.current, location: CLLocation(latitude: fetchedData.lat, longitude: fetchedData.lon),country: selectedCountry)
               self.hourlyView.collection.reloadData()
           }
        })
        
//        guard let data = apiFetch.request(url: url) else{return}
//            var json: WeatherResponse?
//            do{
//                json = try JSONDecoder().decode(WeatherResponse.self,from:data)
//            }catch{
//                print("ERRORs")
//            }
//            guard let fetchedData = json else{ return }
//            weeklyView.models = fetchedData.daily
//            hourlyView.hourlyData = fetchedData.hourly
//            DispatchQueue.main.async {
//                self.weeklyView.table.reloadData()
//                self.current.setTopView(currentData: fetchedData.current, location: CLLocation(latitude: fetchedData.lat, longitude: fetchedData.lon))
//                self.hourlyView.collection.reloadData()
//            }
    }
    
    

    
    func fetchLocation(){
        location.requestWhenInUseAuthorization()
        
        let alertController = UIAlertController(title: "Permission Denied", message: "Please go to Settings and turn on the permissions", preferredStyle: .alert)

        let settingsAction = UIAlertAction(title: "Settings", style: .default) { (_) -> Void in
            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                return
            }
            if UIApplication.shared.canOpenURL(settingsUrl) {
                UIApplication.shared.open(settingsUrl, completionHandler: { (success) in })
             }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)

        alertController.addAction(cancelAction)
        alertController.addAction(settingsAction)
        
        switch(location.authorizationStatus) {
            case .authorizedAlways, .authorizedWhenInUse:
                print("Authorize.")
                // get the user location
            case .notDetermined, .restricted, .denied:
                // redirect the users to settings
                self.present(alertController, animated: true, completion: nil)
            @unknown default:
            break
        }
        
        location.startUpdatingLocation()
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            print("Failed to find user's location: \(error.localizedDescription)")
    }
}
extension WeatherCastViewController : currentDelegate{
    
    func opentable(for location: CLLocation) {
        let newController = weatherStoryboard.instantiateViewController(identifier: "LocationController") as LocationController
        
        guard let countryData = fetchAllCountries() else{return }
        let cityNames = countryData.enumerated().map{"\($0.element.name),  \($0.element.country)"}
       
    let cityCoordinates = countryData.enumerated().map{CLLocation(latitude: $0.element.latitude,longitude: $0.element.longitude)}
        newController.tableData=cityNames
        newController.tableIndex = cityCoordinates
        newController.table?.reloadData()
        self.pushController(newController, with: "Select other location")
        
        
        newController.pushLocation = {(location,country) in
            
            self.requestForWeather(at: location,selectedCountry: country)
            print("Final",location)
        }
        
    }
    
    func fetchAllCountries()->Countries?{
        do {
            if let bundlePath = Bundle.main.path(forResource: "countriesCoordinates",
                                                 ofType: "json"),
            let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                do{
                    
                      let countries = try JSONDecoder().decode(Countries.self,from:jsonData)
                    print(countries.count)
                    return countries
                       
                }catch{
                    print("Error in countries")
                }
            }
        }catch{
            print("Error Happened")
        }
        return nil
    }
}
/*
    let cityNames = countries.enumerated().map{"\($0.element.name),  \($0.element.country)"}
let cityCoordinates = countries.enumerated().map{CLLocation(latitude: $0.element.latitude,longitude: $0.element.longitude)}
    DispatchQueue.main.async {
       print(cityNames[0],cityNames[1])
        print(cityCoordinates[0],cityCoordinates[1])
    }

*/
