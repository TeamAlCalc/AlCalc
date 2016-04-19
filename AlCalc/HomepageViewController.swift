//
//  HomepageViewController.swift
//  AlCalc
//
//  Created by Ethan on 3/16/16.
//  Copyright © 2016 Team AlCalc. All rights reserved.
//

import UIKit
import CoreData

class HomepageViewController: UIViewController {
    
    var toPass: String!
    
    @IBAction func exitToHomePageViewController(segue: UIStoryboardSegue){}

    @IBOutlet weak var newPartyButton: UIButton!
    
    @IBOutlet weak var oldPartyButton: UIButton!
    
    @IBOutlet weak var homepageHeaderLabel: UILabel!
    
    @IBOutlet weak var dockCurrentPartyButton: UIBarButtonItem!
    
    @IBAction func dockCurrentPartyAction(sender: AnyObject) {
        if currentPartyFL == true {
            dispatch_async(dispatch_get_main_queue()){ self.performSegueWithIdentifier("DockHomepageToCurrent", sender: nil) }
        } else {
            let alert = UIAlertController(title: "Error", message: "There is no current party.", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil))
            
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    @IBAction func oldPartySegue(sender: AnyObject) {
        if loadParties().count > 0 {
            performSegueWithIdentifier("OldPartySegue", sender: nil)
        } else {
            let alert = UIAlertController(title: "Error", message: "There are no old parties.", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil))
            
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func newParty(sender: AnyObject) {
        if currentPartyFL == false {
            performSegueWithIdentifier("NewParty", sender: nil)
        } else {
            let alert = UIAlertController(title: "Error", message: "There is already a party going! Don't want party too hard...", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil))
            
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
    }
    
    func loadParties() -> [Party]{
        
        
        let moc = DataController().managedObjectContext
        let partyFetch = NSFetchRequest(entityName: "Party")
        
        do {
            let parties = try moc.executeFetchRequest(partyFetch) as! [Party]

            return parties
        } catch {
            return []
        }
        
    }
    
}


