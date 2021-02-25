//
//  InfoVC.swift
//  Browser
//
//  Created by Эльвина on 23.02.2021.
//

import UIKit
import WebKit

class InfoVC: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    var webURL: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        updateUI()
        if let curUrl = NSURL(string: self.webURL){
            let request = NSURLRequest(url: curUrl as URL)
            self.webView.load(request as URLRequest)
        }
    }
    
//    func updateUI(){
//        myText.text = txt
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
