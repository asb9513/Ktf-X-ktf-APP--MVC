//
//  DarkView.swift
//  Ktf X Ktf APP
//
//  Created by Ahmed Saeed on 6/9/20.
//  Copyright © 2020 Ahmed Saeed. All rights reserved.
//

import Foundation
import Foundation
import UIKit
class DarKView : UIView {
    
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        setupUI()
    }
    
    func setupUI() {
        self.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        self.setLayout(top:      superview?.topAnchor,
                       leading:  superview?.leadingAnchor,
                       trailing: superview?.trailingAnchor,
                       bottom:   superview?.bottomAnchor)
    }
    
    
    
}
