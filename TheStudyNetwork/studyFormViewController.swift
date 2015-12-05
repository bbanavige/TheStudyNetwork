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

var picker1key:String = ""
var picker2key:String = ""
var picker3key:String = ""

class studyFormViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    //what studying or courseCode
    @IBOutlet weak var whatStudying: UITextField!
    
    //comments
    @IBOutlet weak var commentInput: UITextField!
    
    @IBOutlet weak var phoneNumber: UITextField!
    
    //location
    @IBOutlet weak var myPicker1: UIPickerView!
    var Location = ""
    let picker1Data = ["Are You Actually Studying?", "Where're you studying?", "Widener", "Lamont", "Cabot Science Library", "Science Center", "Annenberg", "Law School Library", "Yard", "Adams", "Cabot", "Currier", "Dunster", "Eliot", "Kirkland", "Leverett", "Lowell", "Mather", "Pforzheimer", "Quincy", "Winthrop"]
    
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

    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        if (pickerView == myPicker1){
            return picker1Data[row]
        }
        
        else if (pickerView == myPicker2){
            return picker2Data[row]
        }
        else {
            return picker3Data[row]
        }
    
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView == myPicker1){
            Location = picker1Data[row]
            print(row)
            print("Location: \(Location)")
        }
        else if (pickerView == myPicker2){
            Subject = picker2Data[row]
            print(row)
            print("Subject: \(Subject)")
        }
        else {
            workType = picker3Data[row]
            print(row)
            print("workType: \(workType)")
        }
        
    }
    



    @IBAction func Submit(sender: AnyObject) {
        // courseCode
        let courseCode = whatStudying.text
        print("coursecode: \(courseCode)")
        // comments
        let Comments = commentInput.text
        let Phone = phoneNumber.text
        
        print(Location)
        print(Subject)
        print(workType)
        print(Phone)

        
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
                        obj.setValue(Phone, forKey: "phoneNumber")
                        
                        obj.saveInBackground()
                    }
                }
                }
            }
        sendInfoToParse()
    
        }
}