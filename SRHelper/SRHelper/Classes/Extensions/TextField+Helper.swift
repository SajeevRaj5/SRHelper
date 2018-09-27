//
//  TextField+Helper.swift
//  SRHelper
//
//  Created by Sajeev Raj on 9/26/18.
//  Copyright © 2018 Sajeev. All rights reserved.
//

import UIKit

extension UITextField {
    
    func addToolbarAccessoryView(with button: String = "Done", target: Any? = nil, selector: Selector? = nil) {
        
        // configure button
        var buttonDone: UIBarButtonItem
        
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        if target == nil && selector == nil {
            buttonDone = UIBarButtonItem(title: button, style: .done, target: self, action: #selector(barButtonActionDone(sender:)))
        }
        else {
            buttonDone = UIBarButtonItem(title: button, style: .done, target: target, action: selector)
        }
        
        let items = [flexSpace, buttonDone]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        inputAccessoryView = doneToolbar
    }
    
    @objc private func barButtonActionDone(sender: UIBarButtonItem) {
        resignFirstResponder()
    }
}
