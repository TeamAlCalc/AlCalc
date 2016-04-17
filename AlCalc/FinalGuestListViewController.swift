//
//  FinalGuestListViewController.swift
//  AlCalc
//
//  Created by Young, Kennon Lucas on 4/11/16.
//  Copyright © 2016 Team AlCalc. All rights reserved.
//


import UIKit; import CoreData


class FinalGuestListViewController : UIViewController,UITableViewDataSource, UITableViewDelegate{
    
    var finalNames : [String]!
    var purchasedBeer: [String]!
    var date: NSDate!
    
    @IBOutlet weak var tview: UITableView!
    
    @IBOutlet weak var dockHomepageButton: UIToolbar!
    
    @IBAction func dockHomepageSegue(sender: AnyObject) {
        performSegueWithIdentifier("DockCurrentToHomepage", sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if currentPartyFL == false {
            tview.delegate = self
            tview.dataSource = self
            tview.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
            currentPartyFL = true
            userDefaults.setObject(tview,forKey: "table")
        } else {
            tview = userDefaults.objectForKey("table") as! UITableView
        }
        finalNames = userDefaults.objectForKey("currentPartyGuestList") as! [String]
        purchasedBeer = userDefaults.objectForKey("currentPartyBeerList") as! [String]
        date = userDefaults.objectForKey("currentPartyDate") as! NSDate
        userDefaults.synchronize()
        
    }
    
    
    
    func tableView(tview: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return finalNames.count
    }
    
    
    func tableView(tview: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell =
            tview.dequeueReusableCellWithIdentifier("Cell")
        cell!.textLabel!.text = finalNames[indexPath.row]
        
        return cell!
    }
    
    func tableView(tview: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        let green = UIColor(red: 0, green: 255, blue: 0, alpha: 0.25)
        tview.deselectRowAtIndexPath(indexPath, animated: true)
        let cell = tview.cellForRowAtIndexPath(indexPath)
        if cell!.backgroundColor != green{
            cell!.backgroundColor = green
        } else {
            cell!.backgroundColor = UIColor.clearColor()
        }
        userDefaults.setObject(tview,forKey: "table")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addParty() {
        
        let moc = DataController().managedObjectContext
        
        // we set up our entity by selecting the entity and context that we're targeting
        let entity = NSEntityDescription.insertNewObjectForEntityForName("Party", inManagedObjectContext: moc) as! Party
        
        // add our data
        entity.setValue(finalNames, forKey: "guestList")
        entity.setValue(purchasedBeer, forKey: "purchasedBeer")
        entity.setValue(date, forKey: "date")
        
        
        // we save our entity
        do {
            try moc.save()
            currentPartyFL = false
            userDefaults.setObject(false, forKey: "currentPartyFL")
            userDefaults.synchronize()
        } catch {
            fatalError("Failure to save context: \(error)")
        }
    }
    
    
    
    
    
}