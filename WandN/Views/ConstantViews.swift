//
//  Constants.swift
//  WandN
//
//  Created by jeyaram-pt4154 on 25/05/21.
//

import UIKit
struct Colors{

    static let shrinePink = UIColor(rgb: 0xFEDBD0)
    static let brazilGreen = UIColor(rgb: 0xB9E4C9)
//    static let yellowColor = UIColor(rgb: 0xF1CE60)
    static let yellowColor = UIColor(rgb: 0xF5DD7B)
    static let dirtyWhite = UIColor(rgb: 0xF5F5F5)
    static let shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
    static let skyblue = UIColor(rgb: 0xb7e1fc)
    
}
extension UIColor{
    convenience init(red: Int, green: Int, blue: Int) {
           assert(red >= 0 && red <= 255, "Invalid red component")
           assert(green >= 0 && green <= 255, "Invalid green component")
           assert(blue >= 0 && blue <= 255, "Invalid blue component")

           self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
       }
    convenience init(rgb: Int) {
           self.init(
               red: (rgb >> 16) & 0xFF,
               green: (rgb >> 8) & 0xFF,
               blue: rgb & 0xFF
           )
    }
    
}
