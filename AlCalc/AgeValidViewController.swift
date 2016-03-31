//
//  AgeValidViewController.swift
//  AlCalc
//
//  Created by Ethan on 3/16/16.
//  Copyright © 2016 Team AlCalc. All rights reserved.
//

import UIKit

class AgeValidViewController: UIViewController {


    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var tosButton: UIButton!
    
    @IBOutlet weak var ofAgeButton: UIButton!
    
    @IBOutlet weak var headerLabel: UILabel!
    
    
    var dateOfBirth: String!
    
    var calendar : NSCalendar = NSCalendar.currentCalendar()
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let yourNextViewController = (segue.destinationViewController as! HomepageViewController)
        yourNextViewController.toPass = dateOfBirth
        
    }
    
    override func viewDidLoad() {
        let dob = loadDob()
        if dob != nil {
            print("Loaded User")

            performSegueWithIdentifier("Homepage", sender: nil)
        }
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        datePicker.addTarget(self, action:nil, forControlEvents: UIControlEvents.ValueChanged)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func ofAgeConfirm(sender: UIButton) {
 
        let date = datePicker.date
        let now = NSDate()

        let ageComponents = calendar.components(.Year,
            fromDate: date,
            toDate: now,
            options: [])
        
        if ageComponents.year >= 21 {
        
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateStyle = .MediumStyle
            
            dateOfBirth = dateFormatter.stringFromDate(date)
            
            let alert = UIAlertController(title: "Confirm", message: "By clicking accept I agree that I am the age previously specified and I agree to the Terms of Service.", preferredStyle: UIAlertControllerStyle.Alert)
             alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: nil))
            alert.addAction(UIAlertAction(title: "I Agree", style: UIAlertActionStyle.Default, handler: { (action: UIAlertAction!) in
                self.saveDob()
                self.performSegueWithIdentifier("Homepage", sender: nil)
                
            }))

            self.presentViewController(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Error", message: "You must be 21 years of age or older to use this application.", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil))
            
            self.presentViewController(alert, animated: true, completion: nil)
            
        }
        
    }
    
    func saveDob(){
        userDefaults.setObject(dateOfBirth, forKey: "dob")
        userDefaults.synchronize()
    }
    func loadDob() -> String? {
        return userDefaults.objectForKey("dob") as? String
        
    }
    


}

