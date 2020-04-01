//
//  AchievementLevelCell.swift
//  StashAchievement
//
//  Created by SP Singh on 3/30/20.
//  Copyright © 2020 Sukhaman Singh. All rights reserved.
//

import UIKit

class AchievementLevelCell: UITableViewCell {
    @IBOutlet weak var viewMain: UIView!
    @IBOutlet weak var imgBackground: UIImageView!
    @IBOutlet weak var viewLevel: UIView!
    @IBOutlet weak var lblLevelTitle: UILabel!
    @IBOutlet weak var lblLevelNumber: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var viewProgressPts: UIView!
    @IBOutlet weak var lblProgressPts: UILabel!
    @IBOutlet weak var lblTotalPts: UILabel!
    @IBOutlet weak var viewCover: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
