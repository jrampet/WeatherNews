//
//  ViewController.swift
//  WandN
//
//  Created by jeyaram-pt4154 on 25/05/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var newsButton: UIButton!
    @IBOutlet var weatherButton: UIButton!
    let newsStoryboard: UIStoryboard = UIStoryboard(name: "News", bundle: nil)
    let weatherStoryboard: UIStoryboard = UIStoryboard(name: "Weather", bundle: nil)
    @IBAction func onClick(_ sender: UIButton) {
        switch(sender.tag){
        case 0: let controller = weatherStoryboard.instantiateViewController(identifier: "WeatherCastViewController")
            pushController(controller, with: "Weather")
        case 1: let controller = newsStoryboard.instantiateViewController(withIdentifier: "NewsViewController") as! NewsViewController
            pushController(controller, with: "News")
        default: return
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsButton.roundedCorner(color: Colors.shrinePink)
        weatherButton.roundedCorner(color: Colors.brazilGreen)
        // Do any additional setup after loading the view.
    }
  
    
}

extension UIButton{
    func roundedCorner(color:UIColor){
        self.layer.shadowColor = Colors.shadowColor.cgColor
        self.layer.shadowOffset = CGSize(width: 1.0, height: 2.0)
        self.backgroundColor = color
        self.layer.shadowOpacity = 1.0
        self.layer.cornerRadius = 15
    }
}

/*
 let controller = WeatherCastViewController(nibName: "WeatherCastViewController", bundle: nil)
     pushViewController(controller, with: "Weather")
 */

//let controller = weatherStoryboard.instantiateViewController(identifier: "WeatherCastViewController")
