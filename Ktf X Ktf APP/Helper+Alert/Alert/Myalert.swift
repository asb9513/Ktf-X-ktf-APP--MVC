//
//  Myalert.swift
//  Ktf X Ktf APP
//
//  Created by Ahmed Saeed on 6/9/20.
//  Copyright © 2020 Ahmed Saeed. All rights reserved.
//

import Foundation
import UIKit
class MyAlert : RoundedView {
    
    let myLable  = UILabel()
    let myButton = RoundedButton ()
    var goBack:Bool!
    
    var myHeight : CGFloat { return ceil(UIScreen.main.bounds.height * 0.25) }
    var myWidth  : CGFloat { return ceil(UIScreen.main.bounds.width  * 0.8) }
    
    
    func setupMe(myText:String, goBack:Bool?=nil){
        
        self.backgroundColor = UIManager.shared.appColor
        
        [myLable, myButton].forEach { self.addSubview($0) }
        myLable.setLayout(top:      self.topAnchor, paddingTop: 5,
                          leading:  self.leadingAnchor, paddingLeading: 5,
                          trailing: self.trailingAnchor, paddingTrailing: 5,
                          height:   ceil(self.myHeight * 0.65))
        
        myLable.text = myText
        myLable.backgroundColor = .clear
        myLable.textColor       = .white
        myLable.font            = UIFont(name: "Cairo", size: 17)
        myLable.textAlignment   = .center
        myLable.lineBreakMode   = .byWordWrapping
        myLable.numberOfLines   = 0
        myLable.adjustsFontSizeToFitWidth = true
        
        
        myButton.setLayout(top:     self.myLable.bottomAnchor, paddingTop: 15,
                           bottom:  self.bottomAnchor, paddingBottom: 10,
                           centerX: self.centerXAnchor,
                           width:   ceil(self.myWidth*0.7))
        
        
        myButton.backgroundColor = .white
        myButton.setTitleColor(UIManager.shared.appColor, for: .normal)
        myButton.setTitle("حسنا", for: .normal)
        myButton.titleLabel?.font = UIFont(name: "Cairo-Bold", size: 20)
        myButton.isEnabled = true
        
        if goBack == true {
            myButton.addTarget(self, action: #selector(self.doneTapped2(sender:)), for: .touchUpInside)
        }
        else{
            myButton.addTarget(self, action: #selector(self.doneTapped(sender:)), for: .touchUpInside)
        }
        
    }
    
    
    @objc func doneTapped(sender: AnyObject){
        DispatchQueue.main.async {
            UIView.transition(with: self.parentVC!.view, duration: 0.5, options: .transitionCrossDissolve, animations: nil, completion: nil)
            UIManager.shared.darkView.removeFromSuperview()
            self.removeFromSuperview()
        }
    }
    
    
    @objc func doneTapped2(sender: AnyObject){
        DispatchQueue.main.async {
            UIView.transition(with: self.parentVC!.view, duration: 0.5, options: .transitionCrossDissolve, animations: nil, completion: nil)
            self.parentVC?.navigationController?.popViewController(animated: false)
            UIManager.shared.darkView.removeFromSuperview()
            self.removeFromSuperview()
        }
        
    }
    
    
}

extension String {
    public var withoutHtml: String {
        guard let data = self.data(using: .utf8) else {
            return self
        }
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue]
        guard let attributedString = try? NSAttributedString(data: data, options: options, documentAttributes: nil) else {
            return self
        }
        let str = attributedString.string.replacingOccurrences(of: "  ", with: "", options: .regularExpression, range: nil)
        return str.replacingOccurrences(of: "\n\n", with: "", options: .regularExpression, range: nil)
    }
}


extension UIView {
    // Create image snapshot of view.
    func snapshot(of rect: CGRect? = nil) -> UIImage {
        return UIGraphicsImageRenderer(bounds: rect ?? bounds).image { _ in
            drawHierarchy(in: bounds, afterScreenUpdates: true)
        }
    }
}

extension UIImageView {
    func enableZoom() {
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(startZooming(_:)))
        isUserInteractionEnabled = true
        addGestureRecognizer(pinchGesture)
        pinchGesture.scale = 1
    }
    
    @objc
    private func startZooming(_ sender: UIPinchGestureRecognizer) {
        let scaleResult = sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale)
        guard let scale = scaleResult, scale.a > 1, scale.d > 1 else { return }
        sender.view?.transform = scale
        sender.scale = 1
    }
}



extension UIView {
    var parentVC: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}



 
