//
//  AlarmView.swift
//  kirakhmatullinPW3
//
//  Created by Karim on 06.10.2021.
//

import UIKit
final class AlarmView: UIView {
    func setupAlarmViewDefault(leftAnchor: NSLayoutXAxisAnchor,
                        rightAnchor: NSLayoutXAxisAnchor) {
        pinRight(to: rightAnchor)
        pinLeft(to: leftAnchor)
        setHeight(to: 50)
        
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
        
        let switchTimerToggle = UISwitch()
        addSubview(switchTimerToggle)

        switchTimerToggle.pinRight(to: self, 8)
        switchTimerToggle.pinCenter(to: centerYAnchor)
    }
    
    func setupAlarmView(hours: Int, minutes: Int, isActive: Bool, leftAnchor: NSLayoutXAxisAnchor,
                        rightAnchor: NSLayoutXAxisAnchor) {
        pinRight(to: rightAnchor)
        pinLeft(to: leftAnchor)
        setHeight(to: 50)
        
        // TODO: change logic to allow user input his time
        // instead of auto-generating.
        let timeLabel = UILabel()
        // Makes time string
        var minutesStr: String = ":"
        if (minutes < 10) {
            minutesStr = ":0"
        }
        minutesStr += "\(minutes)"
        timeLabel.text = "\(hours)" + minutesStr
        addSubview(timeLabel)
        timeLabel.pinLeft(to: self, 2)
        timeLabel.pinTop(to: self)
        timeLabel.setHeight(to: 20)
        timeLabel.pinCenter(to: self.centerYAnchor)
        
        let switchTimerToggle = UISwitch()
        switchTimerToggle.isOn = isActive
        addSubview(switchTimerToggle)

        switchTimerToggle.pinRight(to: self, 8)
        switchTimerToggle.pinCenter(to: centerYAnchor)
    }
}
