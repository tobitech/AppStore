//
//  ScreenshotsCell.swift
//  MyAppStoreMockup
//
//  Created by Tobi Omotayo on 17/01/2017.
//  Copyright © 2017 Tobi Omotayo. All rights reserved.
//

import UIKit

class ScreenshotsCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    var app: App? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    private let cellId = "cellId"
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    func setupViews() {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let count = app?.screenshots?.count {
            return count
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ScreenshotImageCell
        
        if let imageName = app?.screenshots?[indexPath.row] {
            cell.imageView.image = UIImage(named: imageName)
        }
        
        cell.setupViews()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 240, height: frame.height - 28)
    }
    
}


class ScreenshotImageCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    func setupViews() {
        
    }
    
}
