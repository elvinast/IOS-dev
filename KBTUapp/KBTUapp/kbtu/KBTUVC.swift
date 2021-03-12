//
//  ClubsVC.swift
//  KBTUapp
//
//  Created by Эльвина on 11.03.2021.
//

import UIKit

class KBTUVC: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    var images = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("kbtu")
        let imageNames = ["kbtu9", "kbtu2","kbtu4", "kbtu3","kbtu5","kbtu6","kbtu7","kbtu8","kbtu1"]
        for name in imageNames {
            let image = UIImage(named: name)
            let imageView = UIImageView(image: image)
            imageView.contentMode = .scaleAspectFit
            scrollView.addSubview(imageView)
            images.append(imageView)
        } 
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        for (index, imageView) in images.enumerated(){
            imageView.frame.size = scrollView.frame.size
            imageView.frame.origin.x = scrollView.frame.width * CGFloat(index)
            imageView.frame.origin.y = 0
        }
        
        let contentWidth = scrollView.frame.width * CGFloat(images.count)
        scrollView.contentSize = CGSize(width: contentWidth, height: scrollView.frame.height)
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
