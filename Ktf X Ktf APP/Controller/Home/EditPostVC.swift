//
//  EditPostVC.swift
//  Ktf X Ktf APP
//
//  Created by Ahmed Saeed on 6/9/20.
//  Copyright © 2020 Ahmed Saeed. All rights reserved.
//

import UIKit
import Photos
import Foundation
import Alamofire
class EditPostVC: UIViewController {
    static func instance () -> EditPostVC {
          let storyboard = UIStoryboard.init(name: "Home", bundle: nil)
          return storyboard.instantiateViewController(withIdentifier: "EditPostVC") as! EditPostVC
      }
    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var LocationTextField: UITextField!
    @IBOutlet weak var PhoneTextField: UITextField!
    @IBOutlet weak var DetailsProblemTextField: UITextView!
    @IBOutlet weak var EditButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var ButtonImage: UIButton!
    @IBOutlet weak var LblImage: UILabel!


  
    var header = ["Content-Type" : "application/json","Authorization": "Bearer \(NetworkHelper.getAccessToken() ?? "" )"]
    var items = [UserPost]()
    var profile = ProfileVC()
    var userid :String = ""
     var section :String = ""
    var localPath: String?
    let debuggingTag = "EditPostVC"
 
    override func viewDidLoad() {
        super.viewDidLoad()

        EditButton.layer.borderColor = #colorLiteral(red: 0.1128181443, green: 0.6548296213, blue: 0.3638802171, alpha: 1)
        EditButton.layer.cornerRadius = 5
        EditButton.layer.cornerRadius = 30
        EditButton.layer.borderWidth = 6
        self.userid = profile.userid
        self.section = profile.section
        loadUserData()
        profile.loadUserData()
    }
    func loadUserData() {
        self.startLoading()
        let header = ["Authorization": "Bearer \(NetworkHelper.getAccessToken() ?? "" )"]
        
        NetworkApi.sendRequ(method: .get, url: showmypost, header: header,completion:
            
            {(err,response: UserPost?) in
                self.stopLoading()
                
                if err == nil{
                    guard let data = response.self else{return}
                    self.section = data.section
                    self.userid = data.userID
                    
                    
                }
        })

    }
    
        @IBAction func EditButtonAction(_ sender: Any) {
       if validData(){
       
     
        let urlReq = edit_post
              guard  let data = imageView.image?.jpegData(compressionQuality: 0.2) else {return}
              let imageData: NSData = imageView.image!.pngData() as! NSData
              let imageobj = imageView.image!
              let ImageData = imageobj.pngData()
              var params = [
                "phone": PhoneTextField.text ?? "", "email": EmailTextField.text ?? "","name":NameTextField.text  ?? "","address":LocationTextField.text ?? "","details":DetailsProblemTextField.text ?? "",            "postId":userid    , "section":section ]
              self.startLoading()
              Alamofire.upload(multipartFormData: { multipartFormData in
                  multipartFormData.append(data, withName: "image",fileName: "file.jpg", mimeType: "image/jpg")
                  for (key, value) in params {// this will loop the 'parameters' value, you can comment this if not needed
                      multipartFormData.append(value.data(using: .utf8)!, withName: key)
                      
                  }
              },
                               to:urlReq, method: .put,headers: header)
              { (result) in
                  switch result {
                  case .success(let upload, _, _):
                      upload.uploadProgress(closure: { (progress) in
                          print("Upload Progress: \(progress.fractionCompleted)")
                      })
                      upload.responseJSON { response in
                          switch response.result {
                          case .success :
                              do {
                                  let responseModel = try JSONDecoder().decode(EditPos.self, from: response.data!)
                                  // completion(responseModel, nil)
                                  self.showMsg(msg: "تم التعديل بنجاح")
                                  self.stopLoading()
                              } catch (let error) {
                                  print(error.localizedDescription)
                                  //   completion(nil , error)
                              }
                          case .failure(let error) :
                              print(error.localizedDescription)
                              //completion(nil , error)
                              self.showMsg(msg: "هناك مشكله ما راجع البيانات كامله")
                              self.stopLoading()
                              
                          }
                          // completion("success")
                          print(response)
                      }
                  case .failure(let encodingError):
                      self.showMsg(msg: "هناك مشكله ما راجع البيانات كامله")
                      self.stopLoading()
                      
                      print(encodingError)
                      //  completion("failed")
                  }
              }
          }
        
    }
            
        
        
