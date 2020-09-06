//
//  ViewController.swift
//  Ktf X Ktf APP
//
//  Created by Ahmed Saeed on 6/9/20.
//  Copyright © 2020 Ahmed Saeed. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
        @IBOutlet weak var imgView: UIImageView!
        @IBOutlet weak var PhoneView: UIView!
        @IBOutlet weak var PhoneImageView: UIImageView!
        @IBOutlet weak var PhoneTextField: UITextField!
        @IBOutlet weak var PasswordTextField: UITextField!
        @IBOutlet weak var SignInButton: UIButton!
        @IBOutlet weak var PasswordView: UIView!
        @IBOutlet weak var PasswordViewImage: UIImageView!
        @IBOutlet weak var PasswordLabel: UILabel!
        @IBOutlet weak var EmailLabel: UILabel!
        @IBOutlet weak var ForgetButton: UIButton!
        @IBOutlet weak var NewAccountLabel: UILabel!
        @IBOutlet weak var NewAccountButton: UIButton!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            SignInButton.layer.borderColor = #colorLiteral(red: 0.10658703, green: 0.6567445993, blue: 0.3636534214, alpha: 1)
            SignInButton.layer.cornerRadius = 5
            SignInButton.layer.cornerRadius = 30
            SignInButton.layer.borderWidth = 6
            if UserDefaults.standard.bool(forKey: "islogged") == true {
                let Home = MainTabBar.instance()
                Home.modalPresentationStyle = .fullScreen
                self.present(Home, animated: true, completion: nil)
            }
            if NetworkHelper.isLogIn == true {
                let Home = HomeVC.instance()
                Home.modalPresentationStyle = .fullScreen
                self.present(Home, animated: true, completion: nil)
                
            }
            else {
                let Home = RegisterVC.instance()
                Home.modalPresentationStyle = .fullScreen
                self.present(Home, animated: true, completion: nil)
                
            }
            
            
        //    SetupConstraint()
        }
     /*   func SetupConstraint(){
            view.addSubview(imgView)
            imgView.translatesAutoresizingMaskIntoConstraints = false
            imgView.topAnchor.constraint(equalTo:view.topAnchor,constant: 20).isActive = true
            
            imgView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            
            
            imgView.widthAnchor.constraint(equalToConstant: 404).isActive = true
            
            imgView.heightAnchor.constraint(equalToConstant: 274).isActive = true
            ////////////////////////////////////////////////////////////////////////////////////////////////////////
            view.addSubview(PhoneView)
            PhoneView.translatesAutoresizingMaskIntoConstraints = false
            PhoneView.topAnchor.constraint(equalTo:view.topAnchor,constant: 380).isActive = true
            
            PhoneView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            
            
            PhoneView.widthAnchor.constraint(equalToConstant: 348).isActive = true
            
            PhoneView.heightAnchor.constraint(equalToConstant: 1).isActive = true
            
            //phone text field
            
            view.addSubview(PhoneTextField)
            PhoneTextField.translatesAutoresizingMaskIntoConstraints = false
            PhoneTextField.topAnchor.constraint(equalTo:view.topAnchor,constant: 342).isActive = true
            
            PhoneTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            
            
            PhoneTextField.widthAnchor.constraint(equalToConstant: 348).isActive = true
            
            PhoneTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
            
            view.addSubview(PhoneImageView)
            
            PhoneImageView.translatesAutoresizingMaskIntoConstraints = false
            PhoneImageView.topAnchor.constraint(equalTo:view.topAnchor,constant: 355).isActive = true
            PhoneImageView.leftAnchor.constraint(equalTo:view.leftAnchor,constant:10).isActive = true
            PhoneImageView.rightAnchor.constraint(equalTo:view.rightAnchor,constant: 310).isActive = true
            PhoneImageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
            PhoneImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
            
            
            EmailLabel.translatesAutoresizingMaskIntoConstraints = false
            EmailLabel.topAnchor.constraint(equalTo:view.topAnchor,constant: 330).isActive = true
            EmailLabel.leftAnchor.constraint(equalTo:view.leftAnchor,constant:30).isActive = true
            EmailLabel.rightAnchor.constraint(equalTo:view.rightAnchor,constant: 400).isActive = true
            EmailLabel.widthAnchor.constraint(equalToConstant: 104).isActive = true
            EmailLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
            ////////////////////////////////////////////////////////////////////////////////////////
            view.addSubview(PasswordView)
            PasswordView.translatesAutoresizingMaskIntoConstraints = false
            PasswordView.topAnchor.constraint(equalTo:view.topAnchor,constant: 490).isActive = true
            
            PasswordView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            
            
            PasswordView.widthAnchor.constraint(equalToConstant: 348).isActive = true
            
            PasswordView.heightAnchor.constraint(equalToConstant: 1).isActive = true
            
            //phone text field
            
            view.addSubview(PasswordTextField)
            PasswordTextField.translatesAutoresizingMaskIntoConstraints = false
            PasswordTextField.topAnchor.constraint(equalTo:view.topAnchor,constant: 452).isActive = true
            
            PasswordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            
            
            PasswordTextField.widthAnchor.constraint(equalToConstant: 348).isActive = true
            
            PasswordTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
            
            view.addSubview(PasswordViewImage)
            
            PasswordViewImage.translatesAutoresizingMaskIntoConstraints = false
            PasswordViewImage.topAnchor.constraint(equalTo:view.topAnchor,constant: 460).isActive = true
            PasswordViewImage.leftAnchor.constraint(equalTo:view.leftAnchor,constant:10).isActive = true
            PasswordViewImage.rightAnchor.constraint(equalTo:view.rightAnchor,constant: 310).isActive = true
            PasswordViewImage.widthAnchor.constraint(equalToConstant: 25).isActive = true
            PasswordViewImage.heightAnchor.constraint(equalToConstant: 24).isActive = true
            
            
            
            PasswordLabel.translatesAutoresizingMaskIntoConstraints = false
            PasswordLabel.topAnchor.constraint(equalTo:view.topAnchor,constant: 440).isActive = true
            PasswordLabel.leftAnchor.constraint(equalTo:view.leftAnchor,constant:30).isActive = true
            PasswordLabel.rightAnchor.constraint(equalTo:view.rightAnchor,constant: 400).isActive = true
            PasswordLabel.widthAnchor.constraint(equalToConstant: 104).isActive = true
            PasswordLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
            
            ////////////////////////////////////////////////////////////////////////////////////////
            view.addSubview(SignInButton)
            SignInButton.translatesAutoresizingMaskIntoConstraints = false
            SignInButton.topAnchor.constraint(equalTo:view.topAnchor,constant: 540).isActive = true
            
            SignInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            
            
            SignInButton.widthAnchor.constraint(equalToConstant: 334).isActive = true
            
            SignInButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
            
            ////////////////////////////////////////////////////////////////////////////////////////
            
            
            view.addSubview(ForgetButton)
            
            ForgetButton.translatesAutoresizingMaskIntoConstraints = false
            ForgetButton.topAnchor.constraint(equalTo:view.topAnchor,constant: 605).isActive = true
            ForgetButton.leftAnchor.constraint(equalTo:view.leftAnchor,constant:100).isActive = true
            ForgetButton.rightAnchor.constraint(equalTo:view.rightAnchor,constant: -20).isActive = true
            ForgetButton.widthAnchor.constraint(equalToConstant: 168).isActive = true
            ForgetButton.heightAnchor.constraint(equalToConstant: 29).isActive = true
            //////////////////////////////////////////////////////////////////////////////////////////////////////////////
            view.addSubview(NewAccountLabel)
            
            NewAccountLabel.translatesAutoresizingMaskIntoConstraints = false
            NewAccountLabel.topAnchor.constraint(equalTo:view.topAnchor,constant: 640).isActive = true
            NewAccountLabel.leftAnchor.constraint(equalTo:view.leftAnchor,constant:73).isActive = true
            NewAccountLabel.rightAnchor.constraint(equalTo:view.rightAnchor,constant: 134).isActive = true
            NewAccountLabel.widthAnchor.constraint(equalToConstant: 20).isActive = true
            NewAccountLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
            
            view.addSubview(NewAccountButton)
            
            NewAccountButton.translatesAutoresizingMaskIntoConstraints = false
            NewAccountButton.topAnchor.constraint(equalTo:view.topAnchor,constant: 640).isActive = true
            NewAccountButton.leftAnchor.constraint(equalTo:view.leftAnchor,constant:263).isActive = true
            NewAccountButton.rightAnchor.constraint(equalTo:view.rightAnchor,constant: -20).isActive = true
            NewAccountButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
            NewAccountButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
            
            
            
        }
 */
        @IBAction func SignUP(_ sender: Any) {
            let RegVC = RegisterVC.instance()
            RegVC.modalPresentationStyle = .fullScreen
            self.present(RegVC, animated: true, completion: nil)
            
        }
        @IBAction func SignInButtton(_ sender: Any) {
            if validData(){
                let parm = [
                    "email": PhoneTextField.text ?? "",
                    "password": PasswordTextField.text ?? "",
                ]
                self.startLoading()
                NetworkMangerUser.instance.loginUser(userInfoDict: parm) { [unowned self] (user, error) in
                    self.stopLoading()
                    
                    if error  == nil{
                        NetworkHelper.accessToken = user?.token ?? ""
                        NetworkHelper.userEmail = user?.token
                        
                        NetworkHelper.isLogIn = true
                        UserDefaults.standard.synchronize()
                        
                        DispatchQueue.main.async {
                            guard let status = user?.message else{return}
                            if status == "You are logged in successfully !" {
                                
                                
                                let Home = MainTabBar.instance()
                                Home.modalPresentationStyle = .fullScreen
                                self.present(Home, animated: true, completion: nil)
                                
                            }  else if status != "Invalid email or password" {
                                 self.showMsg(msg: "خطأ في التسجيل اعد كتابة الايميل او كلمة المرور")
                                self.stopLoading()

                            }
                            else {
                                              self.showMsg(msg: "خطأ في التسجيل اعد كتابة الايميل او كلمة المرور")
                                                   self.stopLoading()


                                               }
                        }
                        
                    }
                }
            }
            
        }
        
        @IBAction func GoTOForgetVC(_ sender: Any) {
            let Forget = ForgetVC.instance()
            Forget.modalPresentationStyle = .fullScreen
            self.present(Forget, animated: true, completion: nil)
        }
        
        func validData() -> Bool{
            
            if PhoneTextField.text!.isEmpty && PasswordTextField.text!.isEmpty{
                self.showMsg(msg: "من فضلك ادخل البيانات")
                return false
            }
            
            if PhoneTextField.text!.isEmpty{
                self.showMsg(msg: "ادخل رقم الايميل")
                return false
            }
            
            if PasswordTextField.text!.isEmpty{
                self.showMsg(msg: "ادخل كلمة المرور")
                return false
            }
            
            return true
        }
        
        func finish(){
            self.PhoneTextField.text = ""
            self.PasswordTextField.text = ""
        }
    }

