//
//  ProfileVC.swift
//  Ktf X Ktf APP
//
//  Created by Ahmed Saeed on 6/9/20.
//  Copyright © 2020 Ahmed Saeed. All rights reserved.
//

import UIKit

 class ProfileVC: UIViewController {
    
    @IBOutlet weak var Hometv: UITableView!
    @IBOutlet var AlertView: UIView!
    var header = ["Content-Type" : "application/json","Authorization": "Bearer \(NetworkHelper.getAccessToken() ?? "" )"]
    var userid :String = ""
    var section :String = ""
    var edit = EditPostVC()
    static func instance () -> ProfileVC {
        let storyboard = UIStoryboard.init(name: "Home", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
    }
    var items = [UserPost]()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUserPosts()
       edit.section = self.section
        edit.userid = self.userid
        Hometv.delegate = self
        Hometv.dataSource = self
        // loadUserData()
    }
    
   
    
    
    
    func loadUserPosts() {
        self.startLoading()
        let header = ["Authorization": "Bearer \(NetworkHelper.getAccessToken() ?? "" )"]
        
        NetworkApi.sendRequest(method: .get, url: "https:/ktfxktf.herokuapp.com/myPosts", header: header,completion:
            
            {(err,response: ShowPosts?) in
                self.stopLoading()
                
                if err == nil{
                    guard let data = response?.posts else{return}
                    self.items = data
                    self.Hometv.reloadData()
                    
                }
        })
        
    }
  func loadUserData() {
        self.startLoading()
        let header = ["Authorization": "Bearer \(NetworkHelper.getAccessToken() ?? "" )"]
        
        NetworkApi.sendRequest(method: .get, url: showmypost, header: header,completion:
            
            {(err,response: UserPost?) in
                self.stopLoading()
                
                if err == nil{
                    guard let data = response.self else{return}
                    self.section = data.section
                    self.userid = data.userID
                    
                    
                }
        })

    }

  
 
    @IBAction func EditHome(_ sender: Any) {
        let RegVC = EditPostVC.instance()
        RegVC.modalPresentationStyle = .fullScreen
        self.present(RegVC, animated: true, completion: nil)

    }
    
  
    
    @IBAction func Remove(_ sender: Any) {
        AlertView.removeFromSuperview()

    }
}
extension ProfileVC: UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as!  ProfileTableViewCell
        cell.name.text = items[indexPath.row].name
        cell.details.text = items[indexPath.row].details
    self.section = items[indexPath.row].section
        self.userid = items[indexPath.row].userID
        DispatchQueue.main.async {

             cell.configure(compines: self.items[indexPath.row])
         }

      cell.Delet.tag = indexPath.row
        cell.Delet.addTarget(self, action: #selector(subscribe(_:)), for: .touchUpInside)
        
        cell.Solved.tag = indexPath.row
        cell.Solved.addTarget(self, action: #selector(Solved(_:)), for: .touchUpInside)
        
        cell.Edit.tag = indexPath.row
        cell.Edit.addTarget(self, action: #selector(Edit(_:)), for: .touchUpInside)
   
 return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 463
    }
    @objc func subscribe(_ sender: UIButton){
        let param = [
            "postId": items[sender.tag].id
        ]
        self.startLoading()
        NetworkApi.Delet(userInfoDict: param) { (user, error) in
            
            
            if error  == nil{
                DispatchQueue.main.async {
                    guard let status = user?
                        .status else{return}
                    if status == true{
                        self.showMsg(msg:  "تم حذف البوست بنجاح ")
                        self.stopLoading()
                        self.Hometv.reloadData()
                    }
                    else{
                        self.showMsg(msg:"قمت بذلك مسبقا")
                        self.stopLoading()
                        
                    }
                }
            }else{
                self.showMsg(msg:"قمت بذلك مسبقا")
                
                self.stopLoading()
                
                
                
            }
            
        }
    }
    @objc func Solved(_ sender: UIButton){
        let param = [
            "postId": items[sender.tag].id
        ]
        self.startLoading()
        NetworkApi.solved(userInfoDict: param) { (user, error) in
            
            
            if error  == nil{
                DispatchQueue.main.async {
                    guard let status = user?
                        .status else{return}
                    if status == true{
                        self.showMsg(msg:   "الحمدلله ع حل المشكله")
                        self.stopLoading()
                        self.Hometv.reloadData()
                    }
                    else{
                        self.showMsg(msg:"قمت بذلك مسبقا")
                        self.stopLoading()
                        
                    }
                }
            }else{
                self.showMsg(msg:"قمت بذلك مسبقا")
                
                self.stopLoading()
                
                
                
            }
            
        }
        
        
    }
    func ShowSuccess(){
        view.addSubview(self.AlertView)
        self.AlertView.center = view.center
        
    }
    @objc func Edit(_ sender: UIButton){
        
        ShowSuccess()
        
    }
    
    
    
}


 
