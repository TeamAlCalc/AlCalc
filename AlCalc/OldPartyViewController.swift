//
//  OldPartyViewController.swift
//  AlCalc
//
//  Created by Ethan on 4/19/16.
//  Copyright © 2016 Team AlCalc. All rights reserved.
//
import UIKit
import CoreData

class OldPartyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var oldPartyTable: UITableView!
    
    @IBAction func backToOldParty(segue: UIStoryboardSegue){}

    
    let red = UIColor(red: 1, green: 0, blue: 0, alpha: 0.25)
    
    var index: Int!
    var notif: Bool!
    var parties: [Party]!
    var unpayed: [Bool]!
    var indicies: [Int]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parties = loadParties()
        oldPartyTable.delegate = self
        oldPartyTable.dataSource = self
        oldPartyTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    //
    // Table controllers
    //
    func tableView(oldPartyTable: UITableView, numberOfRowsInSection section: Int) -> Int {
        indicies = []
        parties = loadParties()
        if notif == false {
            return parties.count
        } else {
            //test for parties in which not all have payed
            var count = 0
            for party in parties {
                var unpayed = false
                for flag in party.payed {
                    if flag == false {
                        unpayed = true
                    }
                }
                if unpayed {
                    count+=1
                    indicies.append(parties.indexOf(party)!)
                }
            }
            return count
        }
    }
    
    
    func tableView(oldPartyTable: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        parties = loadParties()
        //if page was not loaded from notifications button
        if notif == false {
            let cell = oldPartyTable.dequeueReusableCellWithIdentifier("Cell")
            cell!.textLabel!.text = parties[indexPath.row].date
            for guestPayed in parties[indexPath.row].payed {
                if guestPayed == false {
                    cell!.backgroundColor = red
                }
            }
            return cell!
            
        //if page was loaded from old parties button
        } else {
            let cell = oldPartyTable.dequeueReusableCellWithIdentifier("Cell")
            cell!.textLabel!.text = parties[indexPath.row].date
            cell!.backgroundColor = red
            return cell!
        }
    }
    
    //fucntion to act if a row was selected
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        parties = loadParties()
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        if !notif {
            index = indexPath.row
        } else {
            index = indicies[indexPath.row]
        }

        userDefaults.setObject(parties[index].guestList, forKey:"oldPartyGuestList")
        userDefaults.setObject(parties[index].payed, forKey: "oldPartyPayed")

        userDefaults.setObject(parties[index].cans, forKey: "oldCanLabel")
        userDefaults.setObject(parties[index].price, forKey: "oldPriceLabel")
        userDefaults.setObject(parties[index].notifID, forKey: "oldPartyNotifID")
        
        userDefaults.synchronize()
        
        performSegueWithIdentifier("OldPartyGuestListSegue", sender: nil)
        
    }
    
    //function to pass information during segues
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if(segue.identifier=="OldPartyGuestListSegue"){
            let destination = (segue.destinationViewController as! OPGuestListViewController)
            destination.index = index
        }
       
    }
  
    //function to load old parties
    func loadParties() -> [Party] {
        
        
        let moc = DataController().managedObjectContext
        let partyFetch = NSFetchRequest(entityName: "Party")
        
        do {
            return try moc.executeFetchRequest(partyFetch) as! [Party]
            
        } catch {
            fatalError("Failure to save context: \(error)")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
    