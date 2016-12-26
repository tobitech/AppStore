//
//  Models.swift
//  MyAppStoreMockup
//
//  Created by Tobi Omotayo on 24/10/2016.
//  Copyright © 2016 Tobi Omotayo. All rights reserved.
//

import UIKit

class AppCategory: NSObject {
    
    var name: String?
    var apps: [App]?
    
    static func sampleAppsCategories() -> [AppCategory] {
        
        // first category
        let bestNewAppsCategory = AppCategory()
        bestNewAppsCategory.name = "Best New Apps"
        
        var apps = [App]()
        
        // logic
        let frozenApp = App()
        frozenApp.name = "Disney Build It: Frozen"
        frozenApp.imageName = "frozen"
        frozenApp.category = "Entertainment"
        frozenApp.price = NSNumber(floatLiteral: 3.99)
        
        apps.append(frozenApp)
        
        bestNewAppsCategory.apps = apps
        
        // second category
        let bestNewGamesCategory = AppCategory()
        bestNewGamesCategory.name = "Best New Games"
        
        var bestNewGamesApps = [App]()
        
        // logic
        let telePaintApp = App()
        telePaintApp.name = "Telepain"
        telePaintApp.imageName = "telepaint"
        telePaintApp.category = "Games"
        telePaintApp.price = NSNumber(floatLiteral: 2.99)
        
        bestNewGamesApps.append(telePaintApp)
        
        bestNewGamesCategory.apps = bestNewGamesApps
        
        
        return [bestNewAppsCategory, bestNewGamesCategory]
        
    }
    
}

class App: NSObject {
    var id: NSNumber?
    var name:String?
    var category: String?
    var imageName: String?
    var price: NSNumber?
}
