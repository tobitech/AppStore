//
//  AppCell.swift
//  MyAppStoreMockup
//
//  Created by Tobi Omotayo on 23/10/2016.
//  Copyright © 2016 Tobi Omotayo. All rights reserved.
//

import UIKit

class AppCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    func setupViews() {
        imageView.image = UIImage(named: "frozen")
        imageView.layer.cornerRadius = 16
        imageView.layer.masksToBounds = true
        titleLabel.text = "Disney Build it: Frozen"
        categoryLabel.text = "Entertainment"
        priceLabel.text = "$3.99"
    }
}
