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
        
        if let name = app?.name {
            let rect = NSString(string: name).boundingRect(with: CGSize(width: frame.width, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 14)], context: nil)
            if rect.height > 20 {
            }
            else {
                categoryLabel.frame = CGRect(x: 0, y: frame.width + 22, width: frame.width, height: 20)
                priceLabel.frame = CGRect(x: 0, y: frame.width + 22, width: frame.width, height: 20)
            }
            
            titleLabel.sizeToFit()
        }
        
        
        
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
