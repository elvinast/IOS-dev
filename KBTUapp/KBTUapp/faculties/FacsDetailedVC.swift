//
//  FacsDetailedVC.swift
//  KBTUapp
//
//  Created by Эльвина on 11.03.2021.
//

import UIKit

class FacsDetailedVC: UIViewController {

    var name: String?
    var descr: String?
    var image: UIImage!
    var fullText: String?
    var fullImg: UIImage!
    
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var facName: UILabel!
    @IBOutlet weak var facDescr: UILabel!
    @IBOutlet weak var facFullText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        img.image = fullImg
        facName.text = name
        facDescr.text = descr
        facFullText.text = fullText
        
        
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
