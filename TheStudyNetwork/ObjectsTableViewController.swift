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
        query.orderByAscending("facebookid")
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
                    cell.subject.text = subject + " " + courseCode
                    }
                }
               // let UserObject = PFObject(className: "User")
//                UserObject["name"] = name
//                UserObject["facebookid"] = facebookid
//                UserObject["email"] = email
            
                
               // name = ""
                //facebookid = ""
            }
            else
            {
                print("error \(error)")
            }
        })
        
        /*var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! customCell!
        if cell == nil {
            cell = customCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        }
        
        
        
        // Extract values from the PFObject to display in the table cell
        if let name = object?["name"] as? String {
            cell?.userName?.text = name
            print(name)
        }
        
        if let facebookid = result["facebookid"] as? String {
            cell?.facebookID?.text = facebookid
            print("id: \(facebookid)")
        }*/
        
        return cell
    }

}
/*
import UIKit
import Parse
import ParseUI

class ObjectsTableViewController: PFQueryTableViewController {

    override init(style: UITableViewStyle, className: String!) {
        super.init(style: style, className: className)
    }
    
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!
        self.parseClassName = "User"
        self.textKey = "facebookid"
        self.pullToRefreshEnabled = true
        self.paginationEnabled = true
        self.objectsPerPage = 8
    }
    
    override func queryForTable() -> PFQuery {
        var query = PFQuery(className: "User")
        query.orderByAscending("facebookid")
        return query
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! PFTableViewCell!
        
        if cell == nil {
            cell = PFTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        }
        
        // extract values
        if let userid = object?["facebookid"] as? String{
            cell?.detailTextLabel?.text = userid
        }
        
        if let nameUser = object?["name"] as? String{
            cell?.detailTextLabel?.text = nameUser
        }
        
        return cell
        
    }

*/

/*override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell {
    
    var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! customCell!
    
    let accessToken = FBSDKAccessToken.currentAccessToken()
    let req = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"email,name"], tokenString: accessToken.tokenString, version: nil, HTTPMethod: "GET")
    req.startWithCompletionHandler({ (connection, result, error : NSError!) -> Void in
        if(error == nil)
        {
            print("result \(result["name"])")
            if let name = result?["name"] as? String {
                cell.userName.text = name
            }
            if let facebookid = result?["id"] as? String {
                cell.facebookID.text = facebookid
            }
            
            // send to parse
            let UserObject = PFObject(className: "User")
            //                UserObject["name"] = name
            //                UserObject["facebookid"] = facebookid
            //                UserObject["email"] = email
            
            UserObject.saveInBackgroundWithBlock{
                (success: Bool, error: NSError?) -> Void in
            }
            
            // name = ""
            //facebookid = ""
        }
        else
        {
            print("error \(error)")
        }
    })
*/