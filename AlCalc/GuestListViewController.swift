//
//  GuestListViewController.swift
//  AlCalc
//
//  Created by Young, Kennon Lucas on 3/31/16.
//  Copyright © 2016 Team AlCalc. All rights reserved.
//


import UIKit

class GuestListViewController : UIViewController {
    

    @IBOutlet weak var addButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    
    @IBAction func addPressed(sender: AnyObject?) {
        
        let alert = UIAlertController(title: "Add Guest", message: "Add Names of Guest", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: nil))
        
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        
        
        alert.addTextFieldWithConfigurationHandler({(textField : UITextField!) in
        textField.placeholder = "Drinking Buddies"
        textField.secureTextEntry = false
        textField.keyboardType = UIKeyboardType.Alphabet
        print(textField.text)
        //inputTextField = textField
        alert.textFields![0] as UITextField
            })
        
        self.presentViewController(alert, animated: true, completion: nil)
    }

  
    
}

