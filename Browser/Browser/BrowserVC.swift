//
//  BrowserVC.swift
//  Browser
//
//  Created by Эльвина on 20.02.2021.
//

import UIKit

class BrowserVC: UITableViewController, DetailViewDelegate {
    
    @IBOutlet weak var mySegment: UISegmentedControl!
    
    var browsers: [BrowserModel] = []
    var browserName: UITextField?
    var browserLink: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Browsers"
        browsers = BrowserArray.browsers
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return browsers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = browsers[indexPath.row].name
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail"{
            if let navCon = segue.destination as? UINavigationController{
                if let destination = navCon.visibleViewController as? InfoVC{
                    if let row = tableView.indexPathForSelectedRow?.row{
//                        destination.webURL = segmentIndex()[row].link!
                        destination.curIdx = row
                        destination.navigationItem.title = browsers[row].name
                        destination.delegate = self
                    }
                }
            }
        }
    }
    
    
    @IBAction func segmentTypes(_ sender: UISegmentedControl) {
        browsers = segmentIndex()
        tableView.reloadData()
    }
    
    func segmentIndex()->[BrowserModel]{
        if mySegment.selectedSegmentIndex == 0 {
            return BrowserArray.browsers
        }
        else{
            return BrowserArray.browsers.filter {$0.isFav == true}
        }
    }
    
    func updateVC() {
        browsers = segmentIndex()
        tableView.reloadData()
    }
    
    
    @IBAction func addBrowser(_ sender: UIBarButtonItem) {
        let alertControl = UIAlertController(title: "Add Browser", message: nil, preferredStyle: .alert)
        alertControl.addTextField(configurationHandler: browserName)
        alertControl.addTextField(configurationHandler: browserLink)
        let addAction = UIAlertAction(title: "Add", style: .default, handler: self.addBtn)
        alertControl.addAction(addAction)
        self.present(alertControl, animated: true)
//        tableView.reloadData()
//        updateVC()
    }
    
    func browserName(textField: UITextField) {
        browserName = textField
        browserName?.placeholder = "enter browser name"
    }

    func browserLink(textField: UITextField) {
        browserLink = textField
        browserLink?.placeholder = "enter browser link"
    }

    func addBtn(alert: UIAlertAction) {
        BrowserArray.browsers.append(BrowserModel(name: (browserName?.text)!, link: (browserLink?.text)!))
        updateVC()
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            tableView.beginUpdates()
            print(indexPath.row)
            BrowserArray.browsers.remove(at: indexPath.row)
            browsers = segmentIndex()
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
    
}
