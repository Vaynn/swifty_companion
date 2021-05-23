//
//  Extensions.swift
//  swifty_companion
//
//  Created by Yvann Martorana on 18/05/2021.
//

import Foundation
import UIKit

extension String {
    var isAlphanumeric: Bool {
        return !isEmpty && range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
    }
}

extension UIColor {
    public class var turquoise: UIColor {
        return UIColor(red: 19/255, green: 155/255, blue: 165/255, alpha: 1.0)
    }
    
    public class var dark_gray: UIColor {
        return UIColor(red: 36/255, green: 41/255, blue: 50/255, alpha: 1.0)
    }
    
    public class var light_gray: UIColor {
        return UIColor(red: 51/255, green: 58/255, blue: 78/255, alpha: 1.0)
    }
    
    public class var grey_police: UIColor {
        return UIColor(red: 187/255, green: 188/255, blue: 190/255, alpha: 1.0)
    }
}

extension UIImageView{
    public func circle(){
        self.clipsToBounds = true
        self.layer.cornerRadius = self.bounds.width / 2
    }
}
