//
//  View+Helper.swift
//  SRHelper
//
//  Created by Sajeev Raj on 9/20/18.
//  Copyright © 2018 Sajeev. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func addShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize = CGSize(width: -1, height: 1), radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    func animate(direction: AnimationDirection, duration: CGFloat = 1.5, delay: CGFloat = 0.05) {
        transform = direction.transform()
        
        UIView.animate(withDuration: 1.25, delay: 0.05, options: .curveEaseInOut, animations: {
            self.transform = CGAffineTransform.identity
        }, completion: nil)
    }
    
    func animateAllSubViews(direction: AnimationDirection, duration: CGFloat = 1.5, delay: CGFloat = 0.05) {
        var delayCount: CGFloat = 0.0
        
        subviews.forEach { (view) in
            view.animate(direction: direction, duration:duration, delay: CGFloat(delayCount * delay))
            delayCount += 2
        }
    }
    
    enum AnimationDirection {
        case bottom
        case top
        case left
        case right
        
        func transform() -> CGAffineTransform {
            switch self {
            case .bottom: return CGAffineTransform(translationX: 0, y: UIScreen.main.bounds.height)
            case .top:    return CGAffineTransform(translationX: 0, y: -UIScreen.main.bounds.height)
            case .left:   return CGAffineTransform(translationX: -UIScreen.main.bounds.width, y: 0)
            case .right:  return CGAffineTransform(translationX: UIScreen.main.bounds.width, y: 0)
            }
        }
    }
}
