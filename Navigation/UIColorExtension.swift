//
//  UIColorExtension.swift
//  Navigation
//
//  Created by Никита Васильев on 18.04.2023.
//

import Foundation
import UIKit

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0x48,
           green: (rgb >> 8) & 0x85,
           blue: rgb & 0xCC
       )
   }
}

let color = UIColor(red: 0x48, green: 0x85, blue: 0xCC)
