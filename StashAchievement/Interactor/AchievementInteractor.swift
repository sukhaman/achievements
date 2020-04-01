//
//  AchievementInteractor.swift
//  StashAchievement
//
//  Created by SP Singh on 3/30/20.
//  Copyright © 2020 Sukhaman Singh. All rights reserved.
//

import Foundation
import Alamofire

class AchievementInteractor: PresentorToInteractorProtocol{
    
    
    var presenter: InteractorToPresenterProtocol?
    
    func fetchAchievements() {
        
        if let path = Bundle.main.path(forResource: "achievements", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                let response = try decoder.decode(AchievementResponse.self, from: data)
                guard let firstArticle = response.achievements else {
                    return
                }
                self.presenter?.achievementsFetched(achievements: firstArticle)
            }
            catch {
                
            }
        }
        
        
    }
    func fetchTitle() {
        
        if let path = Bundle.main.path(forResource: "achievements", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                let titleResponse = try decoder.decode(OverviewResponse.self, from: data)
                guard let strTitle = titleResponse.overview else {
                    return
                }
                self.presenter?.titleFetched(titleData: strTitle)
                
            }
            catch {
                
            }
        }
        
    }
    
    
}
