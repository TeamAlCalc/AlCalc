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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //homepageHeaderLabel.text = toPass
        //loadParties()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func newParty(sender: AnyObject) {
        performSegueWithIdentifier("NewParty", sender: nil)
        
    }
    
    func addParty() {
    
        let moc = DataController().managedObjectContext
    
        // we set up our entity by selecting the entity and context that we're targeting
        let entity = NSEntityDescription.insertNewObjectForEntityForName("Party", inManagedObjectContext: moc) as! Party
    
        // add our data
        entity.setValue("Dick", forKey: "guestList")
        entity.setValue("Vag", forKey: "purchasedBeer")
        entity.setValue(NSDate(), forKey: "date")
        entity.setValue(5, forKey: "numberOfGuests")
    
    
        // we save our entity
        do {
            try moc.save()
        } catch {
            fatalError("Failure to save context: \(error)")
        }
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


