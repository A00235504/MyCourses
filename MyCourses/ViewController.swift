//
//  ViewController.swift
//  MyCourses
//
//  Created by aakash sadnani on 22/07/21.
//


// view controller for home page

import Foundation
import UIKit

class TodoTableViewController: UITableViewController {
//    var todoList: TodoList!
    let userDefault = UserDefaults.standard
    let cellid = "cellid"
    
    var courses = [String]()
    @IBAction func reload(_ sender: Any) {
        tableView.reloadData()
    
    }
        
    @IBOutlet weak var labelnocourse: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        if(courses.isEmpty){
            labelnocourse.alpha = 1.0
        }
        else{
            labelnocourse.alpha = 0.0
        }
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellid)
        
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        courses = readIntData(key: "newkey")
        
        print(courses)
        
       
        let logoutbutton = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up.fill") , style: .done, target: self, action: #selector(logoutUser))
        
        navigationItem.rightBarButtonItems = [logoutbutton, editButtonItem ]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath)
        
        let course = self.courses[indexPath.row]
        cell.textLabel?.text = course
        return cell
    }
    
    func readIntData(key: String) -> Array<String>{
        if userDefault.object(forKey: key) == nil {
            let newArray = [String]()

            return newArray
        } else {
            //return userDefault.string(forKey: key)!
            return userDefault.stringArray(forKey: key) ?? [String]()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let rr = readIntData(key: "newkey")
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete){
            courses.remove(at: indexPath.item)
            tableView.deleteRows(at: [indexPath], with: .fade)
            writeAnyDataList(key: "newkey", value: courses)
            
            courses = readIntData(key: "newkey")
            
            tableView.reloadData()
            
        }
    }
    func writeAnyDataList(key: String , value: Array<String>){
        userDefault.set(value, forKey: key)
        userDefault.synchronize()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        courses = readIntData(key: "newkey")
        tableView.reloadData()
        if(courses.isEmpty){
            labelnocourse.alpha = 1.0
        }
        else{
            labelnocourse.alpha = 0.0
        }
    }
    
    @objc func logoutUser(){
        userDefault.set("", forKey: "username")
        let dest = storyboard?.instantiateViewController(identifier: "LoginPageViewController") as! LoginPageViewController
        navigationController?.pushViewController(dest, animated: true)
        
    }
}
