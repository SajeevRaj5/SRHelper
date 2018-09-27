//
//  URL+Helper.swift
//  SRHelper
//
//  Created by Sajeev Raj on 9/27/18.
//  Copyright © 2018 Sajeev. All rights reserved.
//

import Foundation

extension Foundation.URL {

    var isLocalURL: Bool {
        return self.absoluteString.hasPrefix("file")
    }
    
}
