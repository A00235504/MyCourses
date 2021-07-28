//
//  ViewController.swift
//  MyCourses
//
//  Created by aakash sadnani on 22/07/21.
//

import Foundation
import UIKit

class TodoTableViewController: UITableViewController {
//    var todoList: TodoList!
    
    let cellid = "cellid"
    
    let courses = ["HR","Technology","Science","Management"]
    @IBAction func reload(_ sender: Any) {
        tableView.reloadData()
    
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellid)
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
    
}
