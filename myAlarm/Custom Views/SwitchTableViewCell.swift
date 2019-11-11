//
//  SwitchTableViewCell.swift
//  myAlarm
//
//  Created by Kyle Jennings on 11/11/19.
//  Copyright © 2019 trevorAdcock. All rights reserved.
//

import UIKit

protocol SwitchTableViceCellDelegate: class {
    func switchCellSwitchValueChanged(cell: SwitchTableViewCell)
}

class SwitchTableViewCell: UITableViewCell {

    // MARK: - OUTLETS
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var alarmSwitch: UISwitch!
    
    // MARK: - VARIABLES
    var alarm: Alarm? {
        didSet {
            updateViews()
        }
    }
    
    weak var delegate: SwitchTableViceCellDelegate?
    

    // MARK: - ACTIONS
    @IBAction func switchValueChanged(_ sender: Any) {
        delegate?.switchCellSwitchValueChanged(cell: self)
    }
    
    func updateViews() {
        guard let alarm = alarm else {return}
        timeLabel.text = alarm.fireTimeAsString
        nameLabel.text = alarm.name
        alarmSwitch.isOn = alarm.enabled
    }
}
