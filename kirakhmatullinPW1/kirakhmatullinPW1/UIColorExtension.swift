//
//  UIColorExtension.swift
//  kirakhmatullinPW1
//
//  Created by Karim on 14.09.2021.
//

import Foundation
import UIKit

func generateRandomHexString() -> String{
    // Generating hex values for each color.
    let r = String(Int.random(in: 0...255), radix: 16)
    let g = String(Int.random(in: 0...255), radix: 16)
    let b = String(Int.random(in: 0...255), radix: 16)
    // Alpha should be maximum.
    return "#" + r + g + b
}
extension UIColor {

    convenience init?(hex: String) {
        // Strips string from new lines and whitespaces.
        var hexParsed = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        // Removes first "#" symbol.
        hexParsed = hexParsed.replacingOccurrences(of: "#", with: "")
        // Will store the hexadecimal value as an unsigned integer.
        var rgb: UInt32 = 0
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 1.0
        let length = hexParsed.count
        //  Scans the string for a hexadecimal representation.
        guard Scanner(string: hexParsed).scanHexInt32(&rgb) else { return nil }
        // Extracts the red, green, and blue color components of the value stored in rgb depending on the length of the string.
        r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        b = CGFloat(rgb & 0x0000FF) / 255.0
//        if length == 6 {
//            r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
//            g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
//            b = CGFloat(rgb & 0x0000FF) / 255.0
//
//        } else if length == 8 {
//            r = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
//            g = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
//            b = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
//            a = CGFloat(rgb & 0x000000FF) / 255.0
//
//        } else {
//            return nil
//        }
        // Creating the UIColor instance.
        self.init(red: r, green: g, blue: b, alpha: a)
    }
}
