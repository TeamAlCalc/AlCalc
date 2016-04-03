//
//  BeerSelectionViewController.swift
//  AlCalc
//
//  Created by Ethan on 3/16/16.
//  Copyright © 2016 Team AlCalc. All rights reserved.
//

import UIKit

class BeerSelectionViewController: UIViewController {
    
    @IBOutlet weak var textarea: UITextField!
    @IBOutlet weak var textarea2: UITextField!
    
    @IBOutlet weak var priceDisplay: UILabel!
    
    @IBOutlet weak var showCalc: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func whenClicked(sender: AnyObject) {
        let firstValue = Double(textarea.text!)
        let secondValue = Double(textarea2.text!)
        

        let newValue = Double(secondValue! / firstValue!)
        
        priceDisplay.text = "Price for each: $\(newValue)"
    }
    
}

