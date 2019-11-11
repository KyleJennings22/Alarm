//
//  AlarmDetailTableViewController.swift
//  myAlarm
//
//  Created by Kyle Jennings on 11/11/19.
//  Copyright © 2019 trevorAdcock. All rights reserved.
//

import UIKit

class AlarmDetailTableViewController: UITableViewController {

    // MARK: - OUTLETS
    @IBOutlet weak var alarmDatePicker: UIDatePicker!
    @IBOutlet weak var alarmNameTextField: UITextField!
    @IBOutlet weak var alarmButton: UIButton!
    
    // MARK: - VARIABLES
    var alarm: Alarm? {
        didSet {
            updateViews()
            guard let enabled = alarm?.enabled else {return}
            alarmIsOn = enabled
        }
    }
    var alarmIsOn = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - ACTIONS
    @IBAction func enableButtonTapped(_ sender: Any) {
        guard let alarm = alarm else {return}
        AlarmController.sharedInstance.toogleEnabled(for: alarm)
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = alarmNameTextField.text, name != "" else {return}
        if let alarm = alarm {
            let updatedDate = alarmDatePicker.date
            AlarmController.sharedInstance.updateAlarm(alarm: alarm, fireDate: updatedDate, name: name, enabled: alarmIsOn)
        } else {
            AlarmController.sharedInstance.addAlarm(fireDate: alarmDatePicker.date, name: name, enabled: alarmIsOn)
        }
        navigationController?.popViewController(animated: true)
    }
    
    func updateViews() {
        loadViewIfNeeded()
        alarmButton.layer.cornerRadius = 20
        guard let alarm = alarm else {return}
        alarmDatePicker.date = alarm.fireDate
        alarmNameTextField.text = alarm.name
        if alarm.enabled {
            alarmButton.setTitle("Disable", for: .normal)
            alarmButton.backgroundColor = .red
            alarmButton.setTitleColor(.white, for: .normal)
        }
    }
}
