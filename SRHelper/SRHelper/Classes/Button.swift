//
//  Button.swift
//  SRHelper
//
//  Created by Sajeev Raj on 9/24/18.
//  Copyright © 2018 Sajeev. All rights reserved.
//

import UIKit

open class Button: UIButton {
    
    @IBInspectable open var cornerRadius: CGFloat = 0.0 {
        didSet {
            configureView()
        }
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        configureView()
    }
    
    private func configureView() {
        layer.cornerRadius = cornerRadius
    }
}
