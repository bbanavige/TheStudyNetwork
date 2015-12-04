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

class studyTableViewController: UITableViewController {
    
    // MARK: Properties
    func loadData(){
        let query = PFQuery(className:"TestObject")
        query.findObjectsInBackgroundWithBlock {
        (objects: [PFObject]?, error: NSError?) -> Void in
            if error == nil {
                // The find succeeded
                print("Successfully retrieved \(objects!.count) scores.\n\n")
                // Do something with the found objects
                if let objects = objects {
                    for object in objects {
                        print(object.objectId)
                    }
                }
            } else {
                // Log details of the failure
                print("Error: \(error!) \(error!.userInfo)\n\n")
            }
        }
    }
}
