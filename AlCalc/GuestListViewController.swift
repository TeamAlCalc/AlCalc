//
//  GuestListViewController.swift
//  AlCalc
//
//  Created by Young, Kennon Lucas on 3/31/16.
//  Copyright © 2016 Team AlCalc. All rights reserved.
//


import UIKit

class GuestListViewController : UIViewController {
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    @IBAction func addPressed(sender: AnyObject) {
        
        
        let alert = UIAlertController(title: , message: "By clicking accept I agree that I am the age previously specified and I agree to the Terms of Service.", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: nil))
        alert.addAction(UIAlertAction(title: "I Agree", style: UIAlertActionStyle.Default, handler: { (action: UIAlertAction!) in
            self.saveDob()
            self.performSegueWithIdentifier("Homepage", sender: nil)
            
        }))
        
        self.presentViewController(alert, animated: true, completion: nil)

        
    
    
    
    
    
    
    }
    
    
    
    
    
}

