//
//  AppCell.swift
//  MyAppStoreMockup
//
//  Created by Tobi Omotayo on 23/10/2016.
//  Copyright © 2016 Tobi Omotayo. All rights reserved.
//

import UIKit

class AppCell: UICollectionViewCell {
    
    var app: App?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    func setupViews() {
        imageView.image = UIImage(named: (app?.imageName)!)
        imageView.layer.cornerRadius = 16
        imageView.layer.masksToBounds = true
        titleLabel.text = app?.name
        categoryLabel.text = app?.category
        
        if let price = app?.price {
            priceLabel.text = "$\(price)"
        }
        else {
            priceLabel.text = ""
        }
    }
}
