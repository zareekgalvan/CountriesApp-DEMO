//
//  UIColor+Extension.swift
//  CountriesApp
//
//  Created by Cesar Armando on 11/11/19.
//  Copyright © 2019 Cesar Armando. All rights reserved.
//

import UIKit

extension UIColor {
    class func appColor() -> UIColor {
        return UIColor(red:0.04, green:0.79, blue:0.83, alpha:1.0)
    }
    class func getBackgroundColorApp() -> UIColor {
        return UIColor(red: 28/255.0, green: 35/255.0, blue: 61/255.0, alpha: 1.0)
    }
    
    class func getDisableTextColor() -> UIColor {
        return UIColor(red: 213/255.0, green: 213/255.0, blue: 213/255.0, alpha: 1.0)
    }
    
    class func getTextColor() -> UIColor {
        return UIColor(red: 0/255.0, green: 143/255.0, blue: 241/255.0, alpha: 1.0)
    }
    
    class func getHeaderColor() -> UIColor {
        return UIColor(red: 230/255.0, green: 231/255.0, blue: 234/255.0, alpha: 1.0)
    }
    
    class func getSettingsTextColor() -> UIColor {
        return UIColor(red: 88/255.0, green: 93/255.0, blue: 102/255.0, alpha: 1.0)
    }
    
    class func getSettingsBackgroundColor() -> UIColor {
        return UIColor(red: 238/255.0, green: 239/255.0, blue: 243/255.0, alpha: 1.0)
    }
}
