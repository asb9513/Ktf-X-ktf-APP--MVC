//
//  ManagerAlert.swift
//  Ktf X Ktf APP
//
//  Created by Ahmed Saeed on 6/9/20.
//  Copyright © 2020 Ahmed Saeed. All rights reserved.
//

import Foundation
import UIKit
class UIManager{
    
    static let shared = UIManager()
    
    enum FollowState { case following ; case followers }
    enum controlView { case show      ; case hide}
    enum ediType     { case pic       ; case cover}
    
    var followMe      = "تابعني"
    var followDone    = "تمت المتابعة"
    
    var appColor:UIColor{ return UIColor(red: 79.0/255.0, green: 165.0/255.0, blue: 100.0/255.0, alpha: 1)}
    var myHeight:CGFloat{ return ceil (UIScreen.main.bounds.height)}
    var myWidth:CGFloat { return ceil (UIScreen.main.bounds.width)}
    
    var editingType:ediType = .pic
    var newCover:UIImage!
    var newImg:UIImage!
    var imageToEdit : UIImage!
    let loadingView = LoadingView()
    let myAlert     = MyAlert()
    let darkView    = DarKView()
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    
    
    func updatelFollowButton(For FollowButton:UIButton, toggle:Bool){
        
        var title    = ""
        var newtitle = ""
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.5, animations: {
                let currentTitle = FollowButton.title(for: .normal) ?? ""
                newtitle = currentTitle == self.followDone ? self.followMe:self.followDone
                title    = toggle ? newtitle : currentTitle
                
                FollowButton.setTitle(title, for: .normal)
                FollowButton.titleLabel?.adjustsFontSizeToFitWidth = true
                FollowButton.titleLabel?.minimumScaleFactor       = 0.5
                
                if title == UIManager.shared.followMe{
                    FollowButton.setTitleColor(self.appColor, for: .normal)
                    FollowButton.backgroundColor   = .white
                    FollowButton.layer.borderWidth = 2.0
                    FollowButton.layer.borderColor = self.appColor.cgColor
                }
                else if title == self.followDone{
                    FollowButton.setTitleColor(.white, for: .normal)
                    FollowButton.backgroundColor   = self.appColor
                    FollowButton.layer.borderWidth = 2.0
                    FollowButton.layer.borderColor = self.appColor.cgColor
                }
                else if title == "k" {
                    FollowButton.setTitleColor(.white, for: .normal)
                    FollowButton.backgroundColor = .white
                    FollowButton.layer.borderWidth = 0.0
                    FollowButton.layer.borderColor = UIColor.white.cgColor
                }
            })
        }
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    
    
    
    
}

