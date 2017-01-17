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
    private let largeCellId = "largeCellId"
    private let headerId = "headerId"
    
    // create a structure to power the categories
    var appCategories = [AppCategory]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        appCategories = AppCategory.sampleAppsCategories()
        AppCategory.fetchFeaturedApps { (appCategories) in
            
            self.appCategories = appCategories
            
            self.collectionView?.reloadData()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: largeCellId, for: indexPath) as! LargeCategoryCell
            cell.appCategory = appCategories[indexPath.item]
            cell.setupViews()
            cell.featuredAppsController = self
            
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CategoryCell
        cell.setupViews()
        
        cell.appCategory = appCategories[indexPath.item]
        cell.setupViews()
        cell.featuredAppsController = self
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.row == 2 {
            return CGSize(width: view.frame.size.width, height: 160)
        }
        
        return CGSize(width: view.frame.size.width, height: 230)
    }
    
    /*
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        // return 150
    }
    */
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! Header
        header.appCategory = appCategories.first
        header.setupViews()
        
        return header
    }
    
    func showAppDetailForApp(app: App) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let appDetailController = storyboard.instantiateViewController(withIdentifier: "appDetails") as! AppDetailController
        appDetailController.app = app
        navigationController?.pushViewController(appDetailController, animated: true)
        
    }

    
}




