//
//  Utilities.swift
//  StashAchievement
//
//  Created by SP Singh on 3/31/20.
//  Copyright © 2020 Sukhaman Singh. All rights reserved.
//

import UIKit

class Utilities: NSObject {
    func showAlertContrller(strTitle:String, strMessage: String) -> UIAlertController {
        if (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad)
        {
            let alertController = UIAlertController(title: strTitle, message: strMessage, preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            let titleFont = [NSAttributedString.Key.font: UIFont(name: "Apple SD Gothic Neo", size: 18.0)!]
            let messageFont = [NSAttributedString.Key.font: UIFont(name: "Apple SD Gothic Neo", size: 16.0)!]
            
            let titleAttrString = NSMutableAttributedString(string: strTitle, attributes: titleFont)
            let messageAttrString = NSMutableAttributedString(string: strMessage, attributes: messageFont)
            
            alertController.setValue(titleAttrString, forKey: "attributedTitle")
            alertController.setValue(messageAttrString, forKey: "attributedMessage")
            alertController.addAction(alertAction)
            return alertController
        }
        else
        {
            let alertController = UIAlertController(title: strTitle, message: strMessage, preferredStyle: .actionSheet)
            let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            let titleFont = [NSAttributedString.Key.font: UIFont(name: "Apple SD Gothic Neo", size: 18.0)!]
            let messageFont = [NSAttributedString.Key.font: UIFont(name: "Apple SD Gothic Neo", size: 16.0)!]
            
            let titleAttrString = NSMutableAttributedString(string: strTitle, attributes: titleFont)
            let messageAttrString = NSMutableAttributedString(string: strMessage, attributes: messageFont)
            
            alertController.setValue(titleAttrString, forKey: "attributedTitle")
            alertController.setValue(messageAttrString, forKey: "attributedMessage")
            alertController.addAction(alertAction)
            return alertController
        }
        
    }
    func ShowAlertMessages(strTitle:String, strMessage:String) -> UIAlertController
    {
        let alertController = UIAlertController(title: strTitle, message: strMessage, preferredStyle: .alert)
        
        let actionOK = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
        }
        let titleFont = [NSAttributedString.Key.font: UIFont(name: "Apple SD Gothic Neo", size: 18.0)!]
        let messageFont = [NSAttributedString.Key.font: UIFont(name: "Apple SD Gothic Neo", size: 16.0)!]
        
        let titleAttrString = NSMutableAttributedString(string: strTitle, attributes: titleFont)
        let messageAttrString = NSMutableAttributedString(string: strMessage, attributes: messageFont)
        
        alertController.setValue(titleAttrString, forKey: "attributedTitle")
        alertController.setValue(messageAttrString, forKey: "attributedMessage")
        alertController.addAction(actionOK)
        return alertController
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    func isValidPassword(PwdStr:String) -> Bool {
        //let passwordRegEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{10,}"
        let passwordRegEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[A-Za-z\\d$@$!%*?&]{8,}"
        //NSString *regex = @"^(?=.{10,})(?=.*[0-9])(?=.*[a-zA-Z])([@#$%^&=a-zA-Z0-9_-]+)$";
        let passwordTest = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return passwordTest.evaluate(with: PwdStr)
    }
}
extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
extension String {
 
    internal func substring(start: Int, offsetBy: Int) -> String? {
        guard let substringStartIndex = self.index(startIndex, offsetBy: start, limitedBy: endIndex) else {
            return nil
        }
        
        guard let substringEndIndex = self.index(startIndex, offsetBy: start + offsetBy, limitedBy: endIndex) else {
            return nil
        }
        
        return String(self[substringStartIndex ..< substringEndIndex])
    }
}
