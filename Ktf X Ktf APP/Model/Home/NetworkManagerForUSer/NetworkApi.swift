//
//  NetworkApi.swift
//  Ktf X Ktf APP
//
//  Created by Ahmed Saeed on 6/9/20.
//  Copyright © 2020 Ahmed Saeed. All rights reserved.
//

import Foundation
import Alamofire
struct NetworkingManager {
    static let shared: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 30
        let sessionManager = Alamofire.SessionManager(configuration: configuration)
        return sessionManager
    }()
}

class NetworkApi{
    class func postproblem (userInfoDict : [String:Any] , completion : @escaping( PostProblem? , Error?) -> ()) {
        let headers = ["Content-Type" : "application/json"  ,"Authorization": "Bearer \(NetworkHelper.getAccessToken() ?? "" )"
        ]
        Alamofire.request(creatpost, method: .post, parameters: userInfoDict, encoding: JSONEncoding.default, headers: headers).responseString { (response) in
            switch response.result {
            case .success :
                do {
                    let responseModel = try JSONDecoder().decode(PostProblem.self, from: response.data!)
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
    } // postproblem Function
    
    class func ShowInfo(completion : @escaping( UserData? , Error?) -> ()) {
        let headers = ["Content-Type" : "application/json"  ,"Authorization": "Bearer \(NetworkHelper.getAccessToken() ?? "" )"
        ]
        Alamofire.request(showinfo, method: .get, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            switch response.result {
            case .success :
                do {
                    let responseModel = try JSONDecoder().decode(UserData.self, from: response.data!)
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
    } // Show Info Function
    class func sendRequest<T: Decodable>( userImage: Data? = nil, method: HTTPMethod, url: String, parameters:[String:Any]? = nil, header: [String:String]?  = nil, completion: @escaping (_ error: Error?, _ response: T?)->Void) {
        NetworkingManager.shared.request(url, method: method, parameters: parameters, encoding: URLEncoding.default, headers: header)
            .responseJSON { res -> Void in
                print(res.result.value)
                switch res.result
                {
                case .failure(let error):
                    completion(error,nil)
                case .success(_):
                    if let dict = res.result.value as? Dictionary<String, Any>{
                        do{
                            guard let data = res.data else { return }
                            let response = try JSONDecoder().decode(T.self, from: data)
                            completion(nil,response)
                        }catch let err{
                            print("Error In Decode Data \(err.localizedDescription)")
                            completion(err,nil)
                        }
                    }else{
                        completion(nil,nil)
                    }
                }
        }
        
    }
    
    class func sendRequ<T: Decodable>( userImage: Data? = nil, method: HTTPMethod, url: String, parameters:[String:Any]? = nil, header: [String:String]?  = nil, completion: @escaping (_ error: Error?, _ response: T?)->Void) {
        NetworkingManager.shared.request(url, method: method, parameters: parameters, encoding: URLEncoding.default, headers: header)
            .responseJSON { res -> Void in
                print(res.result.value)
                switch res.result
                    
                {
                case .failure(let error):
                    completion(error,nil)
                case .success(_):
                    if let dict = res.result.value as? Dictionary<String, Any>{
                        guard let status = dict["status"] as? Bool else{return}
                        
                        do{
                            guard let data = res.data else { return }
                            let response = try JSONDecoder().decode(T.self, from: data)
                            completion(nil,response)
                        }catch let err{
                            print("Error In Decode Data \(err.localizedDescription)")
                            completion(err,nil)
                        }
                    }else{
                        completion(nil,nil)
                    }
                }
        }
        
    }
    
    
    class func Like(userInfoDict : [String:Any] , completion : @escaping( LikeModel? , Error?) -> ()) {
        let headers = ["Content-Type" : "application/json"  ,"Authorization": "Bearer \(NetworkHelper.getAccessToken() ?? "" )"
        ]
        Alamofire.request(like, method: .patch, parameters: userInfoDict, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            switch response.result {
            case .success :
                do {
                    let responseModel = try JSONDecoder().decode(LikeModel.self, from: response.data!)
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
    } // Like Function
        struct AcceptPost: Codable {
            let msg: String
            let status: Bool
        }

      class func Aprrove(userInfoDict : [String:Any] , completion : @escaping( AcceptPost? , Error?) -> ()) {
        let headers = ["Content-Type" : "application/json"  ,"Authorization": "Bearer \(NetworkHelper.getAccessToken() ?? "" )"
        ]
        Alamofire.request(accept, method: .patch, parameters: userInfoDict, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            switch response.result {
            case .success :
                do {
                    let responseModel = try JSONDecoder().decode(AcceptPost.self, from: response.data!)
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
    } // Aprrove Function

    class func Delet(userInfoDict : [String:Any] , completion : @escaping( DeletMpdel? , Error?) -> ()) {
        let headers = ["Content-Type" : "application/json"  ,"Authorization": "Bearer \(NetworkHelper.getAccessToken() ?? "" )"
        ]
        Alamofire.request(delet, method: .delete, parameters: userInfoDict, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            switch response.result {
                
            case .success :
                do {
                    let responseModel = try JSONDecoder().decode(DeletMpdel.self, from: response.data!)
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
    } // Delet Function
    
    
    
    class func solved(userInfoDict : [String:Any] , completion : @escaping( SolvedModel? , Error?) -> ()) {
        let headers = ["Content-Type" : "application/json"  ,"Authorization": "Bearer \(NetworkHelper.getAccessToken() ?? "" )"
        ]
        Alamofire.request(solved_problem, method: .patch , parameters: userInfoDict, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            switch response.result {
            case .success :
                do {
                    let responseModel = try JSONDecoder().decode(SolvedModel.self, from: response.data!)
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
    } // Delet Function
   
   class func EditPost (userInfoDict : [String:Any] , completion : @escaping(EditPos? , Error?) -> ()) {
         
     let jsonString = """
          {
          "post": {
          "likes": 0,
          "solved": false,
          "approved": true,
          "_id": "5ed4374625ad5c00041dee3e",
          "name": "hany",
          "address": "haram",
          "phone": "01149611906",
          "details": "balblablablabl",
          "section": "food",
          "userId": "5ed0149d901f950004d09d68",
          "created_at": "2020-05-31T23:01:26.421Z",
          "updatedAt": "2020-06-01T03:07:34.561Z",
          "__v": 0
          },
          "status": true
          }
          """
    let headers = ["Content-Type" : "application/json"  ,"Authorization": "Bearer \(NetworkHelper.getAccessToken() ?? "" )"
           ]
                     
    Alamofire.request(edit_post, method: .put, parameters: userInfoDict, encoding: JSONEncoding.default, headers: headers).responseString { (response) in


             switch response.result {
             case .success :
                 
                 

                 do {
                     
                     let jsonData =  jsonString.data(using: .utf8)!
                     let responseModel = try JSONDecoder().decode(EditPos.self, from: jsonData)
                     print(responseModel)
                     

                     completion(responseModel , nil)
                 } catch (let error) {
                     print(error)
                     completion(nil , error)
                 }
             case .failure(let error) :
                 print(error)
                 completion(nil , error)
            }
         }
     } // // EditPost Function
    class func UpdatePost (userInfoDict : [String:Any] , completion : @escaping(Update? , Error?) -> ()) {
         
     let jsonString = """
          {
              "msg": "User information is updated successfully!",
              "status": true
          }
          """
    let headers = ["Content-Type" : "application/json"  ,"Authorization": "Bearer \(NetworkHelper.getAccessToken() ?? "" )"
           ]
                     
    Alamofire.request(update, method: .put, parameters: userInfoDict, encoding: JSONEncoding.default, headers: headers).responseString { (response) in


             switch response.result {
             case .success :
                 
                 

                 do {
                     
                     let jsonData =  jsonString.data(using: .utf8)!
                     let responseModel = try JSONDecoder().decode(Update.self, from: jsonData)
                     print(responseModel)
                     

                     completion(responseModel , nil)
                 } catch (let error) {
                     print(error)
                     completion(nil , error)
                 }
             case .failure(let error) :
                 print(error)
                 completion(nil , error)
            }
         }
     } // // UpdatePost Function
    
 
}


