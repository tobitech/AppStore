//
//  Header.swift
//  MyAppStoreMockup
//
//  Created by Tobi Omotayo on 04/01/2017.
//  Copyright © 2017 Tobi Omotayo. All rights reserved.
//

import UIKit

class Header: CategoryCell {
    
    private let cellId = "bannerCellId"
    
    override func setupViews() {
        appsCollectionView.dataSource = self
        appsCollectionView.delegate = self
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! BannerCell
        cell.app = appCategory?.apps?[indexPath.row]
        
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 180)
    }
}

class BannerCell: AppCell {
    override func setupViews() {
        imageView.image = UIImage(named: (app?.imageName)!)
        imageView.layer.cornerRadius = 16
        imageView.layer.masksToBounds = true
    }
}
