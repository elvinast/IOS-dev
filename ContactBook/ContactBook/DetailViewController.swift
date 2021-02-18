//
//  DetailViewController.swift
//  ContactBook
//
//  Created by Эльвина on 11.02.2021.
//

import UIKit

class DetailViewController: UIViewController {

    var nameSurname: String?
    var phoneNumber: String?
    var image: UIImage!
    
    var allContacts: Contacts!
    var myTableView: UITableView!
    var isDeleted: Bool = false
    var isEdit: Bool = false
    var curIndex: Int = 0
    
    @IBOutlet weak var imageContact: UIImageView!
    @IBOutlet weak var nameSurnameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameSurnameLabel.text = nameSurname
        phoneNumberLabel.text = phoneNumber
        imageContact.image = image
    }
  
    
    @IBAction func deleteContact(_ sender: UIButton) {
        isDeleted = true
        print(curIndex)
//        print(allContacts)
        allContacts.removeContact(curIndex)
        myTableView.reloadData()
        print("deleted")
        //        self.dismiss(animated: true, completion: nil) //this method works only in Model
        navigationController?.popViewController(animated: true)
    }
    
    
}
