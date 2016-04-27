//
//  HomepageViewController.swift
//  AlCalc
//
//  Created by Ethan on 3/16/16.
//  Copyright © 2016 Team AlCalc. All rights reserved.
//

import UIKit
import CoreData
import SystemConfiguration



class HomepageViewController: UIViewController {
    var toPass: String!
    
    @IBAction func backToHome(segue: UIStoryboardSegue){}
    @IBAction func cancelToHome(segue: UIStoryboardSegue){}
    
    @IBOutlet weak var Symbol: UIToolbar!
    @IBOutlet weak var newPartyButton: UIButton!
    @IBOutlet weak var oldPartyButton: UIButton!
    @IBOutlet weak var dockNotifyButton: UIBarButtonItem!
    @IBOutlet weak var homepageHeaderLabel: UILabel!
    @IBOutlet weak var SymbolsButton: UIBarButtonItem!
    
    //Perform segue on notification button
    @IBAction func notifyButtonSegue(sender: AnyObject) {
        performSegueWithIdentifier("NotificationSegue", sender: nil)
    }
    @IBAction func GoToSymbols(sender: AnyObject) {
        performSegueWithIdentifier("GoToSymbols", sender: nil)
    }
    
    @IBOutlet weak var dockCurrentPartyButton: UIBarButtonItem!
    
    //logic if user has pressed current party button
    @IBAction func dockCurrentPartyAction(sender: AnyObject) {
        //If there is a current party
        if currentPartyFL == true {
            dispatch_async(dispatch_get_main_queue()){ self.performSegueWithIdentifier("DockHomepageToCurrent", sender: nil) }
            
        //If there is not a current party
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
    
    //Function to prepare for segue and pass parameteres as necessary
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "NotificationSegue" {
           UIApplication.sharedApplication().applicationIconBadgeNumber = 0
            let destination = (segue.destinationViewController as! OldPartyViewController)
            destination.notif = true
        } else if segue.identifier == "OldPartySegue" {
            let destination = (segue.destinationViewController as! OldPartyViewController)
            destination.notif = false
        }
    }
    
    //Function to segue on old party button party
    @IBAction func oldPartySegue(sender: AnyObject) {
        //If there are old parties
        if loadParties().count > 0 {
            performSegueWithIdentifier("OldPartySegue", sender: nil)
        //if there are no old parties
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
    
    //Function to segue on new party button
    @IBAction func newParty(sender: AnyObject) {
        //if there is a current party, segue on new party, initial beerlist to empty list
        if currentPartyFL == false {
            userDefaults.setObject([], forKey: "currentPartyBeerList")
            performSegueWithIdentifier("NewParty", sender: nil)
            
        //if there is no current party, push error popup
        } else {
            let alert = UIAlertController(title: "Error", message: "There is already a party going! Don't want party too hard...", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil))
            
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
    }
    
    //load old parties from core data
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


