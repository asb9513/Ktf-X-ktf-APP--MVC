//
//  MainTabBar.swift
//  Ktf X Ktf APP
//
//  Created by Ahmed Saeed on 6/9/20.
//  Copyright © 2020 Ahmed Saeed. All rights reserved.
//

import UIKit

class MainTabBar: UITabBarController {
    static func instance () -> MainTabBar {
          let storyboard = UIStoryboard.init(name: "Home", bundle: nil)
          return storyboard.instantiateViewController(withIdentifier: "MainTabBar") as! MainTabBar
      }
      
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
