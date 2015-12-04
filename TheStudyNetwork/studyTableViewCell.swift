//
//  studyTableViewCell.swift
//  TheStudyNetwork
//
//  Created by Ben Banavige on 12/3/15.
//  Copyright © 2015 Ben Banavige. All rights reserved.
//

import UIKit

class studyTableViewCell: UITableViewCell {

    // MARK: Properties
    @IBOutlet weak var whoLabel: UILabel!
    @IBOutlet weak var whatLabel: UILabel!
    @IBOutlet weak var whereLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
