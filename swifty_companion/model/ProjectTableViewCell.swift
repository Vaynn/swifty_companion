//
//  ProjectTableViewCell.swift
//  swifty_companion
//
//  Created by Yvann Martorana on 22/05/2021.
//

import UIKit

class ProjectTableViewCell: UITableViewCell {

    @IBOutlet weak var projectName: UILabel!
    @IBOutlet weak var projectRate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(name:String, rate:String){
        projectName.text = name.capitalized
        projectRate.text = "\(rate)"
    }
    /*override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }*/

}
