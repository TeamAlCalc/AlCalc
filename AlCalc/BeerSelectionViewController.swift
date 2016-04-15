//
//  BeerSelectionViewController.swift
//  AlCalc
//
//  Created by Ethan on 3/16/16.
//  Copyright © 2016 Team AlCalc. All rights reserved.
//

import UIKit

class BeerSelectionViewController: UIViewController {
    
    @IBOutlet weak var numPeopleLabel: UILabel!
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    var newNames : [String]! //Gets string of guests from GuestListViewController
    
    var value:Int! //Number value of guests
    
    @IBOutlet weak var BeerRun: UIButton!
    
    @IBOutlet weak var textarea: UITextField!
    
    @IBOutlet weak var textarea2: UITextField!
    
    @IBOutlet weak var textarea3: UITextField!
    
    @IBOutlet weak var priceDisplay: UILabel!
    
    @IBOutlet weak var canLabel: UILabel!
    
    @IBOutlet weak var showCalc: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //austin, this is where the number of guest comes in from segue
        numPeopleLabel.text = "\(value)"
        //print(newNames)
        
        // Do any additional setup after loading the view, typically from a nib.

    }
    
    
    @IBAction func BeerRunClicked(sender: AnyObject) {
        self.performSegueWithIdentifier("PassList", sender: newNames)
    }
   
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if( segue.identifier == "PassList"){
            let destination = (segue.destinationViewController as! FinalGuestListViewController)
            destination.finalNames = newNames
            destination.dateCreated = NSDate()
            userDefaults.setObject(true, forKey: "currentParty")
            userDefaults.synchronize()
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func whenClicked(sender: AnyObject) {
        
        let firstValue = Double(numPeopleLabel.text!)
        
        let secondValue = Double(textarea2.text!) //Gets beer price value
        
        let thirdValue = Double(textarea3.text!) //Gets beer quantity value
        
        let priceValue = Double(secondValue! / firstValue!) //Total price based on number of friends

        let cans = Double(thirdValue! / firstValue!) //Number of beer cans each guest will recieve
        
        let roundValue = Double(round(priceValue*100)/100)
        
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

