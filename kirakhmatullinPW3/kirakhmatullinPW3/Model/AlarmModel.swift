//
//  AlarmModel.swift
//  kirakhmatullinPW3
//
//  Created by Karim on 24.10.2021.
//

import UIKit

class AlarmModel {
    let minutes: Int
    let hours: Int
    let isActive: Bool
    
    init(hours: Int, minutes: Int, isActive: Bool) {
        self.minutes = minutes
        self.hours = hours
        self.isActive = isActive
    }
    
    static func sorterForAlarms(this:AlarmModel, that:AlarmModel) -> Bool {
        if (this.hours < that.hours) {
            return true
        }
        if (this.hours == that.hours) {
            if (this.minutes < that.minutes) {
                return true
            }
        }
        return false
      }
}
