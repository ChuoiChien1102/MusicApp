//
//  UIColor+.swift
//  RingtoneZ
//
//  Created by ChuoiChien on 5/10/19.
//  Copyright © 2019 ChuoiChien. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    convenience init(hex: String) {
        self.init(hex: hex, alpha:1)
    }
    
    convenience init(hex: Int, alpha colorAlpha: Double = 1.0) {
        let r = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((hex & 0x00FF00) >> 8) / 255.0
        let b = CGFloat(hex & 0x0000FF) / 255.0
        self.init(red: r, green: g, blue: b, alpha: CGFloat(colorAlpha))
    }
    
    convenience init(hex: String, alpha: CGFloat) {
        var hexWithoutSymbol = hex
        if hexWithoutSymbol.hasPrefix("#") {
            hexWithoutSymbol = hex.substring(1)
        }
        
        let scanner = Scanner(string: hexWithoutSymbol)
        var hexInt:UInt32 = 0x0
        scanner.scanHexInt32(&hexInt)
        
        var r:UInt32!, g:UInt32!, b:UInt32!
        switch (hexWithoutSymbol.length) {
        case 3: // #RGB
            r = ((hexInt >> 4) & 0xf0 | (hexInt >> 8) & 0x0f)
            g = ((hexInt >> 0) & 0xf0 | (hexInt >> 4) & 0x0f)
            b = ((hexInt << 4) & 0xf0 | hexInt & 0x0f)
            break;
        case 6: // #RRGGBB
            r = (hexInt >> 16) & 0xff
            g = (hexInt >> 8) & 0xff
            b = hexInt & 0xff
            break;
        default:
            // TODO:ERROR
            break;
        }
        
        self.init(
            red: (CGFloat(r)/255),
            green: (CGFloat(g)/255),
            blue: (CGFloat(b)/255),
            alpha:alpha)
    }
    
    static func blackTextColor() -> UIColor {
        return UIColor.init(hex: 0x000000, alpha: 0.87)
    }
    
    static func backgroundViewColor() -> UIColor {
        return UIColor.init(hex: 0x0D47A1, alpha: 1)
    }
    
    static func mainBackgroundColor() -> UIColor {
        return UIColor.init(hex: 0x0D47A1, alpha: 1)
    }
    
    static func boldTextColor() -> UIColor {
        return UIColor.init(hex: 0x0C1942)
    }
    
    static func regularTextColor() -> UIColor {
        return UIColor.init(hex: 0x005197)
    }
    
    static func grayTextColor() -> UIColor {
        return UIColor.init(hex: 0x74849C)
    }
    
    static func greenStatusColor() -> UIColor {
        return UIColor.init(hex: 0x13AE48)
    }
    
    static func redStatusColor() -> UIColor {
        return UIColor.init(hex: 0xEB5757)
    }
    
    static func orangeStatusColor() -> UIColor {
        return UIColor.init(hex: 0xFCA52B)
    }
    
    static func tabbarColor() -> UIColor {
        return UIColor.init(hex: 0x0F0742)
    }
}

