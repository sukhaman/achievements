//
//  NavigationBuilder.swift
//  StashAchievement
//
//  Created by SP Singh on 3/30/20.
//  Copyright © 2020 Sukhaman Singh. All rights reserved.
//

import UIKit

typealias NavigationFactory = (UIViewController) -> (UINavigationController)
class NavigationBuilder {
    
    static func build(rootView: UIViewController) -> UINavigationController  {
        
        let textStyleAttributes: [NSAttributedString.Key: Any] = [.foregroundColor : UIColor.white, .font: UIFont.init(name: "Apple SD Gothic Neo", size: 17)!]
        
        
        
        let navigationController = UINavigationController(rootViewController: rootView)
        navigationController.navigationBar.barTintColor =  Utilities().hexStringToUIColor(hex: "#613ec6")
        navigationController.navigationBar.tintColor = Utilities().hexStringToUIColor(hex: "#FFFFFF")
        navigationController.navigationBar.titleTextAttributes = textStyleAttributes
       
        
        navigationController.navigationBar.isTranslucent = false
        
        
        return navigationController
    }
    
}

