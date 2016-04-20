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
    
    var index: Int!
    
    let green = UIColor(red: 0, green: 255, blue: 0, alpha: 0.25)
    
    @IBOutlet weak var OPGuestList: UITableView!
    
    @IBOutlet weak var navBar: UINavigationBar!

    @IBOutlet weak var price: UILabel!

    @IBOutlet weak var can: UILabel!

    @IBOutlet weak var ABV: UILabel!

    @IBOutlet weak var percentage: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        OPGuestList.delegate = self
        OPGuestList.dataSource = self
        OPGuestList.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        finalNames = userDefaults.objectForKey("oldPartyGuestList") as! [String]
        payed = userDefaults.objectForKey("oldPartyPayed") as! [Bool]
        
        price.text = (userDefaults.objectForKey("oldPriceLabel") as! String)
        can.text = (userDefaults.objectForKey("oldCanLabel") as! String)
        

        
    }
    
    func tableView(tview: UITableView, numberOfRowsInSection section: Int) -> Int {
        return finalNames.count
    }
    
    
    func tableView(tview: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tview.dequeueReusableCellWithIdentifier("Cell")
        cell!.textLabel!.text = finalNames[indexPath.row]
        if payed[indexPath.row] == true {
            cell!.backgroundColor = green
        }
        
        return cell!
    }
    
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
        userDefaults.setObject(payed, forKey: "oldPartyPayed")
        updateParty()
        userDefaults.synchronize()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateParty() {
        let moc = DataController().managedObjectContext
        let request = NSFetchRequest(entityName: "Party")
        do {
            if let fetchResults = try moc.executeFetchRequest(request) as? [NSManagedObject] {
                if fetchResults.count != 0{
                    
                    let managedObject = fetchResults[index]
                    managedObject.setValue(payed, forKey: "payed")
                    
                    do {
                        try moc.save()
                    } catch {
                        fatalError("Failure to save context: \(error)")
                    }
                }
            }
        } catch {
            print("FAILURE")
        }
    }
    
}