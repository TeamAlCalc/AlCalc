//
//  AgeValidViewController.swift
//  AlCalc
//
//  Created by Ethan on 3/16/16.
//  Copyright © 2016 Team AlCalc. All rights reserved.
//

import UIKit

let calendar : NSCalendar = NSCalendar.currentCalendar()

class AgeValidViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var tosButton: UIButton!
    @IBOutlet weak var ofAgeButton: UIButton!
    @IBOutlet weak var headerLabel: UILabel!
    
    var dateOfBirth: String!
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    
    //Prepare data to be passed during segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier != "tosSegue" {
            let yourNextViewController = (segue.destinationViewController as! HomepageViewController)
            yourNextViewController.toPass = dateOfBirth
        }
    }
    
    @IBAction func tosAction(sender: AnyObject) {
        
        performSegueWithIdentifier("tosSegue", sender: nil)
    }
    //Load page, load any other information needed to be presented on page
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        datePicker.addTarget(self, action:nil, forControlEvents: UIControlEvents.ValueChanged)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //Function for logic of datepicker for age verification
    @IBAction func ofAgeConfirm(sender: UIButton) {
 
        let date = datePicker.date
        let now = NSDate()
        
        //get age in years from entered date
        let ageComponents = calendar.components(.Year,
            fromDate: date,
            toDate: now,
            options: [])
        
        //Logic if user is of age
        if ageComponents.year >= 21 {
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateStyle = .MediumStyle
            
            dateOfBirth = dateFormatter.stringFromDate(date)
            
            //Popup alert to confirm TOS has beer read
            let alert = UIAlertController(title: "Confirm", message: "By clicking accept I agree that I am the age previously specified and I agree to the Terms of Service.", preferredStyle: UIAlertControllerStyle.Alert)
             alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: nil))
            alert.addAction(UIAlertAction(title: "I Agree", style: UIAlertActionStyle.Default, handler: { (action: UIAlertAction!) in
                self.saveDob()
                self.performSegueWithIdentifier("Homepage", sender: nil)
                
            }))

            self.presentViewController(alert, animated: true, completion: nil)
        
        //Logic is user is underage
        } else {
            
            //Popup alert if user is underage
            let alert = UIAlertController(title: "Error", message: "You must be 21 years of age or older to use this application.", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil))
            
            self.presentViewController(alert, animated: true, completion: nil)
            
        }
        
    }
    
    //function to save date of birth to userDefaults
    func saveDob(){
        currentPartyFL = false
        userDefaults.setObject(dateOfBirth, forKey: "dob")
        userDefaults.setObject(currentPartyFL, forKey: "currentPartyFL")
        userDefaults.synchronize()
    }
    
    //function to load DOB to confirm use has used the app before
    func loadDob() -> String? {
        return userDefaults.objectForKey("dob") as? String
        
    }
    


}

