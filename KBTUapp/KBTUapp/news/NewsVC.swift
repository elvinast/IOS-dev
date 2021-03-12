//
//  NewsVC.swift
//  KBTUapp
//
//  Created by Эльвина on 12.03.2021.
//

import UIKit

class NewsVC: UITableViewController {

    @IBOutlet var myTableView: UITableView!
    var allNews: Array<News> = [
        News("ACADEMIC SKILLS PREPARATION COURSE", "The Academic Skills course is aiming at an earlier immersion of high school graduates, would-be Bachelor students in the academic environment.", imgType: 1),
        News("INFORMATION ABOUT COURSE", "Dear friends! We are glad to inform you about the launch of a preparatory course on programming!", imgType: 2),
        News("«AT HOME» AGAIN", "Dear students and college graduates! We are pleased to announce to you the holding of the KBTU", imgType: 3),
        News("ACADEMIC SKILLS PREPARATION COURSE", "The Academic Skills course is aiming at an earlier immersion of high school graduates, would-be Bachelor students in the academic environment.", imgType: 1),
        News("INFORMATION ABOUT COURSE", "Dear friends! We are glad to inform you about the launch of a preparatory course on programming!", imgType: 2),
        News("«AT HOME» AGAIN", "Dear students and college graduates! We are pleased to announce to you the holding of the KBTU", imgType: 3),
        News("ACADEMIC SKILLS PREPARATION COURSE", "The Academic Skills course is aiming at an earlier immersion of high school graduates, would-be Bachelor students in the academic environment.", imgType: 1),
        News("INFORMATION ABOUT COURSE", "Dear friends! We are glad to inform you about the launch of a preparatory course on programming!", imgType: 2),
        News("«AT HOME» AGAIN", "Dear students and college graduates! We are pleased to announce to you the holding of the KBTU", imgType: 3),
        News("ACADEMIC SKILLS PREPARATION COURSE", "The Academic Skills course is aiming at an earlier immersion of high school graduates, would-be Bachelor students in the academic environment.", imgType: 1),
        News("INFORMATION ABOUT COURSE", "Dear friends! We are glad to inform you about the launch of a preparatory course on programming!", imgType: 2),
        News("«AT HOME» AGAIN", "Dear students and college graduates! We are pleased to announce to you the holding of the KBTU", imgType: 3)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(allNews.count)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return allNews.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myNewsCell") as? CustomCellNews
        cell?.newsDescr.text = allNews[indexPath.row].description
        cell?.newsName.text = allNews[indexPath.row].name
        cell?.newsImg.image = allNews[indexPath.row].image
        return cell!
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
