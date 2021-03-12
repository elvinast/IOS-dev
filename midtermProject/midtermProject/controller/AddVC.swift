//
//  AddVC.swift
//  midtermProject
//
//  Created by Эльвина on 12.03.2021.
//

import UIKit

class AddVC: UIViewController{

    var time: String?
    var descript: String?
    var myProtocol: AddAlarm?
    
    @IBOutlet weak var myPicker: UIDatePicker!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var newAlarm: UITextField!
    
    @IBAction func cancelAdding(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveAlarm(_ sender: Any) {
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
        let time = "\(hour) : \(minute)"
        myProtocol?.addAlarm(time: time, description: newAlarm.text!, isSwitched: false)
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newAlarm.layer.borderColor = UIColor.gray.cgColor
        newAlarm.layer.borderWidth = 1
        newAlarm.text = descript
        newAlarm.delegate = self
    }
}

extension AddVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
