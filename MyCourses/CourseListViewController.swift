//
//  CourseListViewController.swift
//  MyCourses
//
//  Created by aakash sadnani on 04/08/21.
//

import Foundation
import UIKit

class CoursesListViewController: UITableViewController {
    
    let cellid = "cellid"
    let userDefault = UserDefaults.standard
    let courses = ["HR","Technology","Science","Management"]
    
    var newlist = [String]()
    @IBAction func reload(_ sender: Any) {
        tableView.reloadData()
    
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellid)
        
        let getdata = readIntDataList(key: "newkey")
        
        if(getdata.count == 0){
            newlist = [String]()
        }
        else{
            newlist = getdata
        }
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("hello: \(courses[indexPath.item]) \(indexPath)")
        writeAnyData(key: "mykey", value: courses[indexPath.item])
        let tt = readIntData(key: "mykey")
        print(tt)
        
        if(!newlist.contains(courses[indexPath.item])){
            newlist.append(courses[indexPath.item])
            writeAnyDataList(key: "newkey", value: newlist)

        }
        
        
    }

    func writeAnyDataList(key: String , value: Array<String>){
//        userDefault.set(value, forKey: key)
        userDefault.set(value, forKey: key)
        userDefault.synchronize()
    }

    
    func writeAnyData(key: String, value: Any){
        userDefault.set(value, forKey: key)
        userDefault.synchronize()
    }
    
    func readIntData(key: String) -> String{
        if userDefault.object(forKey: key) == nil {
            return "error"
        } else {
            return userDefault.string(forKey: key)!
        }
    }

    func readIntDataList(key: String) -> Array<String>{
        if userDefault.object(forKey: key) == nil {
            let newArray = [String]()

            return newArray
        } else {
            //return userDefault.string(forKey: key)!
            return userDefault.stringArray(forKey: key) ?? [String]()
        }
    }

}

