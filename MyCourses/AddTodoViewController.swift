//
//  AddTodoViewController.swift
//  TodoList
//
//  Created by Josh Cambrian on 2021-07-14.
//

import UIKit

class AddTodoViewController: UIViewController {
    
    @IBOutlet weak var todoTitle: UITextField!
    
    var todoList: TodoList!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        self.navigationItem
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        todoList.list.append(Todo(title: todoTitle.text!))
        todoList.save()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
