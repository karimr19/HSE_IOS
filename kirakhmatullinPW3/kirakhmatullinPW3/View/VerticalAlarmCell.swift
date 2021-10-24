//
//  VerticalAlarmCell.swift
//  kirakhmatullinPW3
//
//  Created by Karim on 24.10.2021.
//

import UIKit

class VerticalAlarmCell: UICollectionViewCell {
    func setupVerticalAlarm(contentAlarm: AlarmModel) {
        self.backgroundColor = .cyan
        layer.cornerRadius = 10
        setHeight(to: 50)
        let alarmView = VerticalAlarmView()
        addSubview(alarmView)
        alarmView.setupVerticalAlarmView(hours: contentAlarm.hours, minutes: contentAlarm.minutes, isActive: contentAlarm.isActive, leftAnchor: self.leadingAnchor, rightAnchor: self.trailingAnchor)
    }
    
    override func prepareForReuse() {
        for subview in subviews {
            if subview is VerticalAlarmView {
                subview.removeFromSuperview()
            }
        }
    }
}
