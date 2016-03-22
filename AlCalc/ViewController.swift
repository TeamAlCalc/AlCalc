//
//  ViewController.swift
//  AlCalc
//
//  Created by Ethan on 3/16/16.
//  Copyright © 2016 Team AlCalc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var headerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // let yourNextViewController = (segue.destinationViewController as! HomepageViewController)
        // yourNextViewController.toPass = usernameText.text
        
    }
    
    
    @IBAction func login(sender: UIButton) {
        
        if usernameText.text == "Ethan"{
            print("Log in successfully")
            
            performSegueWithIdentifier("Homepage", sender: nil)
            
        } else {
            print("Error logging in")
            let alert = UIAlertController(title: "Error", message: "Incorrect username/password", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }

    }

}

