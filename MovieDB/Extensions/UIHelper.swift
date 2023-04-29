//
//  UIHelper.swift
//  MovieDB
//
//  Created by Cuma Haznedar on 29/04/2023.
//

import UIKit

enum UIHelper {
    static func createHomeFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let itemWidth = CGFloat.dWidth
        
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: itemWidth - 20, height: itemWidth * 1.4)
        layout.minimumLineSpacing = 20
        
        return layout
    }
}
