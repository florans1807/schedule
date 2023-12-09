//
//  ScheduleTableViewCell.swift
//  schedule
//
//  Created by Флоранс on 05.12.2023.
//

import UIKit

class ScheduleTableViewCell: UITableViewCell {
    @IBOutlet weak var directionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        directionLabel.sizeToFit()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
