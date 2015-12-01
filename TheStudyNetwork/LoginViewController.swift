//
//  LoginViewController.swift
//  TheStudyNetwork
//
//  Created by Ben Banavige on 11/28/15.
//  Copyright © 2015 Ben Banavige. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    let loginButton = FBSDKLoginButton()
    
    @IBOutlet weak var proceedButton: UIButton!
    @IBOutlet weak var loginHeader: UILabel!
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
            loginHeader.text = "Already Logged In"
        }
        else {
            proceedButton.hidden = true
        }
    }
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        let currentToken = FBSDKAccessToken.currentAccessToken()
        presentLoginAlertWithStatus("You are now logged in.")
        loginHeader.text = "Logged In"
        if currentToken != nil {
            proceedButton.hidden = false
        }
        else {
            proceedButton.hidden = true
        }
        
    }
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        
        presentLoginAlertWithStatus("You have successfully logged out.")
        loginHeader.text = "Logged Out"
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
    
    
}
