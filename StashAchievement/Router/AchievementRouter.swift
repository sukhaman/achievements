//
//  AchievementRouter.swift
//  StashAchievement
//
//  Created by SP Singh on 3/30/20.
//  Copyright © 2020 Sukhaman Singh. All rights reserved.
//

import Foundation
import UIKit

class AchievementRouter: PresenterToRouterProtocol{
    
    
    
    class func createModule(usingNavigationFactory factory: NavigationFactory) ->UIViewController{
        let view = mainstoryboard.instantiateViewController(withIdentifier: "achievementlevelVC") as? AchievementLevelVC
        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = AchievementPresenter()
        let interactor: PresentorToInteractorProtocol = AchievementInteractor()
        let router: PresenterToRouterProtocol = AchievementRouter()
        
        view?.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return factory(view!)
        
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main) 
    }
}
