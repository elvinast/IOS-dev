//
//  CustomCell.swift
//  KBTUapp
//
//  Created by Эльвина on 11.03.2021.
//

import UIKit

class CustomCell: UITableViewCell {

    
    @IBOutlet weak var facultyName: UILabel!
    @IBOutlet weak var facultyDescription: UILabel!
    @IBOutlet weak var facultyImage: UIImageView!
    var fullIMG: UIImage?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
