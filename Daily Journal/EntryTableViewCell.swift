//
//  EntryTableViewCell.swift
//  Daily Journal
//
//  Created by Justin Storrer on 4/8/21.
//

import UIKit

class EntryTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var entryTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
