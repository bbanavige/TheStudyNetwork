//
//  ObjectsTableViewController.swift
//  TheStudyNetwork
//
//  Created by John Harvard on 12/4/15.
//  Copyright © 2015 Ben Banavige. All rights reserved.
//

import Parse
import UIKit
import ParseUI
import Bolts

var buttonIndex:Int = 1

class ObjectsTableViewController: PFQueryTableViewController {
    
    // Initialise the PFQueryTable tableview
    override init(style: UITableViewStyle, className: String!) {
        super.init(style: style, className: className)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        // Configure the PFQueryTableView
        self.parseClassName = "User"
        self.textKey = "name"
        self.pullToRefreshEnabled = true
        self.paginationEnabled = false
    }
    
    // Define the query that will provide the data for the table view
    override func queryForTable() -> PFQuery{
        var query = PFQuery(className: "User")
        query.orderByAscending("Subject")
        return query
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell {
        
        
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! customCell!
        
        let accessToken = FBSDKAccessToken.currentAccessToken()
        let req = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"email,name"], tokenString: accessToken.tokenString, version: nil, HTTPMethod: "GET")
        req.startWithCompletionHandler({ (connection, result, error : NSError!) -> Void in
            if(error == nil)
            {
                print("result \(result["name"])")
                if let name = object?["name"] as? String {
                    cell.userName.text = name
                }
                if let location = object?["Location"] as? String {
                    cell.location.text = location
                }
                
                if let subject = object?["Subject"] as? String {
                    if let courseCode = object?["courseCode"] as? String {
                        if let workType = object?["worktype"] as? String {
                        cell.subject.text = subject + " " + courseCode + ": " + workType
                        }
                    }
                }
                if let phoneNumber = object?["phoneNumber"] as? String {
                    allPhoneNumbers.append(phoneNumber)
                    print(allPhoneNumbers)
                }
                cell.buttonInfo.tag = buttonIndex
                buttonIndex++
            }
            else
            {
                print("error \(error)")
            }
        })
        
        cell.delegate = self as? sendMessageProtocol
        return cell
    }
    
}