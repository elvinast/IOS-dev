//
//  DetailViewController.swift
//  SDUapp
//
//  Created by Macbook on 27.02.18.
//  Copyright © 2018 Macbook. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var facultiesButton: UIButton!
    @IBOutlet weak var clubsButton: UIButton!
    @IBOutlet weak var newsButton: UIButton!
    @IBOutlet weak var contactsButton: UIButton!
    @IBOutlet weak var SocialButton: UIButton!
    @IBOutlet weak var galleryButton: UIButton!
    @IBOutlet weak var first: UIImageView!
    @IBOutlet weak var myyyStack: UIStackView!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var fourth: UIImageView!
    @IBOutlet weak var third: UIImageView!
    @IBOutlet weak var second: UIImageView!
    @IBOutlet weak var desc: UILabel!
    var descrip : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        desc.isHidden = true
        facultiesButton.layer.cornerRadius = 10;
        clubsButton.layer.cornerRadius = 10;
        newsButton.layer.cornerRadius = 10;
        contactsButton.layer.cornerRadius = 10;
        SocialButton.layer.cornerRadius = 10;
        galleryButton.layer.cornerRadius = 10;
        
        // Do any additional setup after loading the view.
    }
    
    func showItems(){
        myyyStack.isHidden = true
        first.isHidden = false;
       
        desc.isHidden = false
        desc.setNeedsDisplay()
      //  second.isHidden = false;
      //  third.isHidden = false;
      //  fourth.isHidden = false;
        print(desc.text)
        logo.isHidden = true;
        desc.text = descrip
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    /* // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }*/
    
    
}
