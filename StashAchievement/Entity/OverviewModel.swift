//
//  OverviewModel.swift
//  StashAchievement
//
//  Created by SP Singh on 3/31/20.
//  Copyright © 2020 Sukhaman Singh. All rights reserved.
//

import Foundation

struct OverviewModel: Codable {
    
    let title: String?
    
    
    
    enum CodingKeys: String, CodingKey {
        
        case title
        
        
        
    }
    
}
