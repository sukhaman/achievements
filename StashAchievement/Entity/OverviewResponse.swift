//
//  OverviewResponse.swift
//  StashAchievement
//
//  Created by SP Singh on 3/31/20.
//  Copyright © 2020 Sukhaman Singh. All rights reserved.
//

import Foundation

struct OverviewResponse: Codable {
    
    let overview: OverviewModel?
    
    enum CodingKeys: String, CodingKey {
        
        case overview
    }
}
