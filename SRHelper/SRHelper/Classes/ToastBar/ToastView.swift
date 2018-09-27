//
//  ToastView.swift
//  SRHelper
//
//  Created by Sajeev Raj on 9/27/18.
//  Copyright © 2018 Sajeev. All rights reserved.
//

import Foundation
import UIKit

public class ToastView: UIView, UIGestureRecognizerDelegate {
    
    var initialViewFrame = CGRect()
    var finalViewFrame   = CGRect()
    let label = UILabel()
    let titleLabel = UILabel()
    
    var timer = Timer()
    let closeButton    = UIButton()
    
    
    static let sharedInstance : ToastView = {
        let instance = ToastView()
        return instance
    }()
    
    public func showAlert(title:String, message:String, closeButtonImage: UIImage?, textFont: UIFont?)
    {
        self.frame = CGRect(x: 0, y: -Constants.height , width: UIScreen.main.bounds.width, height: Constants.height + 17)
        self.backgroundColor =  UIColor.black
        
        finalViewFrame = self.frame
        
        let fontName = ((textFont?.fontName ?? "").isEmpty) ? (textFont?.fontName ?? "") : "Helvetica Neue"
        
        //Apply to the label
        if title != "" {
            let notificationText = title + "\n" + message
            let titleRange = (notificationText as NSString).range(of: title)
            let messageRange = (notificationText as NSString).range(of: message)
            
            let attribute = NSMutableAttributedString.init(string: notificationText)
            attribute.addAttributes([NSAttributedStringKey.font: UIFont(name: fontName, size: 16)!], range: titleRange)
            attribute.addAttributes([NSAttributedStringKey.font: UIFont(name: fontName, size: 14)!], range: messageRange)

            label.attributedText = attribute
        }
        else {
            label.font = UIFont(name: fontName, size: 14)
            label.text = message
        }
        
        setLabelProperties()
        self.addSubview(label)
        
        setCloseButton(buttonImage: closeButtonImage)
        self.addSubview(closeButton)
        UIViewController.topController()?.view.addSubview(self)
        
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(self.handleSwipe(sender:)))
        swipe.delegate = self
        self.addGestureRecognizer(swipe)
        
        var animatedFrame: CGRect = self.frame;
        let screenRect = UIScreen.main.bounds
        animatedFrame.origin.y = screenRect.origin.y
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: { () ->
            Void in
            self.frame = animatedFrame
        }, completion: {
            (value: Bool) in
            self.timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(self.animateToDismissView), userInfo: nil, repeats: false)
        })
        
    }
    
    func setLabelProperties() {
        label.adjustsFontSizeToFitWidth = true
        label.backgroundColor =  UIColor.clear
        label.textColor = UIColor.white
        label.sizeToFit()
        label.numberOfLines = 0
        label.layer.shadowColor = UIColor.gray.cgColor
        label.layer.shadowOffset = CGSize(width: 4, height: 3)
        label.layer.shadowOpacity = 0.3
        label.alpha = 1
        
        if isRTL {
            label.frame = CGRect(x: 6*Constants.leftPadding, y: 0 + UIView.topPadding , width: self.frame.size.width - self.frame.size.height, height: self.frame.size.height)
            label.textAlignment = NSTextAlignment.right
        }
        else {
            label.frame = CGRect(x: Constants.leftPadding, y: 0 + UIView.topPadding , width: self.frame.size.width - self.frame.size.height, height: self.frame.size.height)
            label.textAlignment = NSTextAlignment.left
        }
    }
    
    func setCloseButton(buttonImage: UIImage?) {
        if isRTL {
            closeButton.frame = CGRect(x: Constants.leftPadding, y: Constants.size + UIView.topPadding, width: Constants.size, height: Constants.size)
        }
        else {
            closeButton.frame = CGRect(x: self.frame.size.width - Constants.size - Constants.leftPadding, y: Constants.size + UIView.topPadding, width: Constants.size, height: Constants.size)
        }
        if let image = buttonImage {
            closeButton.setImage(image, for: .normal)
        }
        else {
            closeButton.setTitle("X", for: .normal)
        }
        closeButton.addTarget(self, action: #selector(self.closeButtonTapped(button:)), for: .touchUpInside)
    }
    
    @objc func animateToDismissView() {
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: { () ->
            Void in
            self.frame = self.finalViewFrame
        }, completion: {
            (value: Bool) in
            self.dismissView()
        })
    }
    
    public func dismissView() {
        self.removeFromSuperview()
    }
    
    public static func show( title: String = "", message: String = "", closeButtonImage: UIImage?, textFont: UIFont?) {
        ToastView.sharedInstance.showAlert(title: title, message: message, closeButtonImage: closeButtonImage, textFont: textFont)
    }
    
    // MARK:- Swipe Action
    
    @objc func handleSwipe(sender: UISwipeGestureRecognizer? = nil) {
        UIView.animate(withDuration: 2.0, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1, options: UIViewAnimationOptions.curveEaseIn, animations: { () -> Void in
            self.frame =  self.finalViewFrame
        },  completion: {
            (value: Bool) in
            self.label.text = ""
            self.dismissView()
        })
    }
    
    //MARK:- Button Action
    
    @objc func closeButtonTapped(button: UIButton ) {
        self.timer.invalidate()
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: { () ->
            Void in
            self.frame = self.finalViewFrame
        }, completion: {
            (value: Bool) in
            self.dismissView()
        })
    }
}

extension ToastView {
    struct Constants {
        static let size           = CGFloat(25)
        static let height         = CGFloat(70)
        static let leftPadding    = CGFloat(10)
    }
}
