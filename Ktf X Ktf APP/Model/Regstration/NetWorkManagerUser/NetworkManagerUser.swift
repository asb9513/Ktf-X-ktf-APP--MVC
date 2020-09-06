//
//  NetworkManagerUser.swift
//  Ktf X Ktf APP
//
//  Created by Ahmed Saeed on 6/9/20.
//  Copyright © 2020 Ahmed Saeed. All rights reserved.
//

import Foundation
import Alamofire
 

class NetworkMangerUser {
    
    
    
    static let instance = NetworkMangerUser()
    
    func registerNewUser (userInfoDict : [String:Any] , completion : @escaping( RegisterModel? , Error?) -> ()) {
        let headers = ["Content-Type" : "application/json"]
        Alamofire.request(register, method: .post, parameters: userInfoDict, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            switch response.result {
            case .success :
                do {
                    let responseModel = try JSONDecoder().decode(RegisterModel.self, from: response.data!)
                    print(responseModel)
                    completion(responseModel , nil)
                } catch (let error) {
                    print(error.localizedDescription)
                    completion(nil , error)
                }
            case .failure(let error) :
                print(error.localizedDescription)
                completion(nil , error)
            }
        }
    } // Register Function
    
    
    
    
    static let jsonDecoder = JSONDecoder()
    
    
    func loginUser (userInfoDict : [String:Any] , completion:@escaping ( LoginModel? ,  Error?) -> Void) {
        let headers = ["content-type" : "application/json"]
        
        Alamofire.request(login, method: .post, parameters: userInfoDict, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            print(response.result.value!)
            switch response.result {
            case .success :
                do {
                    let responseModel = try JSONDecoder().decode(LoginModel.self, from: response.data!)
                    completion(responseModel, nil)
                } catch (let error) {
                    print(error.localizedDescription)
                    completion(nil , error)
                }
            case .failure(let error) :
                print(error.localizedDescription)
                completion(nil , error)
            }
        }
    } //Login
    
    func CodeConfirm (userInfoDict : [String:Any] , completion:@escaping ( CodeConfirmModel? ,  Error?) -> Void) {
        let headers = ["content-type" : "application/json"]
        
        Alamofire.request(confirm_code, method: .post, parameters: userInfoDict, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            print(response.result.value!)
            switch response.result {
            case .success :
                do {
                    let responseModel = try JSONDecoder().decode(CodeConfirmModel.self, from: response.data!)
                    completion(responseModel, nil)
                } catch (let error) {
                    print(error.localizedDescription)
                    completion(nil , error)
                }
            case .failure(let error) :
                print(error.localizedDescription)
                completion(nil , error)
            }
        }
    } //CodeConfirm function
    
    func Forget (userInfoDict : [String:Any] , completion:@escaping ( ForgetPassword? ,  Error?) -> Void) {
         let headers = ["content-type" : "application/json"]
         
         Alamofire.request(forget, method: .post, parameters: userInfoDict, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
             print(response.result.value!)
             switch response.result {
             case .success :
                 do {
                     let responseModel = try JSONDecoder().decode(ForgetPassword.self, from: response.data!)
                     completion(responseModel, nil)
                 } catch (let error) {
                     print(error.localizedDescription)
                     completion(nil , error)
                 }
             case .failure(let error) :
                 print(error.localizedDescription)
                 completion(nil , error)
             }
         }
     } //Forget function
    
}
