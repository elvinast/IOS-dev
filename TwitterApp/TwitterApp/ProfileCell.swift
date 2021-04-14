//
//  ProfileCell.swift
//  TwitterApp
//
//  Created by Эльвина on 14.04.2021.
//

import UIKit

class ProfileCell: UITableViewCell {

    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var hashtag: UILabel!
    @IBOutlet weak var date: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10))
    }
}