        func validData() -> Bool{
            if (localPath?.isEmpty) ?? true{
                       self.showMsg(msg: "يجب عليك أدخال صوره ")
                       return false
                   }
            
            if PhoneTextField.text!.isEmpty{
                self.showMsg(msg: "ادخل رقم الهاتف")
                return false

            }
            if EmailTextField.text!.isEmpty{
                      self.showMsg(msg: "ادخل رقم الايميل")
                      return false
                  }
            
            if LocationTextField.text!.isEmpty{
                       self.showMsg(msg: "ادخل العنوان")
                       return false

                   }
            if PhoneTextField.text!.isEmpty{
                             self.showMsg(msg: "ادخل الهاتف")
                             return false

                         }
            if DetailsProblemTextField.text!.isEmpty{
                             self.showMsg(msg: "ادخل التفاصيل")
                             return false

                         }
            return true

        }
/*
       

     */
    @IBAction func addbutton(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            PHPhotoLibrary.requestAuthorization { (status) in
                DispatchQueue.main.async {
                    
                    switch status {
                    case .authorized:
                        let myPickercontroller = UIImagePickerController()
                        myPickercontroller.delegate = self
                        myPickercontroller.sourceType = .photoLibrary
                        self.present(myPickercontroller, animated: true)
                        
                    case .notDetermined:
                        if status == PHAuthorizationStatus.authorized {
                            let myPickercontroller = UIImagePickerController()
                            myPickercontroller.delegate = self
                            myPickercontroller.sourceType = .photoLibrary
                            
                            self.present(myPickercontroller, animated: true)
                        }
                        
                    case .restricted:
                        let alert = UIAlertController(title: "photo Libarary Restricted ", message: "photo libarary access restricted ", preferredStyle: .alert)
                        let okaction = UIAlertAction(title: "ok", style: .default)
                        alert.addAction(okaction)
                        self.present(alert, animated: true)
                        
                    case .denied:
                        let alert = UIAlertController(title: "photo Libarary denied ", message: "photo libarary access denied ", preferredStyle: .alert)
                        let okaction = UIAlertAction(title: "go to setting", style: .default) {
                            (action) in
                            
                            DispatchQueue.main.async {
                                let url = URL(string: UIApplication.openSettingsURLString)!
                                UIApplication.shared.open(url, options: [:])
                                
                            }
                        }
                        
                        let cancelAction = UIAlertAction(title: "cancel", style: .cancel)
                        alert.addAction(okaction)
                        alert.addAction(cancelAction)
                        
                        self.present(alert, animated: true)
                        
                    }
                }
            }
            
        }
        
        
    }
   
}
extension EditPostVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any])
    {
        
        let documentDirectory: NSString = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first! as NSString
        
        let imageName = "temp"
        let imagePath = documentDirectory.appendingPathComponent(imageName)
        print(debuggingTag, "image path : \(imagePath)")
        
        
        
        
        localPath = imagePath
        print(debuggingTag, "local path: \(String(describing: localPath))")
        
        if let image = info[.editedImage] as? UIImage {
            self.imageView.image = image
            self.imageView.image = image
            ButtonImage.isHidden = true
            LblImage.isHidden = true
            
            
            if let data = image.jpegData(compressionQuality: 80)
            {
                do {
                    try data.write(to: URL(fileURLWithPath: imagePath), options: .atomic)
                } catch let error {
                    print(error)
                }
            }
            
            
        } else if let image = info[.originalImage] as? UIImage {
            self.imageView.image = image
            
            if let data = image.jpegData(compressionQuality: 80)
            {
                do {
                    try data.write(to: URL(fileURLWithPath: imagePath), options: .atomic)
                } catch let error {
                    print(error)
                }
            }
            
            
        }
        
        ButtonImage.isHidden = true
        LblImage.isHidden = true
        
        
        
        dismiss(animated: true)
    }
    
    func imGWPickerControllerDidCancek(_ picker: UIImagePickerController)
    {
        dismiss(animated: true)
        ButtonImage.isHidden = true
        LblImage.isHidden = true
    }
   
}



