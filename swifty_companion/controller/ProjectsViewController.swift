//
//  ProjectsViewController.swift
//  swifty_companion
//
//  Created by Yvann Martorana on 21/05/2021.
//

import UIKit

class ProjectsViewController: UIViewController {
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

}

extension ProjectsViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return student.projects_users?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectCell", for: indexPath) as? ProjectTableViewCell else {
            return UITableViewCell()}
        let projectTab = student.projects_users?.sorted{$0.project!.slug! < $1.project!.slug!}
        if (projectTab!.count > 0){
            let project = projectTab![indexPath.row]
            let rate:String
            if (project.status != nil && project.status == "finished"){
                rate = "\(String(describing: project.final_mark!))/100"
            } else {
                rate = project.status?.replacingOccurrences(of: "_", with: " ").capitalized ?? ""
            }
            cell.configure(name: project.project?.slug ?? "", rate: rate)
            
        }
        return cell
    }
}
