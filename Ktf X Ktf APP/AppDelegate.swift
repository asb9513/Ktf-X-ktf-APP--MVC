//
//  AppDelegate.swift
//  Ktf X Ktf APP
//
//  Created by Ahmed Saeed on 6/9/20.
//  Copyright © 2020 Ahmed Saeed. All rights reserved.
//

import UIKit
import CoreData
import IQKeyboardManagerSwift
 @UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = true
        IQKeyboardManager.shared.toolbarDoneBarButtonItemText = "Next"
        //Enabling User Dismiss Keyboard When Click Out OF Text Field
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true;
   checkLoggedUser()
 
        return true
    }

    func checkLoggedUser() {
        if helper.getApiToken() != nil {
            // go to main screen
            let sb = UIStoryboard(name: "Home", bundle: nil)
            var vc: UIViewController
            vc = sb.instantiateViewController(withIdentifier: "HomeVC")
            window?.rootViewController = vc
        }
    }
}

