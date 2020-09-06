//
//  Alret.swift
//  Ktf X Ktf APP
//
//  Created by Ahmed Saeed on 6/9/20.
//  Copyright © 2020 Ahmed Saeed. All rights reserved.
//

import Foundation
import UIKit
import Photos

extension UIViewController{
    //MARK:- 1- Navigation To
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    func navTo(VCName:String, storyBoardName:String?=nil){
        
        
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: VCName) else { return}
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.5, animations: {
                self.navigationController?.pushViewController(nextVC, animated: true)
            })
        }
    }
    
    
    func segueTo(segueID:String){
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.5, animations: {
                self.performSegue(withIdentifier: segueID, sender: self)
            })
        }
    }
    
    //MARK:- 2- Photos
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    func checkPhotoLibraryPermission() {
        let photosPermission = PHPhotoLibrary.authorizationStatus()
        if photosPermission == .notDetermined || photosPermission == .restricted {
            PHPhotoLibrary.requestAuthorization({status in
                guard status == .authorized else { return }
                self.presentImagePicker()
            })
        }
        else if photosPermission == .authorized {
            self.presentImagePicker()
        }
    }
    
    
    func presentImagePicker(){
        let imagePicker           = UIImagePickerController()
        imagePicker.delegate      = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
        imagePicker.sourceType    = .photoLibrary
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.5, animations: {
                self.present(imagePicker,animated: true,completion: nil)
            })
        }
    }
    
    //MARK:- 3- Hanlde Loading
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    func startLoading(){
        DispatchQueue.main.async {
            UIView.transition(with: self.view, duration: 0.5, options: .transitionCrossDissolve, animations: nil, completion: nil)
            self.view.addSubview(UIManager.shared.loadingView)
        }
    }
    
    
    func stopLoading(msg:String?=nil){
        DispatchQueue.main.async {
            UIView.transition(with: self.view, duration: 0.5, options: .transitionCrossDissolve, animations: nil, completion: nil)
            UIManager.shared.loadingView.removeFromSuperview()
            guard msg != nil else { return }
            self.showMsg(msg: msg!)
        }
    }
    
    func showMsg(msg:String, goBack:Bool?=nil){
        DispatchQueue.main.async {
            UIView.transition(with: self.view, duration: 0.5, options: .transitionCrossDissolve, animations: nil, completion: nil)
            self.view.addSubview(UIManager.shared.darkView)
            self.view.addSubview(UIManager.shared.myAlert)
            UIManager.shared.myAlert.setLayout(centerX: self.view.centerXAnchor,
                                               centerY: self.view.centerYAnchor,
                                               width:   ceil(UIScreen.main.bounds.width  * 0.8),
                                               height:  ceil(UIScreen.main.bounds.height * 0.25))
            UIManager.shared.myAlert.setupMe(myText: msg, goBack: goBack)
        }
    }
    
    //MARK:- 4- Check Empty Fileds
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    func checkFileds(fileds:[UITextField]) -> Bool{
        let emptyFileds = fileds.filter {$0.text == ""}
        if emptyFileds.count != 0 {
            DispatchQueue.main.async {
                UIView.transition(with: self.view, duration: 0.25, options: .transitionCrossDissolve, animations: nil, completion: nil)
                self.showMsg(msg: "لقد تركت احد الحقول فارغة")
            }
        }
        return emptyFileds.count == 0 ? true : false
    }
    
    
    //MARK:- To hide Keyboard by tapping Screen
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //    func hideKeyboardWhenTappedAround() {
    //        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
    //        tap.cancelsTouchesInView = false
    //        view.addGestureRecognizer(tap)
    //    }
    //
    //
    //    @objc func dismissKeyboard() {
    //        DispatchQueue.main.async {
    //            self.view.endEditing(true)
    //        }
    //    }
    
    
}
