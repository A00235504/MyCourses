//
//  ViewDetailsViewController.swift
//  MyCourses
//
//  Created by aakash sadnani on 05/08/21.
//

import Foundation
import UIKit

class ViewDetailsViewController: UIViewController {
    
    //initialization
    var mycourses: Courses!
    var course: String!
    var titles: String!
    var code: String!
    var professor: String!
    
    //connections of labels
    @IBOutlet weak var coursedescription: UILabel!
    
    @IBOutlet weak var coursedescriptionfulltext: UILabel!
    
    @IBOutlet weak var courseprofessorcode: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setting data to the labels
        coursedescription.text = titles.description
        coursedescription.lineBreakMode = NSLineBreakMode.byWordWrapping
        coursedescription.numberOfLines = 0
        
        courseprofessorcode.text = "Professor: \(professor.description)" + "\n\n" + "Course Code: \(code.description)"
        courseprofessorcode.lineBreakMode = NSLineBreakMode.byWordWrapping
        courseprofessorcode.numberOfLines = 0

        
        coursedescriptionfulltext.text = course.description
        
        coursedescriptionfulltext.lineBreakMode = NSLineBreakMode.byWordWrapping
        coursedescriptionfulltext.numberOfLines = 0
        
        //animating the label
        UIView.animate(withDuration: 2, delay: 0, options: [.curveEaseIn]){
            () -> Void in
            if self.coursedescriptionfulltext.alpha == 1{
                self.coursedescriptionfulltext.alpha = 1
                
            }
            else{
                self.coursedescriptionfulltext.alpha = 0
                
            }
            
            self.view.layoutIfNeeded()
        }
        
    }
    
    
    
}

