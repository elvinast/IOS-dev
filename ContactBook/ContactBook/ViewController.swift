//
//  ViewController.swift
//  ContactBook
//
//  Created by Эльвина on 11.02.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
        var allContacts = Contacts.init()
        
    @IBOutlet weak var myTableView: UITableView!
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                checkContacts()
            return allContacts.contacts.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as? CustomCell
            cell?.personName.text = allContacts.contacts[indexPath.row].nameSurname
            cell?.personPhone.text = allContacts.contacts[indexPath.row].phoneNumber
            cell?.personImageView.image = allContacts.contacts[indexPath.row].image
            return cell!
        }

        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            myTableView.deselectRow(at: indexPath, animated: true)
        }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        checkContacts()
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let index = myTableView.indexPathForSelectedRow?.row{
                let destination = segue.destination as! DetailViewController
                destination.curIndex = index
                destination.allContacts = allContacts
                destination.myTableView = myTableView
                destination.phoneNumber = allContacts.contacts[index].phoneNumber
                destination.nameSurname = allContacts.contacts[index].nameSurname
                destination.image = allContacts.contacts[index].image
                checkContacts()
        }
    }
        
        @IBAction func addingButton(_ sender: Any) {
                let AddViewController = self.storyboard?.instantiateViewController(identifier: "AddViewController") as! AddViewController
                AddViewController.myTableView = myTableView
                AddViewController.allContacts = allContacts
                navigationController?.pushViewController(AddViewController, animated: true)
        }
        
        func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
            return true
        }
        
        func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
                
                let editAction = UIContextualAction(style: .normal, title: "Edit", handler: { (contextualAction, view, boolValue) in
                        self.addingButton(UIButton())
                        self.allContacts.removeContact(indexPath.row)
                })

                let deleteAction = UIContextualAction(style: .destructive, title: "Delete", handler: { (contextualAction, view, boolValue) in
                        self.allContacts.removeContact(indexPath.row)
                        tableView.deleteRows(at: [indexPath], with: .fade)
                        self.myTableView.reloadData()
                })
                
                let swipeActions = UISwipeActionsConfiguration(actions: [deleteAction, editAction])
                checkContacts()
                return swipeActions
        }
        
        @IBOutlet weak var noContacts: UILabel!
        func checkContacts(){
                if allContacts.contacts.count == 0 {
                        noContacts.text = "No contacts"
                }
                else {
                        noContacts.text = ""
                }
        }
        
}

