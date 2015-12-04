//
//  LoginViewController.swift
//  TheStudyNetwork
//
//  Created by Ben Banavige on 11/28/15.
//  Copyright © 2015 Ben Banavige. All rights reserved.
//

import UIKit
import Parse
import Bolts
import ParseUI


class LoginViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    let loginButton = FBSDKLoginButton()
    
    @IBOutlet weak var proceedButton: UIButton!
    @IBOutlet weak var loginHeader: UINavigationItem!
    @IBOutlet weak var resultTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let currentToken = FBSDKAccessToken.currentAccessToken()
        // Do any additional setup after loading the view, typically from a nib.
        loginButton.center = self.view.center
        self.view.addSubview(loginButton)
        loginButton.readPermissions = ["public_profile", "email", "user_friends"]
        loginButton.delegate = self
        if currentToken != nil {
            proceedButton.hidden = false
            loginHeader.title = "Already Logged In"
            //resultTextView.text = loginButton.
        }
        else {
            proceedButton.hidden = true
            loginHeader.title = "Log in with Facebook"
        }
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        
        /*let accessToken = FBSDKAccessToken.currentAccessToken()
        let req = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"email,name"], tokenString: accessToken.tokenString, version: nil, HTTPMethod: "GET")
        req.startWithCompletionHandler({ (connection, result, error : NSError!) -> Void in
            if(error == nil)
            {
                print("result \(result["name"])")
                var name = result["name"]
                var facebookid = result["id"]
                var email = result["email"]
            }
            else
            {
                print("error \(error)")
            }
        })*/

        
        let currentToken = FBSDKAccessToken.currentAccessToken()
        print("token: \(result.grantedPermissions)")
        presentLoginAlertWithStatus("You are now logged in.")
        loginHeader.title = "Logged In"
        if currentToken != nil {
            proceedButton.hidden = false
            // Get List Of Friends
            let fbRequest = FBSDKGraphRequest(graphPath:"me?fields=id,name,friends", parameters: nil);
            fbRequest.startWithCompletionHandler { (connection : FBSDKGraphRequestConnection!, result : AnyObject!, error : NSError!) -> Void in
                
                if error == nil {
                    print("Friends are: \(result["friends"]!["data"]!)")
                } else {
                    print("Error Getting Friends \(error)");
                }
            }
        }
        else {
            proceedButton.hidden = true
        }
        
    }
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        
        presentLoginAlertWithStatus("You have successfully logged out.")
        loginHeader.title = "Log in with Facebook"
        proceedButton.hidden = true
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func presentLoginAlertWithStatus(status: String) {
        
        let ac = UIAlertController(title: "Facebook Login", message: status, preferredStyle: .Alert)
        
        ac.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        
        presentViewController(ac, animated: true, completion: nil)
        
        
        
    }
    
    @IBAction func Submit(sender: AnyObject) {
        
        let accessToken = FBSDKAccessToken.currentAccessToken()
        let req = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"email,name"], tokenString: accessToken.tokenString, version: nil, HTTPMethod: "GET")
        req.startWithCompletionHandler({ (connection, result, error : NSError!) -> Void in
            if(error == nil)
            {
                print("result \(result["name"])")
                var name = result["name"]
                var facebookid = result["id"]
                var email = result["email"]
                
                // send to parse
                var query
                let UserObject = PFObject(className: "User")
                UserObject["name"] = name
                UserObject["facebookid"] = facebookid
                UserObject["email"] = email
                
                UserObject.saveInBackgroundWithBlock{
                    (success: Bool, error: NSError?) -> Void in
                }
                
                name = ""
                facebookid = ""
                email = ""
            }
            else
            {
                print("error \(error)")
            }
        })
        
    }

    
}
