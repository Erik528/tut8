//
//  MovieUITableViewCell.swift
//  tutorial8
//
//  Created by mobiledev on 19/4/2025.
//

import UIKit

class MovieUITableViewCell: UITableViewCell {

    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
