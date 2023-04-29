//
//  UICollectionView+Ext.swift
//  MovieDB
//
//  Created by Cuma Haznedar on 29/04/2023.
//

import UIKit

extension UICollectionView {
    func reloadOnMainThread() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}
