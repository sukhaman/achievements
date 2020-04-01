//
//  AchievementProtocols.swift
//  StashAchievement
//
//  Created by SP Singh on 3/30/20.
//  Copyright © 2020 Sukhaman Singh. All rights reserved.
//

import Foundation
import UIKit

protocol PresenterToViewProtocol: class {
    func showAchievements(achievements: [AchievementModel])
    func showTitle(titleData: OverviewModel)
    func showError()
}

protocol InteractorToPresenterProtocol: class {
    func achievementsFetched(achievements: [AchievementModel])
    func titleFetched(titleData: OverviewModel)
    func achievementsFetchedFailed()
}

protocol PresentorToInteractorProtocol: class {
    var presenter: InteractorToPresenterProtocol? {get set}
    func fetchAchievements()
    func fetchTitle()
    
}

protocol ViewToPresenterProtocol: class {
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresentorToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    func updateView()
}

protocol PresenterToRouterProtocol: class {
    static func createModule(usingNavigationFactory factory: NavigationFactory) -> UIViewController
}
