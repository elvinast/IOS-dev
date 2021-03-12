//
//  MasterViewController.swift
//  SDUapp
//
//  Created by Macbook on 27.02.18.
//  Copyright © 2018 Macbook. All rights reserved.
//

import UIKit
class MyCell: UITableViewCell {
    @IBOutlet weak var webName: UILabel!
    @IBOutlet weak var MyimageView: UIImageView!
    
}


class MasterViewController: UITableViewController  {
    var websites: [Options] = [
        Options.init("Faculties", "university-building (3).png"),
        Options.init("Clubs", "employees.png"),
        Options.init("News", "newspaper (1).png"),
        Options.init("Contacts", "speech-bubble.png"),
        Options.init("Social Networks", "share (1).png"),
        Options.init("Gallery", "gallery.png")
    ]
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return websites.count
    }
    
    override func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 70
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "myCell")  as! MyCell
        cell1.webName?.text = websites[indexPath.row].getName
        cell1.MyimageView?.image = UIImage(named: websites[indexPath.row].getIcon! )
        if cell1.webName.text == "Faculties" || cell1.webName.text == "Clubs"{
            cell1.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        }
        else{
            cell1.accessoryType = UITableViewCell.AccessoryType.none
            //cell1.isUserInteractionEnabled = false
            
        }
        return cell1
        
    }
    override func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            let rightNavController = controllers.last as? UINavigationController
            let detailViewController = rightNavController?.topViewController as? DetailViewController
                detailViewController?.showItems()
            detailViewController?.title = websites[indexPath.row].getName
           // detailViewController?.descrip = websites[indexPath.row].getName
        }
    }
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
    func shouldPerformSegue(withIdentifier identifier: String?, sender: AnyObject?) -> Bool {
        let indexPath = self.tableView.indexPathForSelectedRow?.row
        
        if let ident = identifier {
            if ident == "itemDetailed" {
                if indexPath != 1 || indexPath != 0 {
                    return false
                }
            }
        }
        return true
    }
    
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = self.tableView.indexPathForSelectedRow?.row
        if indexPath == 0 || indexPath == 1{
        if (segue.identifier == "itemDetailed") {
            let viewController:ItemsTableViewController = segue.destination as! ItemsTableViewController
         
            if indexPath == 0 {
                viewController.selectedItem = viewController.facultiesList
            }
            else if indexPath == 1{
                viewController.selectedItem = viewController.clubsList
            }
           
            }
            }
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
    
    
    
    
    
}





