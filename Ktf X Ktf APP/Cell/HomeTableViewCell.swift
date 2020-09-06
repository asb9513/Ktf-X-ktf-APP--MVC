//
//  HomeTableViewCell.swift
//  Ktf X Ktf APP
//
//  Created by Ahmed Saeed on 6/9/20.
//  Copyright © 2020 Ahmed Saeed. All rights reserved.
//

import UIKit
import Kingfisher

class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak var imge: UIImageView!
    @IBOutlet weak var NameProblem: UILabel!
    @IBOutlet weak var DetailsProblem: UILabel!
    @IBOutlet weak var CallNow: UIButton!
    @IBOutlet weak var More: UIButton!
    @IBOutlet weak var HomeView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        UICell()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func UICell() {
        HomeView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        contentView.backgroundColor = UIColor(red: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 1.0)
        HomeView.layer.cornerRadius = 3.0
        HomeView.layer.masksToBounds = false
        HomeView.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        HomeView.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        HomeView.layer.shadowOpacity = 0.8
        
    }
   
    func configure(compines: TopProblemPost)
       {
           
        if let img = URL(string: compines.imgPath ?? ""){
            DispatchQueue.main.async {

             self.imge.kf.setImage(with: img)
                
            }
        }
       }

}
 
