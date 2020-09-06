//
//  RoundView.swift
//  Ktf X Ktf APP
//
//  Created by Ahmed Saeed on 6/9/20.
//  Copyright © 2020 Ahmed Saeed. All rights reserved.
//

import Foundation
import UIKit
// Theres is a Mark allocated for each group fo views to help you reading this Code, enjoy Coding ^_^
//MARK: 1- ImageView Classes
@IBDesignable class RoundedImageView: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.masksToBounds = true
        layer.cornerRadius  = 10
    }
}


@IBDesignable class CircularImageView: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.clipsToBounds      = true
        self.layer.cornerRadius = self.bounds.size.height/2.0
    }
}


//MARK: 2- Button Classes
@IBDesignable class RoundedButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.masksToBounds = true
        layer.cornerRadius  = layer.frame.size.height*0.149
        self.titleLabel?.adjustsFontSizeToFitWidth = true
        self.titleLabel?.minimumScaleFactor        = 0.5
    }
}


@IBDesignable class CircularButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.masksToBounds = true
        layer.cornerRadius  = layer.frame.size.height/2
        self.titleLabel?.adjustsFontSizeToFitWidth = true
        self.titleLabel?.minimumScaleFactor        = 0.5
        
    }
}



class ButtonWithText:UIButton{
    override func layoutSubviews() {
        super.layoutSubviews()
        self.titleLabel?.adjustsFontSizeToFitWidth = true
        self.titleLabel?.minimumScaleFactor        = 0.5
    }
}





//MARK: 3- View Classes
@IBDesignable class RoundedView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.masksToBounds = true
        layer.cornerRadius  = 10
    }
}


@IBDesignable class CircularView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.clipsToBounds      = true
        self.layer.cornerRadius = self.bounds.size.height/2.0
    }
}


@IBDesignable class CardView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.masksToBounds = true
        layer.cornerRadius  = 10
        layer.shadowColor   = UIColor.gray.cgColor
        layer.shadowOffset  = CGSize(width: 0.0, height: 0.0)
        layer.shadowRadius  = 12.0
        layer.shadowOpacity = 0.7
    }
}




//MARK: 4- UILabel Classes

class RoundedLabel:UILabel {
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius  = 10
        layer.masksToBounds = true
    }
}



class RoundedTextView:UITextView{
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius  = 10
        layer.masksToBounds = true
    }
}


class RoundedTableView:UITableView{
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius  = 10
        layer.masksToBounds = true
    }
}





