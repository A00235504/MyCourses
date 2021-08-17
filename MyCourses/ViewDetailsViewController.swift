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
        
        UIView.animate(withDuration: 2, delay: 0, options: [.curveEaseIn]){
            () -> Void in
            if self.coursedescriptionfulltext.alpha == 1{
                           self.coursedescriptionfulltext.alpha = 1
                
            }
                       else{
                        self.coursedescriptionfulltext.alpha = 0
                           
                       }
            //-self.view.frame.width
            self.view.layoutIfNeeded()
        }
        
    }
    

    
}

