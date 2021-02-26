//
//  InfoVC.swift
//  Browser
//
//  Created by Эльвина on 23.02.2021.
//

import UIKit
import WebKit

protocol DetailViewDelegate {
    func updateTableViewController()
}

class InfoVC: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    var webURL: String = ""
    var curIdx: Int?
    var delegate: DetailViewDelegate?
    var myBrowser: BrowserModel?
//    var viewBrowser = BrowserVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let index = curIdx{
            let curUrl = URL(string: (BrowserArray.browsers[index].link!))
            let request = URLRequest(url: curUrl!)
            webView.load(request)
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(tripleTapped))
            tap.numberOfTapsRequired = 3
            view.addGestureRecognizer(tap)
        }
        changeColor()
    }
    
    @objc func tripleTapped() {
        BrowserArray.browsers[curIdx!].isFav = !BrowserArray.browsers[curIdx!].isFav
        changeColor()
        delegate?.updateTableViewController()
    }
    
    func changeColor(){
        if let index = curIdx{
            if BrowserArray.browsers[index].isFav{
                navigationController?.navigationBar.backgroundColor = .systemYellow
                print("change")
            }
            else{
                navigationController?.navigationBar.backgroundColor = .white
                print("back to white")
            }
        }
    }


//        if let curUrl = NSURL(string: self.webURL){
//            let request = NSURLRequest(url: curUrl as URL)
//            self.webView.load(request as URLRequest)
//        }
//    }
    
//    func updateUI(){
//        myText.text = txt
//    }

}
