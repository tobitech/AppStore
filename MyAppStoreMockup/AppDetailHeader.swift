//
//  AppDetailHeader.swift
//  MyAppStoreMockup
//
//  Created by Tobi Omotayo on 11/01/2017.
//  Copyright © 2017 Tobi Omotayo. All rights reserved.
//

import UIKit

class AppDetailHeader: UICollectionViewCell {
    
    var app: App? {
        didSet {
            self.imageView.image = UIImage(named: app!.imageName!)
            
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var appTitleLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    
    func setupViews() {
        self.imageView.layer.cornerRadius = 16
        appTitleLabel.text = app?.name
        buyButton.layer.borderColor = UIColor(colorLiteralRed: 0, green: 129/155, blue: 250/255, alpha: 1).cgColor
        buyButton.layer.borderWidth = 1
        buyButton.layer.cornerRadius = 5
        buyButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        if let price = app?.price?.stringValue {
            print(price)
            buyButton.setTitle("$\(price)", for: .normal)
        }
        else {
            buyButton.setTitle("GET", for: .normal)
        }
    }
}
