//
//  AdminVC.swift
//  Ktf X Ktf APP
//
//  Created by Ahmed Saeed on 6/9/20.
//  Copyright © 2020 Ahmed Saeed. All rights reserved.
//

import UIKit
class AdminVC: UIViewController {
    
    static func instance () -> AdminVC {
        let storyboard = UIStoryboard.init(name: "Home", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "AdminVC") as! AdminVC
    }
    
    @IBOutlet weak var HomeTV: UITableView!
    @IBOutlet var AlertView: UIView!
    @IBOutlet weak var AlertMssg: UITextView!

    
    
    
    var items = [ApprovePostDetails]()
    var header = ["Accept":"application/json","Authorization": "Bearer \(NetworkHelper.getAccessToken() ?? "" )"]
    override func viewDidLoad() {
        super.viewDidLoad()
        HomeTV.delegate = self
        HomeTV.dataSource = self
        loadproblem()
        
    }
    
    
    
    
    
    func loadproblem(){
        self.startLoading()
        NetworkApi.sendRequest(method: .get, url: approve,header:header, completion:
            {(err,response: ApprovePost?) in
                self.stopLoading()
                
                if err == nil{
                    guard let data = response?.posts else{return}
                    self.items = data
                    self.HomeTV.reloadData()
                    
                }
        })
        
    }
    
    @IBAction func Back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func RemoveSuccess(_ sender: Any) {
        AlertView.removeFromSuperview()
        
    }
}
extension AdminVC:UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AprroveTableViewCell", for: indexPath) as!
        AprroveTableViewCell
        cell.name.text = "اسم صاحب المشكله: \(items[indexPath.row].name)"
        cell.problemdetails.text = items[indexPath.row].details
 
        cell.approve.tag = indexPath.row
        cell.approve.addTarget(self, action: #selector(subs(_:)), for: .touchUpInside)
        cell.configure(compines: items[indexPath.row])

        cell.Delet.tag = indexPath.row
        cell.Delet.addTarget(self, action: #selector(subscribe(_:)), for: .touchUpInside)
        if cell.problemdetails.text?.count ?? 0 > 50
        {
            cell.More.isEnabled = true
            cell.More.tag = indexPath.row
            cell.More.tag = indexPath.row
            cell.More.addTarget(self, action: #selector(subscri(_:)), for: .touchUpInside)
            self.AlertMssg.text = items[indexPath.row].details
            
        }
        else {
            cell.More.isHidden = true
            
        }
        

        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 181
    }
    @objc func subscribeTapped(_ sender: UIButton){
        // use the tag of button as index
        let youtuber = items[sender.tag]
        
        
        let url: NSURL = NSURL(string: "tel://\(youtuber.phone ?? "")")!
        if UIApplication.shared.canOpenURL(url as URL) {
            UIApplication.shared.openURL(url as URL)
        } else {
            print("Call failed")
        }
    }
    @objc func subs(_ sender: UIButton){
        let param = [
            "postId": items[sender.tag].id
        ]
        self.startLoading()
        NetworkApi.Aprrove(userInfoDict: param) { (user, error) in
            
            
            if error  == nil{
                DispatchQueue.main.async {
                    guard let status = user?
                        .status else{return}
                    if status == true{
                        self.showMsg(msg:  "تم قبول البوست")
                        self.stopLoading()
                        self.HomeTV.reloadData()

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
                        self.HomeTV.reloadData()
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
    @objc func subscri(_ sender: UIButton){
        ShowSuccess()
    }
    
}
