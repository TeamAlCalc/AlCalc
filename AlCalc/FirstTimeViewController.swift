//
//  FirstTimeViewController.swift
//  AlCalc
//
//  Created by Ethan on 3/29/16.
//  Copyright © 2016 Team AlCalc. All rights reserved.
//

import UIKit

var beerList: [Alcohol] = []
var currentPartyFL: Bool = false
let userDefaults = NSUserDefaults.standardUserDefaults()

class FirstTimeViewController: UIViewController {

    var AgeValidated = false
    
    var values: [AnyObject] = []
    
    override func viewDidLoad() {
        let dob = loadDob()
        if dob != nil {
            print("Loaded User")
            AgeValidated = true;
        }
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if AgeValidated{
            currentPartyFL = userDefaults.objectForKey("currentPartyFL") as! Bool
            dispatch_async(dispatch_get_main_queue()){
                self.performSegueWithIdentifier("AgeValid", sender: self)
            }
        } else {
            dispatch_async(dispatch_get_main_queue()){
                self.performSegueWithIdentifier("AgeInvalid", sender: self)
            }
        }
        
        loadBeer()
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }
    
    func loadDob() -> String? {
        return userDefaults.objectForKey("dob") as? String
        
    }
    func loadBeer(){
        let url = NSURL(string: "http://webdev.cislabs.uncw.edu/~sam7826/get.php")
        let data = NSData(contentsOfURL: url!)
        values = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! Array
        if let vals = values as? [[String: AnyObject]] {
            for beer in vals {
                beerList.append(Alcohol(n: beer["name"] as! String,q: Int(beer["quantity"] as! String)!,p: Double(beer["price"] as! String)!,f: 12,a: Double(beer["abv"] as! String)!))
            }
        }

    }

}



