//
//  CategoryCell.swift
//  MyAppStoreMockup
//
//  Created by Tobi Omotayo on 23/10/2016.
//  Copyright © 2016 Tobi Omotayo. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    
    var featuredAppsController: FeaturedAppsController?
    
    var appCategory: AppCategory?
        
        {
        
        didSet {
            /*
            if let name = appCategory?.name {
                nameLabel.text = name
            }
            */
            
            appsCollectionView.reloadData()
        }
    }

    private let cellId = "appCellId"
    @IBOutlet weak var appsCollectionView: UICollectionView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func setupViews() {
        backgroundColor = UIColor.clear

        if let name = appCategory?.name {
            nameLabel.text = name
        }
        
        appsCollectionView.delegate = self
        appsCollectionView.dataSource = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = appCategory?.apps?.count {
            return count
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let appCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppCell
        
        if let app = appCategory?.apps?[indexPath.item] {
            appCell.app = app
        }
        appCell.setupViews()
        return appCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let app = appCategory?.apps?[indexPath.row] {
            featuredAppsController?.showAppDetailForApp(app: app)
        }
        
        
        
    }

}






