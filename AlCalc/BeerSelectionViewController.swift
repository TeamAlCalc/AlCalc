//
//  BeerSelectionViewController.swift
//  AlCalc
//
//  Created by Ethan on 3/16/16.
//  Copyright © 2016 Team AlCalc. All rights reserved.
//

import UIKit

import CoreData

class BeerSelectionViewController: UIViewController {
    
    @IBOutlet weak var numPeopleLabel: UILabel!
    
    var newNames : [String]! //Gets string of guests from GuestListViewController
    
    var beer: [String] = ["Bud"]
    
    var beerArray : [String] = ["Millerlight","Budlight","CoorsLight"] //our beer list that will become objects
    
    var payed: [Bool]!
    
    var value:Int! //Number value of guests
    
    @IBOutlet weak var BeerRun: UIButton!
    
    @IBOutlet weak var textarea: UITextField!
    
    @IBOutlet weak var textarea2: UITextField!
    
    @IBOutlet weak var textarea3: UITextField!
    
    @IBOutlet weak var priceDisplay: UILabel!
    
    @IBOutlet weak var canLabel: UILabel!
    
    @IBOutlet weak var showCalc: UIButton!
    
    @IBOutlet weak var firstView: UITableView!
    
    var firstValue: Double!
    var secondValue: Double!
    var thirdValue: Double!
    var priceValue: Double!
    var cans: Double!
    var roundValue: Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        //austin, this is where the number of guest comes in from segue
        numPeopleLabel.text = "\(value)"
        //print(newNames)
        
        // Do any additional setup after loading the view, typically from a nib.

    }
    
    
    func tableView(firstView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            return beerArray.count
    }
    //tells what string(names) will be in each row
    
    func tableView(firstView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell =
        firstView.dequeueReusableCellWithIdentifier("Cell")
        cell!.textLabel!.text = beerArray[indexPath.row]
        
        return cell!
    }
    
    

    
    
    @IBAction func BeerRunClicked(sender: AnyObject) {
        self.performSegueWithIdentifier("PassList", sender: newNames)
    }
   
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if( segue.identifier == "PassList"){
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
        
        firstValue = Double(numPeopleLabel.text!)
        
        secondValue = Double(textarea2.text!) //Gets beer price value
        
        thirdValue = Double(textarea3.text!) //Gets beer quantity value
        
        priceValue = Double(secondValue! / firstValue!) //Total price based on number of friends

        cans = Double(thirdValue! / firstValue!) //Number of beer cans each guest will recieve
        
        roundValue = Double(round(priceValue*100)/100)
        
        let cansForEach = String(format: "%.f", cans)
        let remCans = (thirdValue! % firstValue!) //Calculates any remaining beer cans
        
        priceDisplay.text = "Price for each: $\(roundValue)"
        
        if remCans == 0{
            
            canLabel.text = "Beers for each: \(cansForEach) cans"
        }
        else {
            canLabel.text = "Cans for each: \(cansForEach) beers, with \(remCans) left over"
            
        }
    }
    

    
}

