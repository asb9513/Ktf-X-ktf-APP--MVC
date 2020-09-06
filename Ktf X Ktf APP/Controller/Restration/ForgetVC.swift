//
//  ForgetVC.swift
//  Ktf X Ktf APP
//
//  Created by Ahmed Saeed on 6/9/20.
//  Copyright © 2020 Ahmed Saeed. All rights reserved.
//

import UIKit


class ForgetVC: UIViewController {
    static func instance () -> ForgetVC {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "ForgetVC") as! ForgetVC
    }
    
    @IBOutlet weak var DoneButton: UIButton!
    
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var ViewHome: UIView!
    @IBOutlet weak var BackButton: UIButton!
    @IBOutlet weak var LabelHome: UILabel!
    @IBOutlet weak var EmailView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DoneButton.layer.borderColor = #colorLiteral(red: 0.10658703, green: 0.6567445993, blue: 0.3636534214, alpha: 1)
        DoneButton.layer.cornerRadius = 5
        DoneButton.layer.cornerRadius = 30
        DoneButton.layer.borderWidth = 6
        
     //   SetupConstraint()
        
    }
    /*func SetupConstraint(){
        view.addSubview(ViewHome)
        ViewHome.translatesAutoresizingMaskIntoConstraints = false
        ViewHome.topAnchor.constraint(equalTo:view.topAnchor,constant: 0).isActive = true
        
        ViewHome.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        ViewHome.widthAnchor.constraint(equalToConstant: 414).isActive = true
        
        ViewHome.heightAnchor.constraint(equalToConstant: 91).isActive = true
        
        
        view.addSubview(BackButton)
        BackButton.translatesAutoresizingMaskIntoConstraints = false
        BackButton.topAnchor.constraint(equalTo:view.topAnchor,constant:60).isActive = true
        
        
        BackButton.rightAnchor.constraint(equalTo:view.rightAnchor,constant: -345).isActive = true
        
        BackButton.widthAnchor.constraint(equalToConstant: 22).isActive = true
        
        BackButton.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
        
        
        /////////////////////////////////////////////////////////////////////////////////////
        
        
        LabelHome.translatesAutoresizingMaskIntoConstraints = false
        LabelHome.topAnchor.constraint(equalTo:view.topAnchor,constant: 265).isActive = true
        
        LabelHome.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        LabelHome.widthAnchor.constraint(equalToConstant: 414).isActive = true
        
        LabelHome.heightAnchor.constraint(equalToConstant: 91).isActive = true
        
        
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
        EmailTextField.topAnchor.constraint(equalTo:view.topAnchor,constant: 360).isActive = true
        
        EmailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        EmailTextField.widthAnchor.constraint(equalToConstant: 340).isActive = true
        
        EmailTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        view.addSubview(DoneButton)
        DoneButton.translatesAutoresizingMaskIntoConstraints = false
        DoneButton.topAnchor.constraint(equalTo:view.topAnchor,constant: 540).isActive = true
        
        DoneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        DoneButton.widthAnchor.constraint(equalToConstant: 364).isActive = true
        
        DoneButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        
    }*/
    
    @IBAction func DoneButton(_ sender: Any) {
        if validData() {
            let param = [
                "email" :EmailTextField.text ?? ""
            ]
            
            self.stopLoading()
            NetworkMangerUser.instance.Forget(userInfoDict: param) { (user, error) in
                
                
                self.stopLoading()
                if error  == nil{
                    DispatchQueue.main.async {
                        guard let status = user?.msg else{return}
                        
                        if status == "An email with verification code was sent to your email" {
                            self.showMsg(msg: "تم ارسال الكود عالايميل بنجاح")
                            let Code = ChangePasswordVC.instance()
                            Code.modalPresentationStyle = .fullScreen
                            self.present(Code, animated: true, completion: nil)
                            
                        }else{
                            self.showMsg(msg: "خطأ في التسجيل اعد كتابة البيانات")
                        }
                    }
                }else{
                    self.showMsg(msg: "خطأ في التسجيل اعد كتابة البيانات")
                }
            }
        }
        
    }
    func validData() -> Bool{
        
        if EmailTextField.text!.isEmpty {
            self.showMsg(msg: "من فضلك ادخل البيانات")
            return false
        }
        return true
    }
    
    @IBAction func Back(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)}
    
}
