//
//  customCell.swift
//  TheStudyNetwork
//
//  Created by Ben Banavige on 12/4/15.
//  Copyright © 2015 Ben Banavige. All rights reserved.
//

import UIKit
import Parse
import ParseUI
import Bolts

class customCell: PFTableViewCell {
    
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var subject: UILabel!
    @IBOutlet weak var location: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
