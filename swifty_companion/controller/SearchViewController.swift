//
//  SearchViewController.swift
//  swifty_companion
//
//  Created by Yvann Martorana on 27/04/2021.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var studentSearchBar: UISearchBar!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var logo: UIImageView!
    var stud:Student!
    enum activityIndicatorState{
        case isHidden
        case isVisible
    }
    
    //MARK: - Switch indicator/logo during api call
    func setIndicatorState(state:activityIndicatorState){
        switch state{
            case .isHidden:
                activityIndicator.isHidden = true
                logo.isHidden = false
            case .isVisible:
                activityIndicator.isHidden = false
                logo.isHidden = true
    }
}
    
    //MARK: - Student Not Found Alert
    func studentNotFound(){
        let alert = UIAlertController(title: "Student Not Found", message: "Please enter a correct login", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
        studentSearchBar.text = ""
    }
    
    //MARK: - SearchBar DELEGATE to the Controller
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        studentSearchBar.resignFirstResponder()
        if (searchBar.text?.isAlphanumeric == true){
            self.setIndicatorState(state: .isVisible)
            RequestApi.getStudent(name:searchBar.text!){(success, student) in
            if success, let student = student{
                self.studentSearchBar.text = ""
                self.stud = student
                self.setIndicatorState(state: .isHidden)
                self.performSegue(withIdentifier: "segueToStudent", sender: nil)
            } else {
                self.stud = nil
                self.setIndicatorState(state: .isHidden)
                self.studentNotFound()
            }
            
            }
        }
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        studentSearchBar.resignFirstResponder()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToStudent"{
            let tabVC = segue.destination as! UITabBarController
            
            let studentVC = tabVC.viewControllers!.first as! StudentViewController
            let skillsVc = tabVC.viewControllers![1] as! SkillsViewController
            let projectsVC = tabVC.viewControllers![2] as! ProjectsViewController
            studentVC.student = stud
            skillsVc.student = stud
            projectsVC.student = stud
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setIndicatorState(state: .isHidden)
        let attrs = [
            NSAttributedString.Key.font: UIFont(name:"Futura Medium Italic", size: 24),
            NSAttributedString.Key.foregroundColor: UIColor.turquoise
        ]
        self.navigationController?.navigationBar.titleTextAttributes = attrs as [NSAttributedString.Key : Any]
        
        studentSearchBar.autocapitalizationType = .none
    }
    

    

}
