//
//  MainTableVC.swift
//  CoreDataTutorial
//
//  Created by Эльвина on 23.03.2021.
//

import UIKit
import CoreData

class MainTableVC: UITableViewController {

    var characters: [Character] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        characters = loadGOT()
    }

    @IBAction func plusPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "New character", message: "Add a new character", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Save", style: .default) { (UIAlertAction) in
            let name = alert.textFields?[0].text ?? ""
            let location = alert.textFields?[1].text ?? ""
            self.saveGOT(name, location)
            self.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addTextField{ (textField) in
            textField.placeholder = "Name"
        }
        alert.addTextField{ (textField) in
            textField.placeholder = "Location"
        }
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return characters.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
//        cell.textLabel?.text = characters[indexPath.row].name
//        cell.detailTextLabel?.text = characters[indexPath.row].location
        // Configure the cell...

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func loadGOT()-> [Character]{
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate{
            let context = appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<Character>(entityName: "Character")
            do{
                try characters = context.fetch(fetchRequest)
            } catch{
                print("Error! hi.")
            }
        }
        return characters
    }
    
    func saveGOT(_ name: String, _ location: String){
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate{
            let context = appDelegate.persistentContainer.viewContext
            if let entity = NSEntityDescription.entity(forEntityName: "Character", in: context){
                let character = NSManagedObject(entity: entity, insertInto: context)
                character.setValue(name, forKey: "name")
                character.setValue(location, forKey: "location")
                do{
                    try context.save()
                        characters.append(character as! Character)
                } catch{
                    print("Warning! Error is here!")
                }
            }
        }
    }
}
