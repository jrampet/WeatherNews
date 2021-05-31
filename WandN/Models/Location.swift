//
//  Location.swift
//  WandN
//
//  Created by jeyaram-pt4154 on 25/05/21.
//

import Foundation
import CoreLocation
import MapKit


class GPSLocation:NSObject,CLLocationManagerDelegate{
    let locationManager = CLLocationManager()
    var currentLocation : CLLocation?
   
    func fetchLocation(){
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            switch locationManager.authorizationStatus {
                case .notDetermined, .restricted, .denied:
                    print("Denied")
                case .authorizedAlways, .authorizedWhenInUse:
                    print("Access")
                    
                @unknown default:
                break
            }
            } else {
                print("Location services are not enabled")
        }
        locationManager.requestLocation()
        locationManager.startUpdatingLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
     print("Updating")
        if !locations.isEmpty,currentLocation == nil {
            currentLocation = locations.first
            locationManager.stopUpdatingLocation()
            guard let currentLocat = currentLocation else{return}
            currentLocation = currentLocat
            print(currentLocat)
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            print("Failed to find user's location: \(error.localizedDescription)")
        }
    func getLocation()->CLLocation{
        guard let locat = currentLocation else{return CLLocation()}
        return locat
    }
    typealias completionHandler = (_ lat: String, _ lng: String) -> Void
    var completion: completionHandler?
}

extension CLLocation {
    func fetchCityAndCountry(completion: @escaping (_ city: String?, _ country:  String?, _ error: Error?) -> ()) {
        CLGeocoder().reverseGeocodeLocation(self) {
            print($0!)
            completion($0?.first?.locality, $0?.first?.country, $1) }
    }
}


