//
//  DetailVC.swift
//  midtermProject
//
//  Created by Эльвина on 12.03.2021.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var myPicker: UIDatePicker!
    @IBOutlet weak var editInput: UITextField!
    
    var time: String?
    var descr: String?
    var changeProtocol: ChangeAlarm?
    var deleteProtocol: DeleteAlarm?
    var idx = 0
    var myAlarm: Alarm?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editInput.layer.borderColor = UIColor.gray.cgColor
        editInput.layer.borderWidth = 1
        editInput.text = descr
        editInput.delegate = self
        
        editInput.text = myAlarm?.description
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat =  "HH:mm"
        let date = dateFormatter.date(from: (myAlarm?.time)!)
        myPicker.datePickerMode = UIDatePicker.Mode.time
        myPicker.date = date!
    }
    
    @IBAction func deleteAlarm(_ sender: Any) {
        deleteProtocol?.deleteAlarm(index: idx)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func changeAlarm(_ sender: Any) {
//        let formatter = DateFormatter()
//        navigationItem.title = "Change Alarm"
//        formatter.dateFormat = "HH:mm"
//        let date = formatter.date(from: time!)
//        time = date!
        let times = myPicker.calendar.dateComponents([.hour, .minute], from: myPicker.date)
        var hour = ""
        var minute = ""
        if times.hour! < 10 {
            hour = "0\(times.hour!)"
        }
        else if times.hour! >= 10 {
            hour = "\(times.hour!)"
        }
        if times.minute! < 10 {
            minute = "0\(times.minute!)"
        }
        else if times.minute! >= 10 {
            minute = "\(times.minute!)"
        }
        time = "\(hour) : \(minute)"
        changeProtocol?.changeAlarm(time: time!, description: editInput.text!, index: idx)
        navigationController?.popViewController(animated: true)
    }
    
}

extension DetailVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
