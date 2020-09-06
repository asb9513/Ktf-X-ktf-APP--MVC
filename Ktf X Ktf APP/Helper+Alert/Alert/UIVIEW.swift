//
//  UIVIEW.swift
//  Ktf X Ktf APP
//
//  Created by Ahmed Saeed on 6/9/20.
//  Copyright © 2020 Ahmed Saeed. All rights reserved.
//

import Foundation
import UIKit
extension UIView{
    //to AutoLAyout UIKit items Programmatically
    func setLayout( top:      NSLayoutYAxisAnchor? = nil, paddingTop:     CGFloat?  = 0,
                    leading:  NSLayoutXAxisAnchor? = nil, paddingLeading: CGFloat?  = 0,
                    trailing: NSLayoutXAxisAnchor? = nil, paddingTrailing:CGFloat?  = 0,
                    bottom:   NSLayoutYAxisAnchor? = nil, paddingBottom:  CGFloat?  = 0,
                    centerX:  NSLayoutXAxisAnchor? = nil,
                    centerY:  NSLayoutYAxisAnchor? = nil,
                    width:    CGFloat?             = nil,
                    height:   CGFloat?             = nil) {
        
        translatesAutoresizingMaskIntoConstraints=false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop!).isActive=true
        }
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: paddingLeading!).isActive=true
        }
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -paddingTrailing!).isActive=true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom!).isActive=true
        }
        if let centerX = centerX{
            centerXAnchor.constraint(equalTo: centerX).isActive = true
        }
        if let centerY = centerY{
            centerYAnchor.constraint(equalTo: centerY).isActive = true
        }
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive=true
        }
        if let width = width{
            widthAnchor.constraint(equalToConstant: width).isActive=true
        }
    }
    
}



