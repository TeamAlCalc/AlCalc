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

    @IBOutlet weak var newPartyButton: UIButton!
    
    @IBOutlet weak var homepageHeaderLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //homepageHeaderLabel.text = toPass
        
        let budLight24: Alcohol = Alcohol(n: "Bud Light 24pack",q: 24,p: 14.99,f: 12,a: 5.0)
        homepageHeaderLabel.text = budLight24.name

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

