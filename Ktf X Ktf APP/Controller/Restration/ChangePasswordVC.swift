//
//  ChangePasswordVC.swift
//  Ktf X Ktf APP
//
//  Created by Ahmed Saeed on 6/9/20.
//  Copyright © 2020 Ahmed Saeed. All rights reserved.
//

import UIKit

class ChangePasswordVC: UIViewController {
    
    static func instance () -> ChangePasswordVC {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "ChangePasswordVC") as! ChangePasswordVC
    }
    
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var CodeConfirmationTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBOutlet weak var DoneButton: UIButton!
    @IBOutlet weak var ViewHome: UIView!
    @IBOutlet weak var ButtonBack: UIButton!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var LabelHome: UILabel!
    @IBOutlet weak var EmailLabel: UILabel!
    @IBOutlet weak var EmailView: UIView!
    @IBOutlet weak var CodeLabel: UILabel!
    @IBOutlet weak var PasswordLabel: UILabel!
    @IBOutlet weak var PasswordView: UIView!
    @IBOutlet weak var CodeView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DoneButton.layer.borderColor = #colorLiteral(red: 0.10658703, green: 0.6567445993, blue: 0.3636534214, alpha: 1)
        DoneButton.layer.cornerRadius = 5
        DoneButton.layer.cornerRadius = 30
        DoneButton.layer.borderWidth = 6
       // SetupConstraint()
    }
  /*  func SetupConstraint(){
        view.addSubview(ViewHome)
        ViewHome.translatesAutoresizingMaskIntoConstraints = false
        ViewHome.topAnchor.constraint(equalTo:view.topAnchor,constant: 0).isActive = true
        
        ViewHome.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        ViewHome.widthAnchor.constraint(equalToConstant: 414).isActive = true
        
        ViewHome.heightAnchor.constraint(equalToConstant: 91).isActive = true
        
        
        view.addSubview(ButtonBack)
        ButtonBack.translatesAutoresizingMaskIntoConstraints = false
        ButtonBack.topAnchor.constraint(equalTo:view.topAnchor,constant:60).isActive = true
        
        
        ButtonBack.rightAnchor.constraint(equalTo:view.rightAnchor,constant: -345).isActive = true
        
        ButtonBack.widthAnchor.constraint(equalToConstant: 22).isActive = true
        
        ButtonBack.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
        
        
        /////////////////////////////////////////////////////////////////////////////////////
        view.addSubview(imgView)
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.topAnchor.constraint(equalTo:view.topAnchor,constant: 99).isActive = true
        
        imgView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        imgView.widthAnchor.constraint(equalToConstant: 240).isActive = true
        
        imgView.heightAnchor.constraint(equalToConstant: 158).isActive = true
        
        view.addSubview(LabelHome)
        LabelHome.translatesAutoresizingMaskIntoConstraints = false
        LabelHome.topAnchor.constraint(equalTo:view.topAnchor,constant: 140).isActive = true
        
        LabelHome.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        LabelHome.widthAnchor.constraint(equalToConstant: 404).isActive = true
        
        LabelHome.heightAnchor.constraint(equalToConstant: 274).isActive = true
        
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        EmailLabel.translatesAutoresizingMaskIntoConstraints = false
        EmailLabel.topAnchor.constraint(equalTo:view.topAnchor,constant: 275).isActive = true
        
        EmailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        EmailLabel.widthAnchor.constraint(equalToConstant: 414).isActive = true
        
        EmailLabel.heightAnchor.constraint(equalToConstant: 91).isActive = true
        
        
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        
        view.addSubview(EmailView)
        EmailView.translatesAutoresizingMaskIntoConstraints = false
        EmailView.topAnchor.constraint(equalTo:view.topAnchor,constant: 400).isActive = true
        
        EmailView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        EmailView.widthAnchor.constraint(equalToConstant: 340).isActive = true
        
        EmailView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        //phone text field
        
        view.addSubview(EmailTextField)
        EmailTextField.translatesAutoresizingMaskIntoConstraints = false
        EmailTextField.topAnchor.constraint(equalTo:view.topAnchor,constant: 342).isActive = true
        
        EmailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        EmailTextField.widthAnchor.constraint(equalToConstant: 340).isActive = true
        
        EmailTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        
        CodeLabel.translatesAutoresizingMaskIntoConstraints = false
        CodeLabel.topAnchor.constraint(equalTo:view.topAnchor,constant: 380).isActive = true
        
        CodeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        CodeLabel.widthAnchor.constraint(equalToConstant: 414).isActive = true
        
        CodeLabel.heightAnchor.constraint(equalToConstant: 91).isActive = true
        
        
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        
        view.addSubview(CodeView)
        CodeView.translatesAutoresizingMaskIntoConstraints = false
        CodeView.topAnchor.constraint(equalTo:view.topAnchor,constant: 490).isActive = true
        
        CodeView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        CodeView.widthAnchor.constraint(equalToConstant: 340).isActive = true
        
        CodeView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        //phone text field
        
        view.addSubview(CodeConfirmationTextField)
        CodeConfirmationTextField.translatesAutoresizingMaskIntoConstraints = false
        CodeConfirmationTextField.topAnchor.constraint(equalTo:view.topAnchor,constant: 450).isActive = true
        
        CodeConfirmationTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        CodeConfirmationTextField.widthAnchor.constraint(equalToConstant: 340).isActive = true
        
        CodeConfirmationTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        PasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        PasswordLabel.topAnchor.constraint(equalTo:view.topAnchor,constant: 465).isActive = true
        
        PasswordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        PasswordLabel.widthAnchor.constraint(equalToConstant: 414).isActive = true
        
        PasswordLabel.heightAnchor.constraint(equalToConstant: 91).isActive = true
        
        
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        
        view.addSubview(PasswordView)
        PasswordView.translatesAutoresizingMaskIntoConstraints = false
        PasswordView.topAnchor.constraint(equalTo:view.topAnchor,constant: 575).isActive = true
        
        PasswordView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        PasswordView.widthAnchor.constraint(equalToConstant: 340).isActive = true
        
        PasswordView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        //phone text field
        
        view.addSubview(PasswordTextField)
        PasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        PasswordTextField.topAnchor.constraint(equalTo:view.topAnchor,constant: 535).isActive = true
        
        PasswordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        PasswordTextField.widthAnchor.constraint(equalToConstant: 340).isActive = true
        
        PasswordTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        view.addSubview(DoneButton)
        DoneButton.translatesAutoresizingMaskIntoConstraints = false
        DoneButton.topAnchor.constraint(equalTo:view.topAnchor,constant: 605).isActive = true
        
        DoneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        DoneButton.widthAnchor.constraint(equalToConstant: 364).isActive = true
        
        DoneButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
    }
    */
    
    @IBAction func BackToRegisterVC(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func GoToHome(_ sender: Any) {
        
        if validData(){
            let parm = [
                "email": EmailTextField.text ?? "",
                "code":CodeConfirmationTextField.text ?? "",
                "password":PasswordTextField.text ?? ""
            ]
            self.startLoading()
            NetworkMangerUser.instance.CodeConfirm(userInfoDict: parm) { [unowned self] (user, error) in
                self.stopLoading()
                if error  == nil{
                    DispatchQueue.main.async {
                        guard let status = user?.msg else{return}
                        if status == "Password changed successfully" {
                            self.showMsg(msg:  "تم تغير كلمه المرور بنجاح")
                            let Home = MainTabBar.instance()
                            Home.modalPresentationStyle = .fullScreen
                            self.present(Home, animated: true, completion: nil)
                        }else{
                            self.showMsg(msg:"خطأ في التسجيل اعد كتابة البيانات")
                        }
                    }
                    
                }else{
                    self.showMsg(msg:"خطأ في التسجيل اعد كتابة البيانات")
                }
            }
        }
        
        
    }
    
    func validData() -> Bool{
        
        if EmailTextField.text!.isEmpty && CodeConfirmationTextField.text!.isEmpty{
            self.showMsg(msg: "من فضلك ادخل البيانات")
            return false
        }
        
        if EmailTextField.text!.isEmpty{
            self.showMsg(msg: "ادخل الايميل")
            return false
        }
        
        if CodeConfirmationTextField.text!.isEmpty{
            self.showMsg(msg: "ادخل الكود")
            return false
        }
        
        return true
    }
    
    func finish(){
        self.EmailTextField.text = ""
        self.CodeConfirmationTextField.text = ""
    }
    
}
