//
//  OPGuestListViewController.swift
//  AlCalc
//
//  Created by Young, Kennon Lucas on 4/19/16.
//  Copyright © 2016 Team AlCalc. All rights reserved.
//

import UIKit; import CoreData

class OPGuestListViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var finalNames : [String]!
    var purchasedBeer: [String]!
    var payed: [Bool]!
    var notifID: String!
    var index: Int!
    
    let green = UIColor(red: 0, green: 255, blue: 0, alpha: 0.25)
    
    @IBOutlet weak var OPGuestList: UITableView!
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var can: UILabel!
    @IBOutlet weak var ABV: UILabel!
    @IBOutlet weak var percentage: UILabel!
    
    
    //function to load view with tables and data
    override func viewDidLoad() {
        
        super.viewDidLoad()
        OPGuestList.delegate = self
        OPGuestList.dataSource = self
        OPGuestList.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        finalNames = userDefaults.objectForKey("oldPartyGuestList") as! [String]
        payed = userDefaults.objectForKey("oldPartyPayed") as! [Bool]
        notifID = userDefaults.objectForKey("oldPartyNotifID") as! String
        
        price.text = (userDefaults.objectForKey("oldPriceLabel") as! String)
        can.text = (userDefaults.objectForKey("oldCanLabel") as! String)
        
    }
    
    func tableView(tview: UITableView, numberOfRowsInSection section: Int) -> Int {
        return finalNames.count
    }
    
    //function to load names and colors of cells
    func tableView(tview: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tview.dequeueReusableCellWithIdentifier("Cell")
        cell!.textLabel!.text = finalNames[indexPath.row]
        if payed[indexPath.row] == true {
            cell!.backgroundColor = green
        }
        
        return cell!
    }
    
    //function to act if cells have been clicked, turning them green, and saving the data
    func tableView(tview: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        tview.deselectRowAtIndexPath(indexPath, animated: true)
        let cell = tview.cellForRowAtIndexPath(indexPath)
        
        if cell!.backgroundColor != green {
            cell!.backgroundColor = green
            print(indexPath.row)
            print(payed)
            payed[indexPath.row] = true
        } else {
            cell!.backgroundColor = UIColor.clearColor()
            payed[indexPath.row] = false
        }
        userDefaults.setObject(payed, forKey: "oldPartyPayed")
        updateParty()
        userDefaults.synchronize()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //function to update specific parties
    func updateParty() {
        let moc = DataController().managedObjectContext
        let request = NSFetchRequest(entityName: "Party")
        do {
            if let fetchResults = try moc.executeFetchRequest(request) as? [NSManagedObject] {
                if fetchResults.count != 0{
                    let managedObject = fetchResults[index]
                    managedObject.setValue(payed, forKey: "payed")
                    print(payed)
                    
                    do {
                        try moc.save()
                    } catch {
                        fatalError("Failure to save context: \(error)")
                    }
                    var allPayed = true
                    for flag in payed {
                        if flag == false {
                            allPayed = false
                        }
                    }
                    //if all the guests have now payed, it cancels notifciation
                    if allPayed {
                        let list = UIApplication.sharedApplication().scheduledLocalNotifications! as [UILocalNotification]
                        if list.count > 0 {
                            for notification in list {
                                if (notification.category == notifID) {
                                    UIApplication.sharedApplication().cancelLocalNotification(notification)
                                    break
                                }
                            }
                        }
                    }
                }
            }
        } catch {
            fatalError("Failure to save context: \(error)")
        }
    }    
}