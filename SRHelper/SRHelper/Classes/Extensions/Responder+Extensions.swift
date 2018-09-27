//
//  Responder+Extensions.swift
//  SRHelper
//
//  Created by Sajeev Raj on 9/26/18.
//  Copyright © 2018 Sajeev. All rights reserved.
//

import UIKit

extension UIResponder {
    static var identifier: String {
        return "\(self)"
    }
    
    var isRTL: Bool {
        return (UIApplication.shared.userInterfaceLayoutDirection == UIUserInterfaceLayoutDirection.rightToLeft)
    }
}
