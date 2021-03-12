//
//  CustomCellNews.swift
//  KBTUapp
//
//  Created by Эльвина on 12.03.2021.
//

import UIKit

class CustomCellNews: UITableViewCell {

    @IBOutlet weak var newsImg: UIImageView!
    @IBOutlet weak var newsName: UILabel!
    @IBOutlet weak var newsDescr: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
