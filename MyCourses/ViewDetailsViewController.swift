//
//  ViewDetailsViewController.swift
//  MyCourses
//
//  Created by aakash sadnani on 05/08/21.
//

import Foundation
import UIKit

class ViewDetailsViewController: UIViewController {
    
    
    
    var mycourses: Courses!
    var image = UIImage()
    var name = ""
    var course: String!
    var titles: String!
    @IBOutlet weak var coursedescription: UILabel!
    
    @IBOutlet weak var coursedescriptionfulltext: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("second page")
       
        
        coursedescription.text = titles.description
        
        coursedescriptionfulltext.text = course.description
        
        
        
    }
    
    
//    override func viewDidLoad() {
//          super.viewDidLoad()
//          //lbl.text = "You selected \(name) for vote"
//          //img.image = image
//    } 
}

