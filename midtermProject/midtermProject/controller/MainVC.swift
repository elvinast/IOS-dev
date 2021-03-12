//
//  MainVC.swift
//  midtermProject
//
//  Created by Эльвина on 12.03.2021.
//

import UIKit

class MainVC: UITableViewController, AddAlarm, ChangeAlarm, DeleteAlarm{
    
    func addAlarm(time: String, description: String, isSwitched: Bool) {
        alarms.append(Alarm(time: time, description: description, isSwitched: isSwitched))
        myTableView.reloadData()
    }
    
    func changeAlarm(time: String, description: String, index: Int) {
        alarms[index].description = description
        alarms[index].time = time
        myTableView.reloadData()
    }
    
    func deleteAlarm(index: Int) {
        alarms.remove(at: index)
        myTableView.reloadData()
    }
    

    @IBOutlet var myTableView: UITableView!
    
    var alarms = [
        Alarm(time: "23:30", description: "IOS midterm", isSwitched: true),
        Alarm(time: "11:00", description: "Webka midterm", isSwitched: true)
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return alarms.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as? CustomCell
        cell?.myTime.text = alarms[indexPath.row].time
        cell?.myDescription.text = alarms[indexPath.row].description
        cell?.mySwitcher.isOn = alarms[indexPath.row].isSwitched
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            alarms.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myTableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let index = myTableView.indexPathForSelectedRow?.row
        if segue.identifier == "addSegue" {
            let destination = segue.destination as! AddVC
            destination.myProtocol = self
        }
        else {
            let destination = segue.destination as! DetailVC
            destination.time = alarms[index!].time
            destination.descr = alarms[index!].description
            destination.idx = index!
            destination.myAlarm = alarms[index!]
            destination.changeProtocol = self
            destination.deleteProtocol = self
        }
    }
}
