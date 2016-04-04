//
//  HomepageViewController.swift
//  AlCalc
//
//  Created by Ethan on 3/16/16.
//  Copyright © 2016 Team AlCalc. All rights reserved.
//

import UIKit

class HomepageViewController: UIViewController {
    
    var toPass: String!
    var values:NSArray = []

    @IBOutlet weak var newPartyButton: UIButton!
    
    @IBOutlet weak var homepageHeaderLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //homepageHeaderLabel.text = toPass
        updateBeer()

        
    }
    
    func updateBeer(){
        let url = NSURL(string: "http://webdev.cislabs.uncw.edu/~sam7826/get.php")
        let data = NSData(contentsOfURL: url!)
        values = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSArray
        saveBeer(values)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func newParty(sender: AnyObject) {
        performSegueWithIdentifier("NewParty", sender: nil)
        
    }
    
    
    
    
    
    
    func saveBeer(beerArray: NSArray){
        
    }
    
}

