//
//  ViewController.swift
//  AlCalc
//
//  Created by Ethan on 3/16/16.
//  Copyright © 2016 Team AlCalc. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    //blah blah blah
    //2
    
    @IBOutlet weak var myCalculation: UILabel!
    
    @IBAction func Calculate(sender: AnyObject) {
        
        myCalculation.text = "LET'S DRINK BITCHESSSS"
    }
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

