//
//  studyFormViewController.swift
//  TheStudyNetwork
//
//  Created by Ben Banavige on 12/3/15.
//  Copyright © 2015 Ben Banavige. All rights reserved.
//

import UIKit
import Parse
import Bolts
import ParseUI

class studyFormViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    //what studying or courseCode
    @IBOutlet weak var whatStudying: UITextField!
    
    //comments
    @IBOutlet weak var commentInput: UITextField!
    
    //location
    @IBOutlet weak var myPicker1: UIPickerView!
    var Location = ""
    let picker1Data = ["Are You Actually Studying?", "Where're you studying?", "Widener Library", "Lamont Library", "Science Center",  "Law School Library", "The Yard", "Adams House", "Cabot House", "Currier House", "Dunster House", "Eliot House", "Kirkland House", "Leverett House", "Lowell House", "Mather House", "Pforzheimer House", "Quincy House", "Winthrop House"]
    
    //Subject
    @IBOutlet weak var myPicker2: UIPickerView!
    var Subject = ""
    let picker2Data = ["What're You Studying?", "Aesthetic and Interpretive Understanding", "African and African American Studies", "Anthropology", "Applied Mathematics", "Applied Physics", "Astronomy",  "Bioengineering", "Celtic Languages and Literatures", "Chemistry and Chemical Biology", "Computer Science",  "The Classics", "Comparative Literature",  "Culture and Belief", "Earth and Planetary Sciences", "East Asian Languages and Civilizations", "Economics", "Electrical Engineering", "Empirical and Mathematical Reasoning", "English", "Environmental Science & Engineering", "Ethical Reasoning", "Germanic Languages and Literatures", "Government", "History", "History of Art and Architecture", "History of Science", "Human Evolutionary Biology", "Linguistics", "Materials Science & Mechanical Engineering", "Mathematics", "Molecular and Cellular Biology", "Music", "Near Eastern Languages and Civilizations", "Organismic and Evolutionary Biology", "Philosophy", "Physics", "Psychology", "Romance Languages and Literatures", "Science of Living Systems", "Science of the Physical Universe", "Slavic Languages and Literatures", "Societies of the World", "Sociology", "South Asian Studies", "Statistics", "Stem Cell and Regenerative Biology", "United States in the World",  "Visual and Environmental Studies"]
    
    //workType
    @IBOutlet weak var myPicker3: UIPickerView!
    var workType = ""
    let picker3Data = ["What are you Working on?", "Lab", "Paper", "Presentation", "Project", "Pset", "Quiz", "Studying", "Test", "Other"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myPicker1.delegate = self
        myPicker1.dataSource = self
        myPicker2.delegate = self
        myPicker2.dataSource = self
        myPicker3.delegate = self
        myPicker3.dataSource = self
    }
    
    //
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView == myPicker1){
            return picker1Data.count
        }
        else if (pickerView == myPicker2){
            return picker2Data.count
        }
        else{
            return picker3Data.count
        }
    }
        
        func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            if (pickerView == myPicker1){
                Location = picker1Data[row]
                return picker1Data[row]
            }
            if (pickerView == myPicker2){
                Subject = picker2Data[row]
                return picker2Data[row]
            }
            else {
                workType = picker3Data[row]
                return picker3Data[row]
            }
    }

    @IBAction func Submit(sender: AnyObject) {
        
        // courseCode
        let courseCode = whatStudying.text
        print("coursecode: \(courseCode)")
        // comments
        let Comments = commentInput.text
        print(Comments)
        print(Location)
        print(workType)
        print(Subject)
        
        func sendInfoToParse() {
            
            var query = PFQuery(className: "User")
            query.whereKey("facebookid", equalTo: sessionID)
            query.getFirstObjectInBackgroundWithBlock {
                (object: PFObject?, error: NSError?) -> Void in
                if error != nil {
                    print("The getFirstObject request failed. error: \(error)")
                } else {
                    if let obj = object {
                        obj.setValue(self.Location, forKey: "Location")
                        obj.setValue(self.workType, forKey: "worktype")
                        obj.setValue(self.Subject, forKey: "Subject")
                        obj.setValue(courseCode, forKey: "courseCode")
                        obj.setValue(Comments, forKey: "Comments")
                        
                        obj.saveInBackground()
                    }
                }
                }
            }
        sendInfoToParse()
    
        }
        
        /*(gameScore: PFObject?, error: NSError?) -> Void in
            if error != nil {
                print(error)
            } else if let gameScore = gameScore {
                gameScore["cheatMode"] = true
                gameScore["score"] = 1338
                gameScore.saveInBackground()
            }
        }

        let query = PFQuery(className:"User")
        query.whereKey("facebookid", equalTo: sessionID)
        query["viewed"] = "hey"
        object!.saveInBackgroundwithBlock()
    }
    */

        // send to parse
    
    /* let UserObject = PFObject(className: "User")
        UserObject["Subject"] = Subject
        UserObject["courseCode"] = courseCode
        UserObject["Location"] = Location
        UserObject["Comments"] = Comments
        
        UserObject.saveInBackgroundWithBlock{
            (success: Bool, error: NSError?) -> Void in
        }

        whatStudying.text = ""
        Location = ""
        workType = ""
        commentInput.text = ""
    }
*/
}