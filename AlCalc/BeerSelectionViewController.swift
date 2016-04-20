//
//  BeerSelectionViewController.swift
//  AlCalc
//
//  Created by Ethan on 3/16/16.
//  Copyright © 2016 Team AlCalc. All rights reserved.
//

import UIKit

import CoreData

import Foundation

import QuartzCore

class BeerSelectionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var numPeopleLabel: UILabel!
    
    var newNames : [String]! //Gets string of guests from GuestListViewController
    
    var beer: [String] = []
    
    var payed: [Bool]!
    
    var value:Int! //Number value of guests
    
    @IBOutlet weak var abvLabel: UILabel!
    @IBOutlet weak var BeerRun: UIButton!
    @IBOutlet weak var priceDisplay: UILabel!
    @IBOutlet weak var canLabel: UILabel!
    @IBOutlet weak var showCalc: UIButton!
    @IBOutlet weak var beerListTable: UITableView!
    @IBOutlet weak var chosenBeer: UITableView!
    
    var numOfGuests: Double!
    var beerPrice = 0.0
    var beerQty = 0.0
    var beerAbv = 0.0
    var priceValue: Double!
    var cans: Double!
    var roundValue: Double!
    
    let priceFormat = ".2"
    let borderColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1.0)
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        beerListTable.dataSource = self
        beerListTable.delegate = self
        beerListTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        chosenBeer.dataSource = self
        chosenBeer.delegate = self
        chosenBeer.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell2")
        numOfGuests = Double(newNames.count)
        beerListTable.layer.borderWidth = 1.0; beerListTable.layer.cornerRadius = 8.0;
        self.beerListTable.layer.borderColor = UIColor(red:100/255.0, green:100/255.0, blue:100/255.0, alpha: 1.0).CGColor
        chosenBeer.layer.borderWidth = 1.0; chosenBeer.layer.cornerRadius = 8.0;
        self.chosenBeer.layer.borderColor = UIColor(red:100/255.0, green:100/255.0, blue:100/255.0, alpha: 1.0).CGColor
        
        // Do any additional setup after loading the view, typically from a nib.

    }
    
    //
    // Table controllers
    //
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == beerListTable {
            return beerList.count
        } else {
            return beer.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if tableView == beerListTable {
            let cell = beerListTable.dequeueReusableCellWithIdentifier("Cell")
            cell!.textLabel!.text = beerList[indexPath.row].name
            return cell!
            
        } else {
            let cell = chosenBeer.dequeueReusableCellWithIdentifier("Cell2")
            cell!.textLabel!.text = beer[indexPath.row]
            return cell!
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        if tableView == beerListTable {
            beerListTable.deselectRowAtIndexPath(indexPath, animated: true)
            let cell = beerListTable.cellForRowAtIndexPath(indexPath)
            let name = cell!.textLabel!.text!
            beer.append(name)
            self.chosenBeer.reloadData()
            
        } else {
            chosenBeer.deselectRowAtIndexPath(indexPath, animated: true)
        }
    }
    

    @IBAction func BeerRunClicked(sender: AnyObject) {
        self.performSegueWithIdentifier("PassList", sender: newNames)
    }
   
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if(segue.identifier == "PassList"){
            currentPartyFL = true
            
            userDefaults.setObject(newNames, forKey:"currentPartyGuestList")
            userDefaults.setObject(payed, forKey: "currentPartyPayed")
            userDefaults.setObject(beer, forKey: "currentPartyBeerList")
            userDefaults.setObject(NSDate(), forKey: "currentPartyDate")
            
            userDefaults.setObject(canLabel.text, forKey: "currentCanLabel")
            userDefaults.setObject(priceDisplay.text, forKey: "currentPriceLabel")
            
            userDefaults.setObject(currentPartyFL, forKey:"currentPartyFL")
            userDefaults.synchronize()
         
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func whenClicked(sender: AnyObject) {
        beerPrice = 0.0
        beerQty = 0.0
        for name in beer {
            for beerItem in beerList {
                if beerItem.name.lowercaseString.containsString(name.lowercaseString) {
                    beerPrice = beerPrice + beerItem.price
                    beerQty = beerQty + Double(beerItem.qty)
                }
            }
        }
        
        priceValue = Double(beerPrice / numOfGuests!) //Total price based on number of friends

        cans = Double(beerQty / numOfGuests!) //Number of beer cans each guest will recieve
        
        
        roundValue = Double(round(priceValue * 100)/100)
        
        
        let cansForEach = String(format: "%.f", cans)
        let remCans = (beerQty % numOfGuests!) //Calculates any remaining beer cans
        
        priceDisplay.text = "Price for each: $\(roundValue.format(priceFormat))"
        
        if remCans == 0 {
            canLabel.text = "Beers for each: \(cansForEach) cans"
        } else {
            canLabel.text = "Beers for each: \(cansForEach) cans, with \(remCans) left over"
        }
        
    }
    
}
extension Double {
    func format(f: String) -> String {
        return String(format: "%\(f)f", self)
    }
}


