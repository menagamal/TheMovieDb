
//
//  UIColor+Extentions.swift
//  TheMovieDb
//
//  Created by Mena Gamal on 8/22/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation
import UIKit
extension UIColor {
    //APP COLOR
    @nonobjc class var AppColor: UIColor {
        return UIColor(hexString: "#AF4747")
    }
    //MARK:- Naviagation
    @nonobjc class var NavigationTextColor:UIColor{
      return .white
    }
//
    //MARK:- TextField
    @nonobjc class var TextFiledActiveLine: UIColor {
        return UIColor(red: 241.0 / 255.0, green: 90.0 / 255.0, blue: 36.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var TextFiledActivePlaceholder: UIColor {
        return UIColor(red: 241.0 / 255.0, green: 90.0 / 255.0, blue: 36.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var TextFieldUnActiveLine: UIColor {
        return UIColor(white: 222.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var TextFieldUnActivePlaceholder: UIColor {
        return UIColor(white: 222.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var TextFieldText: UIColor {
        return UIColor(hexString: "#303030")
    }
    @nonobjc class var TextFiledActiveBorder: UIColor {
        return UIColor.AppColor
    }
    @nonobjc class var TextFiledUnActiveBorder: UIColor {
        return UIColor(white: 222.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var SegmentedSelectedText: UIColor {
         return UIColor(white: 133.0 / 255.0, alpha: 1.0)
    }
    
    //TabBar
    @nonobjc class var TabBarBackgroundColor: UIColor {
        return UIColor(hexString: "#1B2938")
    }
    @nonobjc class var TabBarSelectedItemColor: UIColor {
        return UIColor.AppColor
    }
    
    //Button
    @nonobjc class var ButtonTextColor: UIColor {
        return UIColor.white
    }
    @nonobjc class var ButtonBackgroundColor: UIColor {
        return UIColor.AppColor
    }
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}

