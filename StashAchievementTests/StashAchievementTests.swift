//
//  StashAchievementTests.swift
//  StashAchievementTests
//
//  Created by SP Singh on 3/30/20.
//  Copyright © 2020 Sukhaman Singh. All rights reserved.
//

import Foundation
import XCTest

@testable import StashAchievement

class StashAchievementTests: XCTestCase {
    
    var viewControllerUnderTest: AchievementLevelVC!
    var presenterUnderTest: AchievementPresenter!
    
    /// for data validation and data struct
    func testAchievementData() {
        
        if let path = Bundle.main.path(forResource: "achievements", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                guard let jsonResult = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {return}
                let successValue: Int = jsonResult["success"] as! Int
                let achievementArray: NSArray = jsonResult["achievements"] as! NSArray
                let overview: NSDictionary = jsonResult["overview"] as! NSDictionary
                let title: String = overview.value(forKey: "title") as! String
                for i in 0..<achievementArray.count {
                    
                    let array: NSDictionary = achievementArray[i] as! NSDictionary
                    
                    let level: String = array.value(forKey: "level") as! String
                    let imgString: String = array.value(forKey: "bg_image_url") as! String
                    let id: Int = array.value(forKey: "id") as! Int
                    let progress: Int = array.value(forKey: "progress") as! Int
                    let total: Int = array.value(forKey: "total") as! Int
                    
                    
                    XCTAssertNotEqual(level, "")
                    XCTAssertNotEqual(imgString, "")
                    XCTAssertNotEqual(id, 0)
                    XCTAssertGreaterThan(progress, -1)
                    XCTAssertLessThan(total, 51)
                    
                }
                
                
                XCTAssertEqual(successValue, 1)
                XCTAssertNotNil(achievementArray)
                
                XCTAssertEqual(title, "Smart Investing")
                
            }
            catch {
                
            }
        }
        
    }
    /// test for funtion output validation
    func testPointsString() {
        
        let score = 22
        let pts = score.pointsDisplay(points: score)

        XCTAssertEqual(pts, "22pts")
        
    }
    
    
}
