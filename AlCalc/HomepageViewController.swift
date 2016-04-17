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

    @IBOutlet weak var newPartyButton: UIButton!
    
    @IBOutlet weak var homepageHeaderLabel: UILabel!
    
    @IBOutlet weak var dockCurrentPartyButton: UIBarButtonItem!
    
    @IBAction func dockCurrentPartySegue(sender: AnyObject) {
        if currentPartyFL == true {
            performSegueWithIdentifier("DockHomepageToaCurrent", sender: nil)
        } else {
            let alert = UIAlertController(title: "Error", message: "There is no current party.", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil))
            
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //homepageHeaderLabel.text = toPass
        //addParty()
        //loadParties()
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func newParty(sender: AnyObject) {
        performSegueWithIdentifier("NewParty", sender: nil)
        
    }
    

    
    func loadParties(){
    
    
        let moc = DataController().managedObjectContext
        let partyFetch = NSFetchRequest(entityName: "Party")
    
        do {
            var parties = try moc.executeFetchRequest(partyFetch) as! [Party]
            print(parties[0].guestList)
    
        } catch {
           fatalError("Failure to save context: \(error)")
        }
       
    }
    
}


