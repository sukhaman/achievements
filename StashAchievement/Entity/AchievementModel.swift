//
//  AchievementModel.swift
//  StashAchievement
//
//  Created by SP Singh on 3/30/20.
//  Copyright © 2020 Sukhaman Singh. All rights reserved.
//

import Foundation

struct AchievementModel: Codable {
    
    let id: Int?
    let level: String?
    let progress: Int?
    let total: Int?
    let bg_image_url: String?
    let accessible: Bool?
    
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case level
        case progress
        case total
        case bg_image_url
        case accessible
        
        
    }
    
}
