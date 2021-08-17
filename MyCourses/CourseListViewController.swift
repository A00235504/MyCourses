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
    var courses = [Courses]()
    
    var mycourses: Courses!
    
    var newlist = [String]()
    @IBAction func reload(_ sender: Any) {
        tableView.reloadData()
    
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        courses.append(Courses(name: "Business Analytics", desc: "Become a data storyteller and explore how to become a business analyst.In this Business Analytics program, you will complete a series of data analysis courses that will set you up to become a specialist in managing, interpreting, analyzing, and presenting data to support decision-making processes in all types and sizes of organizations. You’ll gain the skills to help organizations make more informed decisions, predict trends, and better understand the needs of their customers by working independently or with IT teams to mine data from primary and secondary sources, analyze and interpret results, pinpoint and predict trends, provide concise reports, and design, create, and maintain databases. You have the flexibility to study Business Analytics in-class or online so you can continue to work and earn while you learn."))
        
        courses.append(Courses(name: "Human Resources Management", desc: "Human resources professionals know all too well that a company is only as good as the people it employs. Earn your certificate in Human Resources, and you’ll have the skills and experience to become a Certified Human Resources Professional (CHRP) by exploring recruiting opportunities, challenges, and strategies; organizational management; labour relations, and more. The curriculum in Human Resources Management is designed to boost your existing qualifications and to support you if you intend to pursue your Certified Human Resources Professional (CHRP) designation. The nine core courses required to access the National Knowledge Exam (NKE) are approved by the Ontario Human Resources Professionals Association. Additional courses include mediation, practitioner seminars, and an eight-week placement in a professional human resources environment. Information on the Human Resources Professionals Association and the CHRP designation is available by visiting hrpa.ca ."))
        
        courses.append(Courses(name: "International Business Management", desc: "If you're interested in pursuing a career in global business management, this intensive program with its extensive business management courses will enable you to explore key areas of \"international business management, including marketing, finance, and supply chains. You will develop the core skills required to effectively manage the aspects of international business activities for an organization and gain hands-on experience during a placement in your third semester."))
                        
        courses.append(Courses(name: "IT Business Analysis", desc: "This intensive program will enable you to advance businesses at the strategic, tactical, and operational levels by improving processes, products, and services through the use of technology. You will gain a thorough understanding of how to perform elicitations, write specifications, create and use models, evaluate opportunities, analyze information, negotiate deals, provide quality assurance, and work through difficult situations. You will also develop exceptional communication, leadership, problem-solving, planning, and critical thinking skills to become a valuable professional who is confident in bridging the gap between business and technology. Students graduating from this program will be familiar with the global standards for Business Analysis as defined by the IIBA© and BABOK®."))
        
        courses.append(Courses(name: "Mobile Application Development", desc: "The Mobile Application Development – Graduate Certificate program and its app developer courses will prepare you for entry into the exciting and rapidly changing field of mobile app development for iOS and Android platforms. In the first two semesters of this program, you'll learn and apply the fundamentals of web and mobile application development for smartphones and tablets. You'll also develop essential programming skills required for rapidly changing mobile applications. In semester three, you'll be provided with a field placement to get hands-on experience as a professional app developer and build industry connections."))
        
        courses.append(Courses(name: "Organization Management", desc: "Maximize your leadership potential by team organizational management skills through this one-year program. You will take a series of carefully selected business management courses that will build and enhance your skills in critical areas such as finance, marketing, human resources, and leadership. These courses are designed to enhance your employability and career advancement in coveted business management and organizational management jobs. This program features a hybrid delivery of in-class and online courses."))
        
        courses.append(Courses(name: "Project Management", desc: "Project management has become a sought-after skill set across industries as businesses and organizations continue to look for efficiencies and overall effectiveness in order to successfully compete in domestic and global markets. For those pursuing a certificate in project management, Cambrian College’s one-year (two semester) Project Management – Graduate Certificate program will provide you with the essential theoretical and practical knowledge, skills, and techniques to successfully plan, implement, manage, and evaluate projects. Graduates will have all the tools for project management they need to succeed in the workplace. The curriculum is closely aligned to, but not affiliated with, the Project Management Institute’s (PMI) Project Management Body of Knowledge (PMBOK). To learn more about becoming a certified project management professional, please visit the PMI’s website."))
        
        courses.append(Courses(name: "Public Relations", desc: "World-renowned business mogul Warren Buffett once said, “It takes 20 years to build a reputation and five minutes to ruin it.” In just eight months, you’ll learn how to communicate effectively, build relationships, and manage internal and external forces in order to maintain and enhance reputations for all types and sizes of organizations. You will learn the ropes of the public relations industry through classes, labs, and hands-on assignments and gain the range of skills you need to be a great communicator, including: \n1.Media relations \n2.Event planning and execution\n3.Speechwriting and presenting\n4.Writing for web, social media, print, and broadcast\n5.Photography and podcast production\n6.Strategic communications planning \n\nThis program is delivered as a combination of online or virtual courses, classroom experiences, and practical experiences, giving you the flexibility to learn from the convenience of your home community."))
        
        courses.append(Courses(name: "Supply Chain Management", desc: "Cambrian’s Supply Chain Management graduate certificate program puts you at the centre of global business logistics. You will learn to analyze business processes in the marketplace, develop product/service demand forecasts, assess supplier needs and capabilities, and develop production plans and schedules utilizing current technology such as Systems, Applications, and Products in data processing (SAP).You will also explore various industry-standard approaches and models such as Six Sigma, Lean, and Total Quality Management, and their application to supply chain management strategies and problem solving."))
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.delegate = self
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
        cell.textLabel?.text = course.name
        
        cell.accessoryType = .detailDisclosureButton
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("hello: \(courses[indexPath.item]) \(indexPath)")
        writeAnyData(key: "mykey", value: courses[indexPath.item].name)
    
        if(!newlist.contains(courses[indexPath.item].name)){
            newlist.append(courses[indexPath.item].name)
            writeAnyDataList(key: "newkey", value: newlist)

        }
        
        
    }

    func writeAnyDataList(key: String , value: Array<String>){
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
    
    
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let dest = storyboard?.instantiateViewController(identifier: "DetailView") as! ViewDetailsViewController
        
        dest.course = courses[indexPath.row].desc
        
        dest.titles = courses[indexPath.row].name
        
        
        navigationController?.pushViewController(dest, animated: true)
    }

}

