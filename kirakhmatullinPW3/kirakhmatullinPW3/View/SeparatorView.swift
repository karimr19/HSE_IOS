//
//  SeparatorView.swift
//  kirakhmatullinPW3
//
//  Created by Karim on 06.10.2021.
//

import Foundation
import UIKit

final class SeparatorView: UIView {
    func setUpSeparatorView(leftAnchor: NSLayoutXAxisAnchor, rightAnchor: NSLayoutXAxisAnchor) {
        setHeight(to: 1)
        // pinTop(to:topAnchor, 36)
        pinLeft(to: leftAnchor)
        pinRight(to: rightAnchor)
        backgroundColor = .darkGray
    }
}
