//
//  InfoVC.swift
//  Browser
//
//  Created by Эльвина on 23.02.2021.
//

import UIKit

class InfoVC: UIViewController {
    
    @IBOutlet weak var myText: UILabel!
    var txt: String?{
        didSet{
            if myText != nil{
                updateUI()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI(){
        myText.text = txt
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
