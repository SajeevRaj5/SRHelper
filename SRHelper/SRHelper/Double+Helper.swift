//
//  Double+Helper.swift
//  SRHelper
//
//  Created by Sajeev Raj on 9/16/18.
//  Copyright © 2018 Sajeev. All rights reserved.
//

import Foundation

extension Double {
    
    func radian() -> Double {
        return self * Double.pi / 180.0
    }
    
    func degree() -> Double {
        return self * 180.0 / Double.pi
    }
    
    func round(toPlaces places: Int = 2) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    
}
