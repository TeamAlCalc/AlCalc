//
//  GuestListViewController.swift
//  AlCalc
//
//  Created by Young, Kennon Lucas on 3/30/16.
//  Copyright © 2016 Team AlCalc. All rights reserved.
//

import UIKit

class GuestListViewController: UIViewController {
    
    var task = [String] ()

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
    
    @IBAction func addPressed(sender: AnyObject) {
        let alert = UIAlertController(title:"Add Names", message:"Enter Names of Guest", preferredStyle: UIAlertControllerStyle.Alert)

       
        
        alert.addAction(UIAlertAction(title:"Cancel", style:
            UIAlertActionStyle.Default, handler: nil))
        
        alert.addAction(UIAlertAction(title:"Ok", style:
            UIAlertActionStyle.Default, handler: nil))
        
        
        
        
        self.presentViewController(alert, animated: true, completion: nil)
        
        
        
    }
    

}

