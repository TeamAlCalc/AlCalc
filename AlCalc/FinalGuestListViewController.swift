//
//  FinalGuestListViewController.swift
//  AlCalc
//
//  Created by Young, Kennon Lucas on 4/11/16.
//  Copyright © 2016 Team AlCalc. All rights reserved.
//


import UIKit

class FinalGuestListViewController : UIViewController,UITableViewDataSource, UITableViewDelegate{
    
    var finalNames : [String]!
    
    @IBOutlet weak var tview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tview.delegate = self
        tview.dataSource = self
        tview.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
    }
    
    
    
    func tableView(tview: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return finalNames.count
    }
    
    
    func tableView(tview: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell =
            tview.dequeueReusableCellWithIdentifier("Cell")
        cell!.textLabel!.text = finalNames[indexPath.row]
        
        return cell!
    }
    
    func tableView(tview: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        let green = UIColor(red: 0, green: 255, blue: 0, alpha: 0.25)
        tview.deselectRowAtIndexPath(indexPath, animated: true)
        let cell = tview.cellForRowAtIndexPath(indexPath)
        if cell!.backgroundColor != green{
            cell!.backgroundColor = green
        } else {
            cell!.backgroundColor = green
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
}