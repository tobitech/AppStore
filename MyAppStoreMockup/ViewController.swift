//
//  ViewController.swift
//  MyAppStoreMockup
//
//  Created by Tobi Omotayo on 23/10/2016.
//  Copyright © 2016 Tobi Omotayo. All rights reserved.
//

import UIKit

class FeaturedAppsController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    private let cellId = "cellId"
    
    // create a structure to power the categories
    var appCategories = [AppCategory]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appCategories = AppCategory.sampleAppsCategories()
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CategoryCell
        cell.setupViews()
        
        cell.appCategory = appCategories[indexPath.item]
        cell.setupViews()
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 230)
    }
    
}
