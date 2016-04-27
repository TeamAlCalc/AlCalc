//
//  TermsOfServiceViewController.swift
//  AlCalc
//
//  Created by Ethan on 4/26/16.
//  Copyright © 2016 Team AlCalc. All rights reserved.
//


import UIKit
import Foundation

class TermsOfServiceViewController: UIViewController {
    
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBAction func backButtonAction(sender: AnyObject) {
        performSegueWithIdentifier("BackToHomeSegue", sender: nil)
    }

    //Load page, load any other information needed to be presented on page
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}


