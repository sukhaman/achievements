//
//  AchievementPresenter.swift
//  StashAchievement
//
//  Created by SP Singh on 3/30/20.
//  Copyright © 2020 Sukhaman Singh. All rights reserved.
//

class AchievementPresenter: ViewToPresenterProtocol {
    
    var view: PresenterToViewProtocol?
    var interactor: PresentorToInteractorProtocol?
    var router: PresenterToRouterProtocol?
    
    func updateView() {
        interactor?.fetchAchievements()
        interactor?.fetchTitle()
        
    }
}

extension AchievementPresenter: InteractorToPresenterProtocol {
    
    
    
    func achievementsFetched(achievements: [AchievementModel]) {
        view?.showAchievements(achievements: achievements)
    }
    
    func titleFetched(titleData: OverviewModel) {
        view?.showTitle(titleData: titleData)
       
    }
    
    func achievementsFetchedFailed(){
        view?.showError()
    }
}

