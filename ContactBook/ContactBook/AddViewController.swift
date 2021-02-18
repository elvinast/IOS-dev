//
//  AddViewController.swift
//  ContactBook
//
//  Created by Эльвина on 12.02.2021.
//

import UIKit

class AddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var allContacts: Contacts!
    var gender = "female"
    var myTableView: UITableView!
    
    @IBOutlet weak var nameSurnameInput: UITextField!
    @IBOutlet weak var phoneInput: UITextField!
    @IBOutlet weak var genderPicker: UIPickerView!
    
    var pickerData: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.genderPicker.delegate = self
        self.genderPicker.dataSource = self
        pickerData = ["female", "male"]
    }
    
    
    @IBAction func saveNewContact(_ sender: UIButton) {
            print("OK")
            allContacts.addContact(Person(nameSurnameInput.text!, phoneInput.text!, gender))
            if myTableView == nil {
                print("No contacts")
            }
            else{
                myTableView.reloadData()
            }
            navigationController?.popViewController(animated: true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return fop the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
//    override func didReceiveMemoryWarning() {
//            super.didReceiveMemoryWarning()
//            // Dispose of any resources that can be recreated.
//    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        gender = pickerData[row]
    }
    
}

