//
//  Utils.swift
//  UsefulFramework
//
//  Created by Alexander Slobodjanjuk on 08.05.2018.
//  Copyright © 2018 Slobodyanyuk Alexander. All rights reserved.
//

import Foundation

public class Utils {
    
    private init() {}
    
    public static func delay(delay: Double, closure: @escaping() -> ()) {
        
        "asdasd".localized()
        
        DispatchQueue.main.asyncAfter(deadline: (.now() + delay)) {
            closure()
        }
    }
}
