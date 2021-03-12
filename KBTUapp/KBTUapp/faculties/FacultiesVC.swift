//
//  FacultiesVC.swift
//  KBTUapp
//
//  Created by Эльвина on 11.03.2021.
//

import UIKit

class FacultiesVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var faculties: Array<Faculty> = [Faculty("Faculty of Information Technologies", "the best")]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return faculties.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as? CustomCell
        cell?.facultyDescription.text = faculties[indexPath.row].description
        cell?.facultyName.text = faculties[indexPath.row].name
        cell?.facultyImage.image = faculties[indexPath.row].image
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        myTableView.deselectRow(at: indexPath, animated: true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print("fac")
        print(faculties.count)
        // Do any additional setup after loading the view.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
