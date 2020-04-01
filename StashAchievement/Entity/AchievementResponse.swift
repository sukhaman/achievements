//
//  AchievementResponse.swift
//  StashAchievement
//
//  Created by SP Singh on 3/30/20.
//  Copyright © 2020 Sukhaman Singh. All rights reserved.
//

import Foundation

struct AchievementResponse: Codable {
    
    let achievements: [AchievementModel]?
    
    enum CodingKeys: String, CodingKey {
        
        case achievements
    }
}
