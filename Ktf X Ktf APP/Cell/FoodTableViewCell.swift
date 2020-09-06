//
//  FoodTableViewCell.swift
//  Ktf X Ktf APP
//
//  Created by Ahmed Saeed on 6/9/20.
//  Copyright © 2020 Ahmed Saeed. All rights reserved.
//

import UIKit

class FoodTableViewCell: UITableViewCell {
    
    @IBOutlet weak var FoodView: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var problemdetails: UILabel!
    @IBOutlet weak var CallNow: UIButton!
    @IBOutlet weak var like: UIButton!
    @IBOutlet weak var More: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        UICell()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func UICell() {
        FoodView.backgroundColor = UIColor.white
        contentView.backgroundColor = UIColor(red: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 1.0)
        FoodView.layer.cornerRadius = 3.0
        FoodView.layer.masksToBounds = false
        FoodView.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        FoodView.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        FoodView.layer.shadowOpacity = 0.8
        
    }
    func configure(compines: ShowProblemPost) {
          
            if let img = URL(string: compines.imgPath ?? ""){
                  DispatchQueue.main.async {

                          self.img.kf.setImage(with: img)
                             
                         }
               
          }
      }
      
}
