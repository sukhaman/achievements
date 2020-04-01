//
//  AchievementLevelVC.swift
//  StashAchievement
//
//  Created by SP Singh on 3/30/20.
//  Copyright © 2020 Sukhaman Singh. All rights reserved.
//

import UIKit
import SDWebImage


class AchievementLevelVC: UIViewController {
    
    @IBOutlet weak var tblAchievementLevel: UITableView!
    var presenter: ViewToPresenterProtocol?
    var achievementsData = [AchievementModel]()
    let cellSpacingHeight: CGFloat = 40
    var titleArray = [OverviewModel]()
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.updateView()
        let nib = UINib(nibName: "AchievementLevelCell", bundle: nil)
        tblAchievementLevel.register(nib, forCellReuseIdentifier: "achievementCell")
        tblAchievementLevel.tableFooterView = UIView()
        
    }
    
    
    
}

extension AchievementLevelVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return achievementsData.count
    }
    
    // There is just one row in every section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // Set the spacing between sections
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
    // Make the background color show through
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = Utilities().hexStringToUIColor(hex: "#FFFFFF")
        return headerView
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:AchievementLevelCell = self.tblAchievementLevel.dequeueReusableCell(withIdentifier: "achievementCell") as! AchievementLevelCell
        
        let achievement = achievementsData[indexPath.section]
        cell.lblLevelNumber.text = achievement.level
        if let urlString = achievement.bg_image_url {
            let imgURL: URL = URL(string: urlString)!
            cell.imgBackground.sd_setImage(with: imgURL, completed: nil)
        }
        
        let accessible = achievement.accessible
        
        
        if accessible == false {
            cell.viewCover.alpha = 0.55
        }
        else {
            cell.viewCover.alpha = 0
            
        }
        
        if let progressPoints = achievement.progress, let totalPoints = achievement.total {
            cell.progressView.progress = Float(progressPoints)/Float(totalPoints)
            cell.lblProgressPts.text = progressPoints.pointsDisplay(points: progressPoints)
            cell.lblTotalPts.text = totalPoints.pointsDisplay(points: totalPoints)
        }
        
        
        
        
        cell.progressView.layer.cornerRadius = 5
        cell.progressView.clipsToBounds = true
        cell.progressView.layer.sublayers![1].cornerRadius = 5
        cell.progressView.subviews[1].clipsToBounds = true
        
        cell.imgBackground.layer.cornerRadius = 10
        cell.imgBackground.layer.borderColor = Utilities().hexStringToUIColor(hex: "#00000000").cgColor
        cell.imgBackground.layer.borderWidth = 1
        
        cell.viewLevel.layer.cornerRadius = cell.viewLevel.frame.height/2
        cell.viewLevel.layer.borderColor = Utilities().hexStringToUIColor(hex: "#dcf0ef").cgColor
        cell.viewLevel.layer.borderWidth = 1
        
        
        
        cell.layer.borderColor = Utilities().hexStringToUIColor(hex: "#dcf0ef").cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 10
        cell.clipsToBounds = true
        
        
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // note that indexPath.section is used rather than indexPath.row
        
        let achievement = achievementsData[indexPath.section]
        let accessible = achievement.accessible
        
        if accessible == false {
            
        }
        else {
            
        }
        
    }
}


extension AchievementLevelVC: PresenterToViewProtocol {
    
    
    func showAchievements(achievements: [AchievementModel]) {
        
        achievementsData = achievements
        tblAchievementLevel.reloadData()
        
    }
    
    func showTitle(titleData: OverviewModel) {
        self.title = titleData.title
        
    }
    
    
    func showError() {
        
        self.present(Utilities().ShowAlertMessages(strTitle: "Alert", strMessage: "Problem Fetching Data"), animated: true, completion: nil)
        
        
    }
}

extension Int {
    
    func pointsDisplay(points: Int) -> String {
        
        
        
        return "\(points)pts"
    }
    
    
}
