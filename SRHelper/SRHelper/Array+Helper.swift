//
//  Array+Helper.swift
//  SRHelper
//
//  Created by Sajeev Raj on 9/6/18.
//  Copyright © 2018 Sajeev. All rights reserved.
//

import Foundation

extension Array where Element: Equatable {
    
    static func -(lhs: inout Array, rhs: Array) -> Array {
        return lhs.filter{ !rhs.contains( $0 ) }
    }
    
    func removeDuplicates() -> [Element] {
        var result: [Element] = []
        for value in self {
            if !result.contains(value) {
                result.append(value)
            }
        }
        return result
    }
    
    mutating func unique() {
        var result: [Element] = []
        for value in self {
            if !result.contains(value) {
                result.append(value)
            }
        }
        self = result
    }

}
