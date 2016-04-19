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
    
    let red = UIColor(red: 1, green: 0, blue: 0, alpha: 0.25)
    
    
    var parties: [Party]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateStyle = NSDateFormatterStyle.FullStyle
        oldPartyTable.delegate = self
        oldPartyTable.dataSource = self
        oldPartyTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        loadParties()
        print("The date is: ")
        print(dateFormatter.stringFromDate(NSDate()))
        
    }
    //
    // Table controllers
    //
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parties.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        print()
        print("!!!")
        cell!.textLabel!.text = parties[indexPath.row].date!
        for guestPayed in parties[indexPath.row].payed! {
            if guestPayed == false {
                cell!.backgroundColor = red
            }
        }
        
        tableView.reloadData()
        return cell!

    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){

        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        let name = cell!.textLabel!.text!
        if name == cell!.textLabel!.text! {
            cell!
        }

    }
  
    
    func loadParties(){
        
        
        let moc = DataController().managedObjectContext
        let partyFetch = NSFetchRequest(entityName: "Party")
        
        do {
            parties = try moc.executeFetchRequest(partyFetch) as! [Party]
            
        } catch {
            fatalError("Failure to save context: \(error)")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
    