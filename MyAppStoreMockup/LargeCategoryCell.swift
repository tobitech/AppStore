//
//  LargeCategoryCell.swift
//  MyAppStoreMockup
//
//  Created by Tobi Omotayo on 04/01/2017.
//  Copyright © 2017 Tobi Omotayo. All rights reserved.
//

import UIKit

class LargeCategoryCell: CategoryCell {

    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 100)
    }

}
