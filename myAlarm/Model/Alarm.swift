//
//  Alarm.swift
//  myAlarm
//
//  Created by Kyle Jennings on 11/11/19.
//  Copyright © 2019 trevorAdcock. All rights reserved.
//

import Foundation

class Alarm: Codable {
    var fireDate: Date
    var name: String
    var enabled: Bool
    var uuid: String
    
    init(fireDate: Date, name: String, enabled: Bool, uuid: String = UUID().uuidString) {
        self.fireDate = fireDate
        self.name = name
        self.enabled = enabled
        self.uuid = uuid
    }
    
    var fireTimeAsString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm"
        let result = formatter.string(from: fireDate)
        return result
    }
    
}

extension Alarm: Equatable {
    static func == (lhs: Alarm, rhs: Alarm) -> Bool {
        return lhs.uuid == rhs.uuid
    }
    
    
}
