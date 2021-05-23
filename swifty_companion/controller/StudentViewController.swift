//
//  StudentViewController.swift
//  swifty_companion
//
//  Created by Yvann Martorana on 18/05/2021.
//

import UIKit

class StudentViewController: UIViewController {
    
    var student:Student!
    @IBOutlet weak var studentPics: UIImageView!
    
    @IBOutlet weak var login: UILabel!
    @IBOutlet weak var full_name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var grade: UILabel!
    @IBOutlet weak var correctionPoints: UILabel!
    @IBOutlet weak var wallet: UILabel!
    @IBOutlet weak var level: UILabel!
    @IBOutlet weak var levelProgressBar: UIProgressView!
    
    private func setData(){
        login.text = student.login
        full_name.text = student.usual_full_name
        email.text = student.email
        grade.text = student.cursus_users?.grade
        correctionPoints.text = String(student.correction_point!)
        wallet.text = String(student.wallet!) + " \u{20B3}"
        level.text = "\(student.cursus_users?.level ?? 0.00)"
        let levelArray = level.text?.components(separatedBy: ".")
        let progressString:String = levelArray?[1] ?? "0"
        let progress:Float = Float(progressString) ?? 0
        levelProgressBar.progress = progress / 100
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: student.image_url ?? "")!

           // Create Data Task
           let dataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, _, _) in
               if let data = data {
                   DispatchQueue.main.async {
                       // Create Image and Update Image View
                       self?.studentPics.image = UIImage(data: data)
                   }
               }
           }

           // Start Data Task
           dataTask.resume()
        studentPics.circle()
        setData()
       }
}
