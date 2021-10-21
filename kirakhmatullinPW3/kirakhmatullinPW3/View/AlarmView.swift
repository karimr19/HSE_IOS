//
//  AlarmView.swift
//  kirakhmatullinPW3
//
//  Created by Karim on 06.10.2021.
//

import UIKit
final class AlarmView: UIView {
    func setupAlarmView(topAnchor: NSLayoutYAxisAnchor, leftAnchor: NSLayoutXAxisAnchor,
                        rightAnchor: NSLayoutXAxisAnchor) {
        pinTop(to: topAnchor)
        pinRight(to: rightAnchor)
        pinLeft(to: leftAnchor)
        setHeight(to: 35)
        
        // TODO: change logic to allow user input his time
        // instead of auto-generating.
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        let dateString = formatter.string(from: Date())
        //
        let timeLabel = UILabel()
        timeLabel.text = dateString
        addSubview(timeLabel)
        timeLabel.pinLeft(to: self, 2)
        timeLabel.pinTop(to: self)
        timeLabel.setHeight(to: 20)
        timeLabel.pinCenter(to: self.centerYAnchor)
//        timeLabel.translatesAutoresizingMaskIntoConstraints = false
//        timeLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
//        timeLabel.pinCenter(to: self.topAnchor)
//        timeLabel.pinCenter(to: self.topAnchor)
//        timeLabel.pinCenter(to: self)
//        timeLabel.setWidth(to: 3)
        
        let switchTimerToggle = UISwitch()
        addSubview(switchTimerToggle)
//        switchTimerToggle.pinCenter(to: self)
//        switchTimerToggle.pinLeft(to: timeLabel.trailingAnchor)
        switchTimerToggle.pinRight(to: self, 8)
        switchTimerToggle.pinCenter(to: self.centerYAnchor)
//        switchTimerToggle.pinCenter(to: self.topAnchor)
    }
}
