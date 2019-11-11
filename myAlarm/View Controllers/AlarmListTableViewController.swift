//
//  AlertListTableViewController.swift
//  myAlarm
//
//  Created by Kyle Jennings on 11/11/19.
//  Copyright © 2019 trevorAdcock. All rights reserved.
//

import UIKit

class AlarmListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return AlarmController.sharedInstance.alarms.count
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "alarmCell", for: indexPath) as? SwitchTableViewCell else {return UITableViewCell()}

        let alarm = AlarmController.sharedInstance.alarms[indexPath.row]
        cell.alarm = alarm
        
        cell.updateViews()
        cell.delegate = self
        return cell
    }
    



    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let alarm = AlarmController.sharedInstance.alarms[indexPath.row]
            AlarmController.sharedInstance.deleteAlarm(alarm: alarm)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

   

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAlarmDetail" {
            guard let index = tableView.indexPathForSelectedRow, let destinationVC = segue.destination as? AlarmDetailTableViewController else {return}
            let alarm = AlarmController.sharedInstance.alarms[index.row]
            destinationVC.alarm = alarm
        }
    }
    

}

extension AlarmListTableViewController: SwitchTableViceCellDelegate {
    func switchCellSwitchValueChanged(cell: SwitchTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else {return}
        
        let alarm = AlarmController.sharedInstance.alarms[indexPath.row]
        
        AlarmController.sharedInstance.toogleEnabled(for: alarm)
        
        tableView.reloadData()
    }
    
    
}
