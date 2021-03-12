//
//  HomeVC.swift
//  KBTUapp
//
//  Created by Эльвина on 11.03.2021.
//

import UIKit
import WebKit
class HomeVC: UIViewController {

    
    @IBOutlet weak var myWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("home")
        let curUrl = URL(string: "https://kbtu.edu.kz/en/")
        let request = URLRequest(url: curUrl!)
        myWebView.load(request)
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
