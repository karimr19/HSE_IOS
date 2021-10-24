//
//  AlarmCell.swift
//  kirakhmatullinPW3
//
//  Created by Karim on 24.10.2021.
//

import UIKit

final class AlarmCell: UITableViewCell {
    func setupAlarm(contentAlarm: AlarmModel) {
        setHeight(to: 50)
        var alarmView = AlarmView()
        addSubview(alarmView)
        alarmView.setupAlarmView(hours: contentAlarm.hours, minutes: contentAlarm.minutes, isActive: contentAlarm.isActive, leftAnchor: self.leadingAnchor, rightAnchor: self.trailingAnchor)
    }
    
    override func prepareForReuse() {
        for subview in subviews {
            if subview is AlarmView {
                subview.removeFromSuperview()
            }
        }
    }
}
