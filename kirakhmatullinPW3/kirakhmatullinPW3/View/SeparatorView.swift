//
//  SeparatorView.swift
//  kirakhmatullinPW3
//
//  Created by Karim on 06.10.2021.
//

import Foundation
import UIKit

final class SeparatorView: UIView {
    func setUpSeparatorView(topAnchor: NSLayoutYAxisAnchor, leftAnchor: NSLayoutXAxisAnchor, rightAnchor: NSLayoutXAxisAnchor) {
        setHeight(to: 1)
        // pinTop(to:topAnchor, 36)
        pinTop(to:topAnchor)
        pinLeft(to: leftAnchor)
        pinRight(to: rightAnchor)
        backgroundColor = .darkGray
    }
}
