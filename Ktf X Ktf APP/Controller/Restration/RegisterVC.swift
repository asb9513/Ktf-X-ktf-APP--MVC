//
//  RegisterVC.swift
//  Ktf X Ktf APP
//
//  Created by Ahmed Saeed on 6/9/20.
//  Copyright © 2020 Ahmed Saeed. All rights reserved.
//

import UIKit


class RegisterVC: UIViewController {
    
    
    static func instance () -> RegisterVC {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterVC
    }
    
    @IBOutlet weak var SignUpButton: UIButton!
    
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var phoneTxtField: UITextField!
    @IBOutlet weak var pwdTxtField: UITextField!
    @IBOutlet weak var confirmPwdTxtField: UITextField!
    
    @IBOutlet weak var EmailView: UIView!
    @IBOutlet weak var EmailTextViewImage: UIImageView!
    
    @IBOutlet weak var ViewHome: UIView!
    @IBOutlet weak var RegisterNewAccLbl: UILabel!
    @IBOutlet weak var BackButton: UIView!
    
    @IBOutlet weak var Labelinstrectio: UILabel!
    @IBOutlet weak var EmailLabel: UILabel!
    @IBOutlet weak var PhoneLabel: UILabel!
    @IBOutlet weak var PhoneView: UIView!
    @IBOutlet weak var PhoneViewImage: UIImageView!
    @IBOutlet weak var PasswordLabel: UILabel!
    @IBOutlet weak var PasswordImage: UIImageView!
    @IBOutlet weak var PasswordView: UIView!
    @IBOutlet weak var ConfirmPasswordLabel: UILabel!
    @IBOutlet weak var ConfirmPasswordView: UIView!
    @IBOutlet weak var PasswordImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SignUpButton.layer.borderColor = #colorLiteral(red: 0.10658703, green: 0.6567445993, blue: 0.3636534214, alpha: 1)
        SignUpButton.layer.cornerRadius = 5
        SignUpButton.layer.cornerRadius = 30
        SignUpButton.layer.borderWidth = 6
       // SetupConstraint()
    }
   /* func SetupConstraint(){
        view.addSubview(ViewHome)
        ViewHome.translatesAutoresizingMaskIntoConstraints = false
        ViewHome.topAnchor.constraint(equalTo:view.topAnchor,constant: 0).isActive = true
        
        ViewHome.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        ViewHome.widthAnchor.constraint(equalToConstant: 414).isActive = true
        
        ViewHome.heightAnchor.constraint(equalToConstant: 91).isActive = true
        
        
        view.addSubview(RegisterNewAccLbl)
        RegisterNewAccLbl.translatesAutoresizingMaskIntoConstraints = false
        RegisterNewAccLbl.topAnchor.constraint(equalTo:view.topAnchor,constant: 20).isActive = true
        
        
        RegisterNewAccLbl.leftAnchor.constraint(equalTo:view.leftAnchor,constant:210).isActive = true
        RegisterNewAccLbl.rightAnchor.constraint(equalTo:view.rightAnchor,constant: -20).isActive = true
        
        RegisterNewAccLbl.widthAnchor.constraint(equalToConstant: 440).isActive = true
        
        RegisterNewAccLbl.heightAnchor.constraint(equalToConstant: 91).isActive = true
        
        view.addSubview(BackButton)
        BackButton.translatesAutoresizingMaskIntoConstraints = false
        BackButton.topAnchor.constraint(equalTo:view.topAnchor,constant:60).isActive = true
        
        
        BackButton.rightAnchor.constraint(equalTo:view.rightAnchor,constant: -345).isActive = true
        
        BackButton.widthAnchor.constraint(equalToConstant: 22).isActive = true
        
        BackButton.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
        ///////////////////////////////////////////////////////////////////////////////////////////////////
        view.addSubview(Labelinstrectio)
        Labelinstrectio.translatesAutoresizingMaskIntoConstraints = false
        Labelinstrectio.topAnchor.constraint(equalTo:view.topAnchor,constant: 60).isActive = true
        
        Labelinstrectio.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        Labelinstrectio.widthAnchor.constraint(equalToConstant: 414).isActive = true
        
        Labelinstrectio.heightAnchor.constraint(equalToConstant: 91).isActive = true
        Labelinstrectio.rightAnchor.constraint(equalTo:view.rightAnchor,constant: -16).isActive = true
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        EmailLabel.translatesAutoresizingMaskIntoConstraints = false
        EmailLabel.topAnchor.constraint(equalTo:view.topAnchor,constant: 95).isActive = true
        
        EmailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        EmailLabel.widthAnchor.constraint(equalToConstant: 414).isActive = true
        
        EmailLabel.heightAnchor.constraint(equalToConstant: 91).isActive = true
        
        
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        
        view.addSubview(EmailView)
        EmailView.translatesAutoresizingMaskIntoConstraints = false
        EmailView.topAnchor.constraint(equalTo:view.topAnchor,constant: 210).isActive = true
        
        EmailView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        EmailView.widthAnchor.constraint(equalToConstant: 348).isActive = true
        
        EmailView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        //phone text field
        
        view.addSubview(EmailTextField)
        EmailTextField.translatesAutoresizingMaskIntoConstraints = false
        EmailTextField.topAnchor.constraint(equalTo:view.topAnchor,constant: 172).isActive = true
        
        EmailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        EmailTextField.widthAnchor.constraint(equalToConstant: 348).isActive = true
        
        EmailTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        view.addSubview(EmailTextField)
        
        EmailTextViewImage.translatesAutoresizingMaskIntoConstraints = false
        EmailTextViewImage.topAnchor.constraint(equalTo:view.topAnchor,constant: 185).isActive = true
        EmailTextViewImage.leftAnchor.constraint(equalTo:view.leftAnchor,constant:10).isActive = true
        EmailTextViewImage.rightAnchor.constraint(equalTo:view.rightAnchor,constant: 310).isActive = true
        EmailTextViewImage.widthAnchor.constraint(equalToConstant: 25).isActive = true
        EmailTextViewImage.heightAnchor.constraint(equalToConstant: 24).isActive = true
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        PhoneLabel.translatesAutoresizingMaskIntoConstraints = false
        PhoneLabel.topAnchor.constraint(equalTo:view.topAnchor,constant: 190).isActive = true
        
        PhoneLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        PhoneLabel.widthAnchor.constraint(equalToConstant: 414).isActive = true
        
        PhoneLabel.heightAnchor.constraint(equalToConstant: 91).isActive = true
        
        
        view.addSubview(PhoneView)
        PhoneView.translatesAutoresizingMaskIntoConstraints = false
        PhoneView.topAnchor.constraint(equalTo:view.topAnchor,constant: 295).isActive = true
        
        PhoneView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        PhoneView.widthAnchor.constraint(equalToConstant: 348).isActive = true
        
        PhoneView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        //phone text field
        
        view.addSubview(phoneTxtField)
        phoneTxtField.translatesAutoresizingMaskIntoConstraints = false
        phoneTxtField.topAnchor.constraint(equalTo:view.topAnchor,constant: 257).isActive = true
        
        phoneTxtField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        phoneTxtField.widthAnchor.constraint(equalToConstant: 348).isActive = true
        
        phoneTxtField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        view.addSubview(PhoneViewImage)
        
        PhoneViewImage.translatesAutoresizingMaskIntoConstraints = false
        PhoneViewImage.topAnchor.constraint(equalTo:view.topAnchor,constant: 269).isActive = true
        PhoneViewImage.leftAnchor.constraint(equalTo:view.leftAnchor,constant:10).isActive = true
        PhoneViewImage.rightAnchor.constraint(equalTo:view.rightAnchor,constant: 310).isActive = true
        PhoneViewImage.widthAnchor.constraint(equalToConstant: 25).isActive = true
        PhoneViewImage.heightAnchor.constraint(equalToConstant: 24).isActive = true
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        ConfirmPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        ConfirmPasswordLabel.topAnchor.constraint(equalTo:view.topAnchor,constant: 360).isActive = true
        
        ConfirmPasswordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        ConfirmPasswordLabel.widthAnchor.constraint(equalToConstant: 414).isActive = true
        
        ConfirmPasswordLabel.heightAnchor.constraint(equalToConstant: 91).isActive = true
        
        
        view.addSubview(PasswordView)
        PasswordView.translatesAutoresizingMaskIntoConstraints = false
        PasswordView.topAnchor.constraint(equalTo:view.topAnchor,constant: 380).isActive = true
        
        PasswordView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        PasswordView.widthAnchor.constraint(equalToConstant: 348).isActive = true
        
        PasswordView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        //phone text field
        
        view.addSubview(pwdTxtField)
        pwdTxtField.translatesAutoresizingMaskIntoConstraints = false
        pwdTxtField.topAnchor.constraint(equalTo:view.topAnchor,constant: 342).isActive = true
        
        pwdTxtField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        pwdTxtField.widthAnchor.constraint(equalToConstant: 348).isActive = true
        
        pwdTxtField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        view.addSubview(PasswordImage)
        
        PasswordImage.translatesAutoresizingMaskIntoConstraints = false
        PasswordImage.topAnchor.constraint(equalTo:view.topAnchor,constant: 354).isActive = true
        PasswordImage.leftAnchor.constraint(equalTo:view.leftAnchor,constant:10).isActive = true
        PasswordImage.rightAnchor.constraint(equalTo:view.rightAnchor,constant: 310).isActive = true
        PasswordImage.widthAnchor.constraint(equalToConstant: 25).isActive = true
        PasswordImage.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        PasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        PasswordLabel.topAnchor.constraint(equalTo:view.topAnchor,constant: 275).isActive = true
        
        PasswordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        PasswordLabel.widthAnchor.constraint(equalToConstant: 414).isActive = true
        
        PasswordLabel.heightAnchor.constraint(equalToConstant: 91).isActive = true
        
        view.addSubview(ConfirmPasswordView)
        ConfirmPasswordView.translatesAutoresizingMaskIntoConstraints = false
        ConfirmPasswordView.topAnchor.constraint(equalTo:view.topAnchor,constant: 465).isActive = true
        
        ConfirmPasswordView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        ConfirmPasswordView.widthAnchor.constraint(equalToConstant: 348).isActive = true
        
        ConfirmPasswordView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        //phone text field
        
        view.addSubview(confirmPwdTxtField)
        confirmPwdTxtField.translatesAutoresizingMaskIntoConstraints = false
        confirmPwdTxtField.topAnchor.constraint(equalTo:view.topAnchor,constant: 427).isActive = true
        
        confirmPwdTxtField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        confirmPwdTxtField.widthAnchor.constraint(equalToConstant: 348).isActive = true
        
        confirmPwdTxtField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        view.addSubview(PasswordImg)
        
        PasswordImg.translatesAutoresizingMaskIntoConstraints = false
        PasswordImg.topAnchor.constraint(equalTo:view.topAnchor,constant: 439).isActive = true
        PasswordImg.leftAnchor.constraint(equalTo:view.leftAnchor,constant:10).isActive = true
        PasswordImg.rightAnchor.constraint(equalTo:view.rightAnchor,constant: 310).isActive = true
        PasswordImg.widthAnchor.constraint(equalToConstant: 25).isActive = true
        PasswordImg.heightAnchor.constraint(equalToConstant: 24).isActive = true
        /////////////////////////////////////////////////////////////////////////////////////////////////////
        view.addSubview(SignUpButton)
        SignUpButton.translatesAutoresizingMaskIntoConstraints = false
        SignUpButton.topAnchor.constraint(equalTo:view.topAnchor,constant: 540).isActive = true
        
        SignUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        SignUpButton.widthAnchor.constraint(equalToConstant: 364).isActive = true
        
        SignUpButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
 
 */
    
    @IBAction func BackToLoginVC(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func SignUpButton(_ sender: Any) {
        
        if validData() {
            let param = [
                "email" :EmailTextField.text ?? "",
                "phone": phoneTxtField.text ?? "" ,
                "password":pwdTxtField.text ?? ""
            ]
            
            self.startLoading()
            NetworkMangerUser.instance.registerNewUser(userInfoDict: param) { (user, error) in
                
                
                self.stopLoading()
                if error  == nil{
                    DispatchQueue.main.async {
                        guard let status = user?.user?.status
                            else{return}
                        
                        if status == "pending" {
                            NetworkHelper.userEmail = user?.user?.email
                            
                            self.showMsg(msg:"تم تسجيل الدخول بنجاح")
                            self.finish()
                            let Code = CodeConfirmVC.instance()
                            Code.modalPresentationStyle = .fullScreen
                            self.present(Code, animated: true, completion: nil)
                            
                        }else{
                            self.showMsg(msg: "خطأ في التسجيل اعد كتابة الايميل او كلمة المرور")                        }
                    }
                }else{
                    self.showMsg(msg: "انت مسجل بالفعل")
                }
            }
        }
        
        
        
    }
    func validData() -> Bool{
        
        if phoneTxtField.text!.isEmpty && confirmPwdTxtField.text!.isEmpty && pwdTxtField.text!.isEmpty{
            self.showMsg(msg: "من فضلك ادخل البيانات")
            
            return false
        }
        
        if phoneTxtField.text!.isEmpty{
            self.showMsg(msg: "ادخل رقم الهاتف")
            
            return false
        }
        
        if pwdTxtField.text!.isEmpty{
            self.showMsg(msg: "ادخل كلمة المرور")
            
            return false
        }
        
        
        
        
        
        if pwdTxtField.text! != confirmPwdTxtField.text!{
            self.showMsg(msg: "كلمات المرور غير متطابقة")
            return false
        }
        
        return true
    }
    func finish(){
        self.phoneTxtField.text = ""
        self.pwdTxtField.text = ""
        self.EmailTextField.text = ""
        
    }
    
}
