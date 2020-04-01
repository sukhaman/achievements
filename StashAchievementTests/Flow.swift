//
//  Flow.swift
//  StashAchievementTests
//
//  Created by SP Singh on 3/31/20.
//  Copyright © 2020 Sukhaman Singh. All rights reserved.
//

import Foundation

protocol Router{}
class Flow {
    
    let router: Router
    init(router: Router) {
        self.router = router
    }
    
    func start() {
        
    }
    
}
