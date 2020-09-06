//
//  AprroveTableViewCell.swift
//  Ktf X Ktf APP
//
//  Created by Ahmed Saeed on 6/9/20.
//  Copyright © 2020 Ahmed Saeed. All rights reserved.
//

import UIKit

class AprroveTableViewCell: UITableViewCell {
    @IBOutlet weak var Other: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var problemdetails: UILabel!
    @IBOutlet weak var Delet: UIButton!
    @IBOutlet weak var approve: UIButton!
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
        Other.backgroundColor = UIColor.white
        contentView.backgroundColor = UIColor(red: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 1.0)
        Other.layer.cornerRadius = 3.0
        Other.layer.masksToBounds = false
        Other.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        Other.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        Other.layer.shadowOpacity = 0.8
        
    }
    func configure(compines: ApprovePostDetails) {
          
        if let img = URL(string: compines.imgPath ?? ""){
           DispatchQueue.main.async {

            self.img.kf.setImage(with: img)
               
           }
       }
      }

}
