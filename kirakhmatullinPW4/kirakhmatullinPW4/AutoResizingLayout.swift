//
//  AutoResizingLayout.swift
//  kirakhmatullinPW4
//
//  Created by Karim on 22.10.2021.
//

import Foundation
import UIKit
class AutoResizingLayout: UICollectionViewFlowLayout {
    // Вычисляет максимальную длину ячейки по значениям границ
    func widestCellWidth(bounds: CGRect) -> CGFloat {
        guard let collectionView = collectionView else {
            return 0
        }

        let insets = collectionView.contentInset
        let width = bounds.width - insets.left - insets.right
        
        if width < 0 { return 0 }
        else { return width }
    }
    
    // Пересчитывает estimatedItemSize для данных границ
    func updateEstimatedItemSize(bounds: CGRect) {
        estimatedItemSize = CGSize(
            width: widestCellWidth(bounds: bounds),
            height: 200
        )
    }

    // Устанавливает начальный estimatedItemSize
    override func prepare() {
        super.prepare()

        let bounds = collectionView?.bounds ?? .zero
        updateEstimatedItemSize(bounds: bounds)
    }
    
    // Меняет estimatedItemSize при изменении collectionView.bounds
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        guard let collectionView = collectionView else {
            return false
        }
        
        let oldSize = collectionView.bounds.size
        guard oldSize != newBounds.size else { return false }
        
        updateEstimatedItemSize(bounds: newBounds)
        return true
    }
}
