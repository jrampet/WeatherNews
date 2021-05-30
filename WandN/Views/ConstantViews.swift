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
    static let shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25)
    static let skyblue = UIColor(rgb: 0xb7e1fc)
  
}

extension UIColor{
    convenience init(red: Int, green: Int, blue: Int,alpha: CGFloat) {
           self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
       }
    convenience init(rgb: Int) {
           self.init(
               red: (rgb >> 16) & 0xFF,
               green: (rgb >> 8) & 0xFF,
               blue: rgb & 0xFF,
                alpha:1.0
           )
    }
    
}
