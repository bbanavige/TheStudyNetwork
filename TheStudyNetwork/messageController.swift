//
//  messageController.swift
//  TheStudyNetwork
//
//  Created by Ben Banavige on 12/4/15.
//  Copyright © 2015 Ben Banavige. All rights reserved.
//

import Foundation
import MessageUI

var allPhoneNumbers: [String] = ["ready"]
var textMessageRecipients = ["111-111-1111"] // for pre-populating the recipients list (optional, depending on your needs)

class messageController: NSObject, MFMessageComposeViewControllerDelegate {
    // A wrapper function to indicate whether or not a text message can be sent from the user's device
    func canSendText() -> Bool {
        return MFMessageComposeViewController.canSendText()
    }
    
    
    
    
    
    // Configures and returns a MFMessageComposeViewController instance
    func configuredMessageComposeViewController() -> MFMessageComposeViewController {
        let messageComposeVC = MFMessageComposeViewController()
        messageComposeVC.messageComposeDelegate = self  //  Make sure to set this property to self, so that the controller can be dismissed!
        messageComposeVC.recipients = textMessageRecipients
        messageComposeVC.body = "I'm studying! Come study with me!"
        return messageComposeVC
    }
    
    // MFMessageComposeViewControllerDelegate callback - dismisses the view controller when the user is finished with it
    func messageComposeViewController(controller: MFMessageComposeViewController, didFinishWithResult result: MessageComposeResult) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    
}