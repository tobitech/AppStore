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
    var type: String?
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "apps" {
            
            apps = [App]()
            for dict in value as! [[String: AnyObject]] {
                let app = App()
                app.setValuesForKeys(dict)
                apps?.append(app)
            }
            
        }
        else {
            super.setValue(value, forKey: key)
        }
    }
    
    static func fetchFeaturedApps(completionHandler: @escaping ([AppCategory]) -> ()) {
        
        let urlString = "http://www.statsallday.com/appstore/featured"

        URLSession.shared.dataTask(with: URL(string: urlString)!) { (data, response, error) in
            
            if error != nil {
                print(error!)
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: AnyObject]
                
                var appCategories = [AppCategory]()
                
                for dict in json["categories"] as! [[String: AnyObject]] {
                    
                    let appCategory = AppCategory()
                    appCategory.setValuesForKeys(dict)
                    appCategories.append(appCategory)
                    
                }
                
                DispatchQueue.main.async(execute: { () -> Void in
                    completionHandler(appCategories)
                })
                
            } catch let err {
                print(err)
            }
            
        }.resume()
        
    }
    
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
