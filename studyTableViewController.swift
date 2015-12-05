//
//  studyTableViewController.swift
//  TheStudyNetwork
//
//  Created by Ben Banavige on 12/3/15.
//  Copyright © 2015 Ben Banavige. All rights reserved.
//

import UIKit
import Parse
import Bolts
import ParseUI

class studyTableViewController: PFQueryTableViewController {

    override init(style: UITableViewStyle, className: String!) {
        super.init(style: UITableViewStyle.Plain, className: className)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        // Configure the PFQueryTableView
        self.parseClassName = "Users"
        self.textKey = "Subject"
        self.pullToRefreshEnabled = true
        self.paginationEnabled = false
    }
    
}
