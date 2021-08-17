//
//  LoginPageViewController.swift
//  MyCourses
//
//  Created by aakash sadnani on 28/07/21.
//

import Foundation
import UIKit

class LoginPageViewController: UIViewController {
    
    
    let userDefault = UserDefaults.standard
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        let data = readData(key: "username")
        if (data.isEmpty){
            print("error")
        }
        else{
            let dest = storyboard?.instantiateViewController(identifier: "TodoTableView") as! TodoTableViewController
            
            navigationController?.pushViewController(dest, animated: true)
        }
    }
    
    @IBAction func LoginGo(_ sender: Any) {
        print(username.text!)
        
        if(username.text! == "Test" && password.text == "Test"){
            let dest = storyboard?.instantiateViewController(identifier: "TodoTableView") as! TodoTableViewController
            
            navigationController?.pushViewController(dest, animated: true)
            writeAnyDataList(key: "username" ,value: username.text!)
        }
        else{
            print("Login Error!")
            let alertController = UIAlertController(title: NSLocalizedString("Login Error!",comment:""), message: NSLocalizedString("Try Again",comment:""), preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: NSLocalizedString("Ok", comment: ""), style: .default, handler: { (pAlert) in
                self.username.text = ""
                self.password.text = ""
            })
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    func writeAnyDataList(key: String , value: String){
        userDefault.set(value, forKey: key)
        userDefault.synchronize()
    }
    
    func readData(key: String) -> String{
        if userDefault.object(forKey: key) == nil {
            let value = ""
            return value
        } else {
            return userDefault.string(forKey: key) ?? ""
        }
    }
    
}

