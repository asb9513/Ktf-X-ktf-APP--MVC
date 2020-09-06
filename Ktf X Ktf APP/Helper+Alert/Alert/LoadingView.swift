//
//  LoadingView.swift
//  Ktf X Ktf APP
//
//  Created by Ahmed Saeed on 6/9/20.
//  Copyright © 2020 Ahmed Saeed. All rights reserved.
//

import Foundation
import UIKit
class LoadingView: RoundedView {
    
    let successIcon        = UIImageView()
    let activityIndicator  = UIActivityIndicatorView()
    var viewWidth:CGFloat  {return UIScreen.main.bounds.width  * 0.5}
    var viewHeight:CGFloat {return UIScreen.main.bounds.height * 0.1}
    
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        if let _ = self.superview {
            setupView()
            setupActivityIndicator()
        }
    }
    
    
    func setupView(){
        self.setLayout(centerX: superview!.centerXAnchor,
                       centerY: superview!.centerYAnchor,
                       width:   viewHeight,
                       height:  viewHeight)
        self.backgroundColor =  UIColor(red: 79.0/255.0, green: 165.0/255.0, blue: 100.0/255.0, alpha: 1)
    }
    
    
    func setupActivityIndicator(){
        self.addSubview(activityIndicator)
        activityIndicator.setLayout(centerX: self.centerXAnchor,
                                    centerY: self.centerYAnchor,
                                    width:   viewHeight/2,
                                    height:  viewHeight/2)
        activityIndicator.transform        = CGAffineTransform(scaleX: 1.2, y: 1.2)
        activityIndicator.style = .whiteLarge
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
    }
    
}

