//
//  ColorExtensions.swift
//  UsefulFramework
//
//  Created by Alexander Slobodjanjuk on 08.05.2018.
//  Copyright © 2018 Slobodyanyuk Alexander. All rights reserved.
//

import Foundation
import UIKit

public typealias Color = UIColor


//MARK: - UIColor init -
//***************************************************


public extension Color {
    
    
    public convenience init?(red: Int, green: Int, blue: Int, transparency: CGFloat = 1) {
        guard red >= 0 && red <= 255 else { return nil }
        guard green >= 0 && green <= 255 else { return nil }
        guard blue >= 0 && blue <= 255 else { return nil }
        
        var trans = transparency
        if trans < 0 { trans = 0 }
        if trans > 1 { trans = 1 }
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: trans)
    }
    
    
    // Parameters:
    // - hex: hex Int (example: 0xDECEB5).
    // - transparency: optional transparency value (default is 1).
    public convenience init?(hex: Int, transparency: CGFloat = 1) {
        var trans = transparency
        if trans < 0 { trans = 0 }
        if trans > 1 { trans = 1 }
        
        let red = (hex >> 16) & 0xff
        let green = (hex >> 8) & 0xff
        let blue = hex & 0xff
        self.init(red: red, green: green, blue: blue, transparency: trans)
    }
}


//MARK: - UIColor  -
//***************************************************


public extension Color {
    
    public static var random: Color {
        
        let red = Int(arc4random_uniform(255))
        let green = Int(arc4random_uniform(255))
        let blue = Int(arc4random_uniform(255))
        return self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1)
    }
    
}


//MARK: - CGColor  -
//***************************************************


public extension CGColor {
    
    public var uiColor: UIColor? {
        return UIColor(cgColor: self) }
    
}
