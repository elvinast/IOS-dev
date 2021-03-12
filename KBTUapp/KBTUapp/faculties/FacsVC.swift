//
//  FacsVC.swift
//  KBTUapp
//
//  Created by Эльвина on 11.03.2021.
//

import UIKit

class FacsVC: UITableViewController{
    
    @IBOutlet var myTableView: UITableView!
    
    var faculties: Array<Faculty> = [
        Faculty("FIT", "Faculty of Information Technologies"),
        Faculty("FEOGI", "Faculty of Energy and Oil & Gas Industry"),
        Faculty("BS", "Business School"),
        Faculty("ISE", "International School of Economics"),
        Faculty("KMA", "Kazakhstan Maritime Academy"),
        Faculty("MCM", "School of Mathematics and Cybernetics"),
        Faculty("SCE", "School of Chemical Engineering")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("facs")
        print(faculties.count)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return faculties.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as? CustomCell
        cell?.facultyDescription.text = faculties[indexPath.row].description
        cell?.facultyName.text = faculties[indexPath.row].name
        cell?.facultyImage.image = faculties[indexPath.row].image
        cell?.fullIMG = faculties[indexPath.row].fullImage
        return cell!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let index = myTableView.indexPathForSelectedRow?.row{
                let destination = segue.destination as! FacsDetailedVC
            destination.image = faculties[index].image
            destination.descr = faculties[index].description
            destination.fullText = faculties[index].fullText
            destination.name = faculties[index].name
            destination.fullImg = faculties[index].fullImage
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myTableView.deselectRow(at: indexPath, animated: true)
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

}
