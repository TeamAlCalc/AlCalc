//
//  FirstTimeViewController.swift
//  AlCalc
//
//  Created by Ethan on 3/29/16.
//  Copyright © 2016 Team AlCalc. All rights reserved.
//

import UIKit

class FirstTimeViewController: UIViewController {
    

    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    var AgeValidated = false
    

    override func viewDidLoad() {
        let dob = loadDob()
        if dob != nil {
            print("Loaded User")
            AgeValidated = true;
        }
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if AgeValidated{
            dispatch_async(dispatch_get_main_queue()){
                self.performSegueWithIdentifier("AgeValid", sender: self)
            }
        } else {
            dispatch_async(dispatch_get_main_queue()){
                self.performSegueWithIdentifier("AgeInvalid", sender: self)
            }
        }
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }
    
    func loadDob() -> String? {
        return userDefaults.objectForKey("dob") as? String
        
    }
}

