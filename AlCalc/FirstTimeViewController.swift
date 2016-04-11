//
//  FirstTimeViewController.swift
//  AlCalc
//
//  Created by Ethan on 3/29/16.
//  Copyright © 2016 Team AlCalc. All rights reserved.
//

import UIKit

class FirstTimeViewController: UIViewController {

    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    var AgeValidated = false
    
    var values:NSArray = []
    

    override func viewDidLoad() {
        let dob = loadDob()
        if dob != nil {
            print("Loaded User")
            AgeValidated = true;
        }
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if AgeValidated{
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
        values = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSArray
        print(values[0])
        
        //saveBeer(values)
    }
    
    func saveBeer(beerArray: NSArray){
        values = [Alcohol(n: "Bud Light 24 pack",q: 24,p: 14.99,f: 12,a: 5.0),Alcohol(n: "Miller lite 12 pack",q: 12,p: 7.99,f: 12,a: 5.5),Alcohol(n: "Coors light 6 pack",q: 6,p: 4.99,f: 12,a: 6)]
        for beer in values {
            userDefaults.setObject(beer, forKey: beer.name)
        }
        userDefaults.synchronize()
        
        
    }
}

