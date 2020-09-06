//
//  ProfileTableViewCell.swift
//  Ktf X Ktf APP
//
//  Created by Ahmed Saeed on 6/9/20.
//  Copyright © 2020 Ahmed Saeed. All rights reserved.
//

import UIKit
import Kingfisher
class ProfileTableViewCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var details: UILabel!
    @IBOutlet weak var EditView: UIView!
    @IBOutlet weak var Delet: UIButton!
    @IBOutlet weak var Solved: UIButton!
     @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var Edit: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        UICell()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func UICell() {
        EditView.backgroundColor = UIColor.white
        contentView.backgroundColor = UIColor(red: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 1.0)
        EditView.layer.cornerRadius = 3.0
        EditView.layer.masksToBounds = false
        EditView.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        EditView.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        EditView.layer.shadowOpacity = 0.8
        
    }
    
    func configure(compines: UserPost)
    {
        
     if let img = URL(string: compines.imgPath ?? ""){
          self.img.kf.setImage(with: img)
     }
    }
    
}
