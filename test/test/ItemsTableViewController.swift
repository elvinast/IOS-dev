//
//  ItemsTableViewController.swift
//  SDUapp
//
//  Created by Macbook on 02.03.18.
//  Copyright © 2018 Macbook. All rights reserved.
//

import UIKit
class MyCell2: UITableViewCell {
    
    @IBOutlet weak var fName: UILabel!
}

class ItemsTableViewController: UITableViewController {
    var selectedItem:[String] = []
    var facultiesList:[String] = [
        "Faculty of Philology and Humanities",
        "SDU Business school",
        "Faculty of Law" ,
        "Faculty of Engineering and Natural sciences"]
    var clubsList:[String] = [
        "Music Club",
        "Magzhan Club",
        "IQ Club",
        "Debate Club",
        "Event Club",
        "ORLEAN",
        "MMDance",
        "Mountain Kings",
        "Shapagat",
        "Red Crescent"
    ]
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if selectedItem == facultiesList{
            return facultiesList.count
        }
        else{
            return clubsList.count
        }
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "MyCell2")  as! MyCell2
        if selectedItem == facultiesList{
            cell2.fName?.text = facultiesList[indexPath.row]
            
        }
        else{
            cell2.fName?.text = clubsList[indexPath.row]
            
        }
        return cell2
    }
    
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            let rightNavController = controllers.last as? UINavigationController
            let detailViewController = rightNavController?.topViewController as? DetailViewController
            if selectedItem == facultiesList{
                detailViewController?.title = facultiesList[indexPath.row]
                detailViewController?.descrip = facultiesList[indexPath.row]
                detailViewController?.first.image = UIImage(named: ""+facultiesList[indexPath.row]+".jpeg")
            }
            else{
                detailViewController?.title = clubsList[indexPath.row]
                detailViewController?.descrip = clubsList[indexPath.row]
                detailViewController?.first.image = UIImage(named: ""+clubsList[indexPath.row]+".jpeg")
            }
           
            detailViewController?.showItems()

            
            }
        }
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


