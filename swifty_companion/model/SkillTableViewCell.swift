//
//  SkillTableViewCell.swift
//  swifty_companion
//
//  Created by Yvann Martorana on 21/05/2021.
//

import UIKit

class SkillTableViewCell: UITableViewCell {
   
    @IBOutlet weak var skillName: UILabel!
    @IBOutlet weak var skillProgressBar: UIProgressView!
    @IBOutlet weak var skillLevel: UILabel!
    
    func configure(name:String, level:Double){
        skillName.text = name
        let levelBar = level / 20
        skillProgressBar.progress = Float(levelBar)
        skillLevel.text = "\(level)/20"
    }
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

   

}
