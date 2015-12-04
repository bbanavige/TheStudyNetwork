//
//  ObjectsTableViewController.swift
//  TheStudyNetwork
//
//  Created by John Harvard on 12/4/15.
//  Copyright © 2015 Ben Banavige. All rights reserved.
//

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
    
    /*override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var detailScene = segue.destinationViewController as! BaseTableViewCell
        
        // Pass the selected object to the destination view controller.
        
    if let indexPath = self.tableView.indexPathForSelectedRow() {
            let row = Int(indexPath.row)
            detailScene.currentUserObject = (objects?[row] as! PFObject)
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        
        // Refresh the table to ensure any data changes are displayed
        tableView.reloadData()
    } // end view did appear
}
*/
