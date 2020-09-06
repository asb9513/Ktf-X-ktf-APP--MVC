//
//  CodeConfirmVC.swift
//  Ktf X Ktf APP
//
//  Created by Ahmed Saeed on 6/9/20.
//  Copyright © 2020 Ahmed Saeed. All rights reserved.
//

import UIKit


class CodeConfirmVC: UIViewController {
    static func instance () -> CodeConfirmVC {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "CodeConfirmVC") as! CodeConfirmVC
    }
    @IBOutlet weak var EmailTextField: UITextField!
    
    @IBOutlet weak var CodeConfirmationTextField: UITextField!
    @IBOutlet weak var CodeConfirmButton: UIButton!
    @IBOutlet weak var ViewHome: UIView!
    @IBOutlet weak var ButtonBack: UIButton!
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var LabelHome: UILabel!
    @IBOutlet weak var EmailLabel: UILabel!
    @IBOutlet weak var EmailView: UIView!
    @IBOutlet weak var CodeLbl: UILabel!
    @IBOutlet weak var CodeView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CodeConfirmButton.layer.borderColor = #colorLiteral(red: 0.10658703, green: 0.6567445993, blue: 0.3636534214, alpha: 1)
        CodeConfirmButton.layer.cornerRadius = 5
        CodeConfirmButton.layer.cornerRadius = 30
        CodeConfirmButton.layer.borderWidth = 6
        
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
        /////////////////////////////////////////////////////////////////////////////////////
        view.addSubview(LabelHome)
        LabelHome.translatesAutoresizingMaskIntoConstraints = false
        LabelHome.topAnchor.constraint(equalTo:view.topAnchor,constant: 140).isActive = true
        
        LabelHome.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        LabelHome.widthAnchor.constraint(equalToConstant: 404).isActive = true
        
        LabelHome.heightAnchor.constraint(equalToConstant: 274).isActive = true
        
        /////////////////////////////////////////////////////////////////////////////////////
        
        
        EmailLabel.translatesAutoresizingMaskIntoConstraints = false
        EmailLabel.topAnchor.constraint(equalTo:view.topAnchor,constant: 265).isActive = true
        
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
        CodeLbl.translatesAutoresizingMaskIntoConstraints = false
        CodeLbl.topAnchor.constraint(equalTo:view.topAnchor,constant: 385).isActive = true
        
        CodeLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        CodeLbl.widthAnchor.constraint(equalToConstant: 414).isActive = true
        
        CodeLbl.heightAnchor.constraint(equalToConstant: 91).isActive = true
        
        
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        
        view.addSubview(CodeView)
        CodeView.translatesAutoresizingMaskIntoConstraints = false
        CodeView.topAnchor.constraint(equalTo:view.topAnchor,constant: 500).isActive = true
        
        CodeView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        CodeView.widthAnchor.constraint(equalToConstant: 340).isActive = true
        
        CodeView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        //phone text field
        
        view.addSubview(CodeConfirmationTextField)
        CodeConfirmationTextField.translatesAutoresizingMaskIntoConstraints = false
        CodeConfirmationTextField.topAnchor.constraint(equalTo:view.topAnchor,constant: 442).isActive = true
        
        CodeConfirmationTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        CodeConfirmationTextField.widthAnchor.constraint(equalToConstant: 340).isActive = true
        
        CodeConfirmationTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        view.addSubview(CodeConfirmButton)
        CodeConfirmButton.translatesAutoresizingMaskIntoConstraints = false
        CodeConfirmButton.topAnchor.constraint(equalTo:view.topAnchor,constant: 560).isActive = true
        
        CodeConfirmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        CodeConfirmButton.widthAnchor.constraint(equalToConstant: 364).isActive = true
        
        CodeConfirmButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
    }
    */
    
    @IBAction func BackToRegisterVC(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func GoToHome(_ sender: Any) {
        
        if validData(){
            let parm = [
                "email": EmailTextField.text ?? "",
                "code":CodeConfirmationTextField.text ?? ""
                
            ]
            self.startLoading()
            NetworkMangerUser.instance.CodeConfirm(userInfoDict: parm) { [unowned self] (user, error) in
                self.stopLoading()
                if error  == nil{
                    DispatchQueue.main.async {
                        guard let status = user?.msg else{return}
                        if status == "user account is verified succesfully" {
                            self.showMsg(msg: "تم التسجيل بنجاح")
                            let Home = MainTabBar.instance()
                            Home.modalPresentationStyle = .fullScreen
                            self.present(Home, animated: true, completion: nil)
                        }else{
                            self.showMsg(msg: "خطأ في التسجيل اعد كتابة الكود بشكل صحيح ")
                        }
                    }
                    
                }else{
                    self.showMsg(msg: "خطأ في التسجيل اعد كتابة الكود بشكل صحيح ")
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
