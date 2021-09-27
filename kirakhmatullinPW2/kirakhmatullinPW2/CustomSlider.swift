//
//  CustomSlider.swift
//  kirakhmatullinPW2
//
//  Created by Karim on 27.09.2021.
//

import Foundation
import UIKit
@IBDesignable
class CustomSlider: UISlider{
    func setSlider(){
        self.setThumbImage(UIImage(named: "pencil")?.withRenderingMode(.alwaysOriginal), for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.minimumValue = 0
        self.maximumValue = 1
    }
    @IBInspectable var thumbImage: UIImage? {
        didSet{
            setThumbImage(thumbImage, for: .normal)
        }
    }
    @IBInspectable var thumbHighlitghedImage: UIImage? {
        didSet{
            setThumbImage(thumbHighlitghedImage, for: .highlighted)
        }
    }
}
