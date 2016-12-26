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
    
}

class App: NSObject {
    var id: NSNumber?
    var name:String?
    var categoty: String?
    var imageName: String?
    var price: String?
}
