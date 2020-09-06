//
//  MyAccountVC.swift
//  Ktf X Ktf APP
//
//  Created by Ahmed Saeed on 6/9/20.
//  Copyright © 2020 Ahmed Saeed. All rights reserved.
//

import UIKit


class MyAccountVC: UIViewController {
    static func instance () -> MyAccountVC {
        let storyboard = UIStoryboard.init(name: "MyAccount", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "MyAccountVC") as! MyAccountVC
    }
    @IBOutlet weak var DoneButton: UIButton!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PhoneTextField: UITextField!
    @IBOutlet weak var ViewHome: UIView!
    @IBOutlet weak var RegisterNewAccLbl: UIButton!
  
    @IBOutlet weak var Admin: UIButton!
    
    var header = ["Content-Type" : "application/json","Authorization": "Bearer \(NetworkHelper.getAccessToken() ?? "" )"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DoneButton.layer.borderColor = #colorLiteral(red: 0.1128181443, green: 0.6548296213, blue: 0.3638802171, alpha: 1)
        DoneButton.layer.cornerRadius = 5
        DoneButton.layer.cornerRadius = 30
        DoneButton.layer.borderWidth = 6
        
        loadUserProfile()
        SetupConstraint()
        loadUserInfo()
    }
    @IBAction func Admin(_ sender: Any) {
           let Home = AdminVC.instance()
           Home.modalPresentationStyle = .fullScreen
           self.present(Home, animated: true, completion: nil)

       }
    func SetupConstraint(){
        view.addSubview(ViewHome)
        ViewHome.translatesAutoresizingMaskIntoConstraints = false
        ViewHome.topAnchor.constraint(equalTo:view.topAnchor,constant: 0).isActive = true
        
        ViewHome.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        ViewHome.widthAnchor.constraint(equalToConstant: 414).isActive = true
        
        ViewHome.heightAnchor.constraint(equalToConstant: 91).isActive = true
        
        
    
        
        view.addSubview(EmailTextField)
        EmailTextField.translatesAutoresizingMaskIntoConstraints = false
        EmailTextField.topAnchor.constraint(equalTo:view.topAnchor,constant: 310).isActive = true
        
        EmailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        EmailTextField.widthAnchor.constraint(equalToConstant: 364).isActive = true
        
        EmailTextField.heightAnchor.constraint(equalToConstant: 59).isActive = true

        view.addSubview(PhoneTextField)
           PhoneTextField.translatesAutoresizingMaskIntoConstraints = false
           PhoneTextField.topAnchor.constraint(equalTo:view.topAnchor,constant: 410).isActive = true
           
           PhoneTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
           
           
           PhoneTextField.widthAnchor.constraint(equalToConstant: 364).isActive = true
           
           PhoneTextField.heightAnchor.constraint(equalToConstant: 59).isActive = true
        
        
        
        view.addSubview(DoneButton)
        DoneButton.translatesAutoresizingMaskIntoConstraints = false
        DoneButton.topAnchor.constraint(equalTo:view.topAnchor,constant: 510).isActive = true
        
        DoneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        DoneButton.widthAnchor.constraint(equalToConstant: 374).isActive = true
        
        DoneButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

    }
    
    func loadUserInfo() {
        
        print("loadUserProfile")
        var header = ["Authorization": "Bearer \(NetworkHelper.getAccessToken() ?? "" )"]
        
        NetworkApi.ShowInfo{(response,err) in
            
            print("sendRequest")
            
            
            if let user = response.self{
                DispatchQueue.main.async {
                    print("DispatchQueue")
 
                    if self.EmailTextField.text == "hanykaram63@gmail.com"{
                        self.Admin.isHidden = false
                    }
                    else {
                        self.Admin.isHidden = true
                    }
                    
                }
            }
            
        }
    }

    func loadUserProfile() {
        
        print("loadUserProfile")
        var header = ["Authorization": "Bearer \(NetworkHelper.getAccessToken() ?? "" )"]
        
        NetworkApi.ShowInfo{(response,err) in
            
            print("sendRequest")
            
            
            if let user = response.self{
                DispatchQueue.main.async {
                    print("DispatchQueue")
                    self.EmailTextField.text = response?.email
                    
                    self.PhoneTextField.text = response?.phone
                    
                    
                }
            }
            
        }
    }
    
    
    
    
    @IBAction func Done(_ sender: Any) {
        if validData(){
            let param = ["email": EmailTextField.text ?? "","phone": PhoneTextField.text ?? "",] as [String : Any]
            
            self.startLoading()
            NetworkApi.UpdatePost(userInfoDict: param) { (response,err) in
                
                self.stopLoading()
                if err == nil{
                    
                    
                    
                    self.showMsg(msg: "تم تعديل البيانات بنجاح")
                    
                    
                }
                else{
                    
                    self.showMsg(msg: "هناك خطا ما")
                    
                }
            }
            
        }
        
    }
    
    
    func validData() -> Bool{
        
        if PhoneTextField.text!.isEmpty{
            self.showMsg(msg: "ادخل رقم الهاتف")
            return false
            
        }
        if EmailTextField.text!.isEmpty{
            self.showMsg(msg: "ادخل رقم الايميل")
            return false
        }
        return true
        
    }
    
}
