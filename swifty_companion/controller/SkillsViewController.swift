//
//  SkillsViewController.swift
//  swifty_companion
//
//  Created by Yvann Martorana on 21/05/2021.
//

import UIKit

class SkillsViewController: UIViewController {

    var student:Student!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
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

extension SkillsViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return student.cursus_users?.skills?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SkillCell", for: indexPath) as? SkillTableViewCell else {return UITableViewCell()}
        let skillTab = student.cursus_users?.skills
        if (skillTab!.count > 0){
            let skill = skillTab![indexPath.row]
            cell.configure(name: skill.name ?? "", level: skill.level ?? 0)
            
        }
        return cell
    }
}
