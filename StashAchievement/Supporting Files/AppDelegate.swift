//
//  AppDelegate.swift
//  StashAchievement
//
//  Created by SP Singh on 3/30/20.
//  Copyright © 2020 Sukhaman Singh. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let achievementVC = AchievementRouter.createModule(usingNavigationFactory: NavigationBuilder.build)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = achievementVC
        window?.makeKeyAndVisible()
        
        return true
    }
    
    
    
    
}

