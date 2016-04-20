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
        print("1")
        indicies = []
        parties = loadParties()
        if notif == false {
            return parties.count
        } else {
            
            var count = 0
            for party in parties {
                print("1.00")
                var unpayed = false
                for flag in party.payed {
                    print("1.01")
                    if flag == false {
                        unpayed = true
                    }
                }
                if unpayed {
                    count+=1
                    print("1.1")
                    indicies.append(parties.indexOf(party)!)
                    print("1.2")
                }
            }
            return count
        }
    }
    
    func tableView(oldPartyTable: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        print("2")
        parties = loadParties()
        if notif == false {
            let cell = oldPartyTable.dequeueReusableCellWithIdentifier("Cell")
            cell!.textLabel!.text = parties[indexPath.row].date
            for guestPayed in parties[indexPath.row].payed {
                if guestPayed == false {
                    cell!.backgroundColor = red
                }
            }
            return cell!
            
        } else {
            let cell = oldPartyTable.dequeueReusableCellWithIdentifier("Cell")
            cell!.textLabel!.text = parties[indexPath.row].date
            cell!.backgroundColor = red
            return cell!
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        print("3")
        parties = loadParties()
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        if !notif {
            index = indexPath.row
        } else {
            index = indicies[indexPath.row]
        }

        userDefaults.setObject(parties[indexPath.row].guestList, forKey:"oldPartyGuestList")
        userDefaults.setObject(parties[indexPath.row].payed, forKey: "oldPartyPayed")

        userDefaults.setObject(parties[indexPath.row].cans, forKey: "oldCanLabel")
        userDefaults.setObject(parties[indexPath.row].price, forKey: "oldPriceLabel")
        
        userDefaults.synchronize()
        
        performSegueWithIdentifier("OldPartyGuestListSegue", sender: nil)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if(segue.identifier=="OldPartyGuestListSegue"){
            let destination = (segue.destinationViewController as! OPGuestListViewController)
            destination.index = index
        }
       
    }
  
    
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
    