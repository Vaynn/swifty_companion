//
//  SearchViewController.swift
//  swifty_companion
//
//  Created by Yvann Martorana on 27/04/2021.
//

import UIKit

class SearchViewController: UIViewController {

    
    @IBAction func test() {
        RequestApi.getStudent{ (success, student) in
            if success, let student = student{
                print(student)
            } else {
                print("loose")
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
