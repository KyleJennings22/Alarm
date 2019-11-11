//
//  AlarmController.swift
//  myAlarm
//
//  Created by Kyle Jennings on 11/11/19.
//  Copyright © 2019 trevorAdcock. All rights reserved.
//

import Foundation

class AlarmController {
    static let sharedInstance = AlarmController()
    
    var alarms: [Alarm] = []
    
    init() {
        self.alarms = mockAlarms
    }
    var mockAlarms: [Alarm] = {
        let alarm1 = Alarm(fireDate: Date(), name: "Alarm 1", enabled: false)
        return [alarm1]
    }()
    
    func addAlarm(fireDate: Date, name: String, enabled: Bool) {
        let alarm = Alarm(fireDate: fireDate, name: name, enabled: enabled)
        self.alarms.append(alarm)
    }
    
    func updateAlarm(alarm: Alarm, fireDate: Date, name: String, enabled: Bool){
        alarm.fireDate = fireDate
        alarm.name = name
        alarm.enabled = enabled
    }
    
    func deleteAlarm(alarm: Alarm) {
        guard let index = alarms.firstIndex(of: alarm) else {return}
        alarms.remove(at: index)
    }
    
    func toogleEnabled(for alarm: Alarm) {
        alarm.enabled = !alarm.enabled
    }
    
}
