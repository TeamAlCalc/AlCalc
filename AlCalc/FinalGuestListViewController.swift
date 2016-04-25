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
    var payed: [Bool]!
    var date: NSDate!
    let green = UIColor(red: 0, green: 255, blue: 0, alpha: 0.25)
    let dateFormatter = NSDateFormatter()
    let notifID = String(random())
    
    @IBAction func backSymbol2(segue: UIStoryboardSegue){}
    @IBOutlet weak var SymbolButton: UIToolbar!
    
    @IBOutlet weak var partyOver: UIButton!
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var canLabel: UILabel!
    @IBOutlet weak var tview: UITableView!
    
    @IBOutlet weak var dockHomepageButton: UIToolbar!
    
    @IBAction func dockHomepageSegue(sender: AnyObject) {
        performSegueWithIdentifier("DockCurrentToHomepage", sender: nil)
    }
    
    @IBAction func endTheParty(sender: AnyObject) {
        addParty()
    }
    
    //load data and table view controllers
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateStyle = .MediumStyle
        tview.delegate = self
        tview.dataSource = self
        tview.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        
        finalNames = userDefaults.objectForKey("currentPartyGuestList") as! [String]
        payed = userDefaults.objectForKey("currentPartyPayed") as! [Bool]
        purchasedBeer = userDefaults.objectForKey("currentPartyBeerList") as! [String]
        date = userDefaults.objectForKey("currentPartyDate") as! NSDate
        priceLabel.text = userDefaults.objectForKey("currentPriceLabel") as? String
        canLabel.text = (userDefaults.objectForKey("currentCanLabel") as! String)
        
        
    }
    
    @IBAction func SymbolClicked2(sender: AnyObject) {
        performSegueWithIdentifier("PassSymbol2", sender: nil)
        
    }
    func tableView(tview: UITableView, numberOfRowsInSection section: Int) -> Int {
        return finalNames.count
    }
    
    //load cells and names
    func tableView(tview: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell =
            tview.dequeueReusableCellWithIdentifier("Cell")
        cell!.textLabel!.text = finalNames[indexPath.row]
        if payed[indexPath.row] == true {
            cell!.backgroundColor = green
        }
        
        return cell!
    }
    
    //fucntion if a cell is selected
    func tableView(tview: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        tview.deselectRowAtIndexPath(indexPath, animated: true)
        let cell = tview.cellForRowAtIndexPath(indexPath)
        
        if cell!.backgroundColor != green{
            cell!.backgroundColor = green
            payed[indexPath.row] = true
        } else {
            cell!.backgroundColor = UIColor.clearColor()
            payed[indexPath.row] = false
        }
        userDefaults.setObject(payed, forKey: "currentPartyPayed")
        userDefaults.synchronize()
        tview.reloadData()
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
        entity.setValue(payed, forKey: "payed")
        entity.setValue(purchasedBeer, forKey: "purchasedBeer")
        entity.setValue(dateFormatter.stringFromDate(date), forKey: "date")
        entity.setValue(priceLabel.text, forKey: "price")
        entity.setValue(canLabel.text, forKey: "cans")
        entity.setValue(notifID, forKey: "notifID")
        
        
        // we save our entity
        do {
            try moc.save()
            currentPartyFL = false
            userDefaults.setObject(false, forKey: "currentPartyFL")
            userDefaults.synchronize()
        } catch {
            fatalError("Failure to save context: \(error)")
        }
        var alert = false
        for flag in payed {
            if flag == false {
                alert = true;
            }
        }
        if alert == true {
            
            //local notification to alert user next day of unpaid members
            let reminder = UILocalNotification()
            
            reminder.fireDate = NSDate(timeIntervalSinceNow: 10)
            reminder.repeatInterval = NSCalendarUnit.Day
            reminder.alertBody = "Somebody hasn't payed bruh..."
            reminder.timeZone = NSTimeZone.defaultTimeZone()
            reminder.applicationIconBadgeNumber = UIApplication.sharedApplication().applicationIconBadgeNumber + 1
            reminder.category = notifID
            
            UIApplication.sharedApplication().scheduleLocalNotification(reminder)
            
        }
        
        performSegueWithIdentifier("DockCurrentToHomepage", sender: nil)
        
    }
    
}