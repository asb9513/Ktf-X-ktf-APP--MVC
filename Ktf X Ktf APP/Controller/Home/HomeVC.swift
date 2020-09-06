//
//  HomeVC.swift
//  Ktf X Ktf APP
//
//  Created by Ahmed Saeed on 6/9/20.
//  Copyright © 2020 Ahmed Saeed. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    static func instance () -> HomeVC {
        let storyboard = UIStoryboard.init(name: "Home", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
    }
        @IBOutlet weak var HomeTV: UITableView!
        
        @IBOutlet var AlertView: UIView!
        
        @IBOutlet weak var AlertMssg: UITextView!
        
        var items = [TopProblemPost]()
    var transparentView = UIView()
    var tableView = UITableView()
    private var isfetcting = false
    let height: CGFloat = 250
     var settingArray = ["قسم الديون","قسم الطعام","قسم الملابس","اقسام اخري","الصفحه الرئيسيه"]

    override func viewDidLoad() {
            super.viewDidLoad()
            HomeTV.delegate = self
            HomeTV.dataSource = self
             loadproblem()
        tableView.isScrollEnabled = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "Cell")


        }
        
        
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == items.count - 1 {
            
        }
        func moreDare(){
            for _ in 0 ... 9 {
                items.append(items.last! )
            }
            tableView.reloadData()}
    }
    
        
        func loadproblem(){
            self.startLoading()
             NetworkApi.sendRequest(method: .get, url: baseurl, completion:
                {(err,response: TopProblem?) in
                    self.stopLoading()
                    
                    if err == nil{
                        guard let data = response?.posts else{return}
                        self.items = data
                        self.HomeTV.reloadData()
                      }
            })
            
        }
       @IBAction func RemoveSuccess(_ sender: Any) {
              AlertView.removeFromSuperview()
              
          }
    @IBAction func Menu(_ sender: Any) {
        let window = UIApplication.shared.keyWindow
        transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        transparentView.frame = self.view.frame
        window?.addSubview(transparentView)
        
        let screenSize = UIScreen.main.bounds.size
        tableView.frame = CGRect(x: 0, y: screenSize.height, width: screenSize.width, height: height)
        window?.addSubview(tableView)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onClickTransparentView))
        transparentView.addGestureRecognizer(tapGesture)
        
        transparentView.alpha = 0
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.transparentView.alpha = 0.5
            self.tableView.frame = CGRect(x: 0, y: screenSize.height - self.height, width: screenSize.width, height: self.height)
        }, completion: nil)
    }
    @objc func onClickTransparentView(){
            let screenSize = UIScreen.main.bounds.size

            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
                self.transparentView.alpha = 0
                self.tableView.frame = CGRect(x: 0, y: screenSize.height, width: screenSize.width, height: self.height)
            }, completion: nil)
        }
        
     }

    extension HomeVC:UITableViewDataSource,UITableViewDelegate {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if tableView == HomeTV {
            return items.count
            }
            else {
                return settingArray.count
            }
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if tableView == HomeTV {

            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as!
            HomeTableViewCell
            cell.NameProblem.text = " \(items[indexPath.row].name)"
            cell.DetailsProblem.text = items[indexPath.row].details
            DispatchQueue.main.async {

                 cell.configure(compines: self.items[indexPath.row])
             }
            
            cell.CallNow.tag = indexPath.row
            cell.CallNow.addTarget(self, action: #selector(subscribeTapped(_:)), for: .touchUpInside)
            if cell.DetailsProblem.text?.count ?? 0 > 50
            {
               cell.More.isEnabled = true
               cell.More.tag = indexPath.row
                cell.More.tag = indexPath.row
               cell.More.addTarget(self, action: #selector(subscri(_:)), for: .touchUpInside)
               self.AlertMssg.text = items[indexPath.row].details
            }
            else {
                cell.More.isHidden = true
                
            }
            
            return cell
            }
            else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CustomTableViewCell else {fatalError("Unable to deque cell")}
                cell.lbl.text = settingArray[indexPath.row]
                cell.settingImage.image = UIImage(named: settingArray[indexPath.row])!
                return cell
            }
        }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            if tableView == HomeTV {

            return 432
            }
            else {
                return 50

            }
        }
        @objc func subscribeTapped(_ sender: UIButton){
            // use the tag of button as index
            let youtuber = items[sender.tag]
            
            
            let url: NSURL = NSURL(string: "tel://\(youtuber.phone )")!
            if UIApplication.shared.canOpenURL(url as URL) {
                UIApplication.shared.openURL(url as URL)
            } else {
                print("Call failed")
            }
        }
        func ShowSuccess(){
            view.addSubview(self.AlertView)
            self.AlertView.center = view.center
        }
        @objc func subscri(_ sender: UIButton){
            ShowSuccess()
        }
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            onClickTransparentView()
            switch indexPath.row {
           
            case 0 :
            let Home = LoanVC.instance()
            Home.modalPresentationStyle = .fullScreen
            self.present(Home, animated: true, completion: nil)
            case 1:
                let Home = FoodVC.instance()
                          Home.modalPresentationStyle = .fullScreen
                          self.present(Home, animated: true, completion: nil)
            case 2:
                let Home = ClothesVC.instance()
                                    Home.modalPresentationStyle = .fullScreen
                                    self.present(Home, animated: true, completion: nil)
             
            case 3:
                let Home = OtherVC.instance()
                                                  Home.modalPresentationStyle = .fullScreen
                                                  self.present(Home, animated: true, completion: nil)
                
            case 4 :
                     let Home = MainTabBar.instance()
                     Home.modalPresentationStyle = .fullScreen
                     self.present(Home, animated: true, completion: nil)
            default:
            print("HI")
        }
        }
}
 
 
    
 
