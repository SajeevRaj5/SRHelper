//
//  ViewController+Helper.swift
//  SRHelper
//
//  Created by Sajeev Raj on 9/26/18.
//  Copyright © 2018 Sajeev. All rights reserved.
//


extension UIViewController {
    
    // find top most view controller
    class func topController() -> UIViewController? {
        
        // recursive follow
        func follow(_ from:UIViewController?) -> UIViewController? {
            if let to = (from as? UITabBarController)?.selectedViewController {
                return follow(to)
            } else if let to = (from as? UINavigationController)?.visibleViewController {
                return follow(to)
            } else if let to = from?.presentedViewController {
                return follow(to)
            }
            return from
        }
        
        // root
        let root = UIApplication.shared.keyWindow?.rootViewController
        
        return follow(root)
    }
    
    private var name: String {
        return NSStringFromClass(classForCoder).components(separatedBy: ".").last ?? title ?? ""
    }
    
}
