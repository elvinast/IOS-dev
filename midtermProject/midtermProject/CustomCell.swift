//
//  CustomCell.swift
//  midtermProject
//
//  Created by Эльвина on 12.03.2021.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var myTime: UILabel!
    @IBOutlet weak var myDescription: UILabel!
    @IBOutlet weak var mySwitcher: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
