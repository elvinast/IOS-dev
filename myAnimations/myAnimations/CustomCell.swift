//
//  CustomCell.swift
//  myAnimations
//
//  Created by Эльвина on 31.03.2021.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var infoButton: UIButton!
    
    var additionalView = UIView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
