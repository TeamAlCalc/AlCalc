//
//  GuestList.swift
//  AlCalc
//
//  Created by Young, Kennon Lucas on 3/23/16.
//  Copyright © 2016 Team AlCalc. All rights reserved.
//


import UIKit

var list = [String]()

class GuestList: UIViewController {
    
    @IBOutlet var tableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if NSUserDefaults.standardUserDefaults().objectForKey("list") != nil{
            list = NSUserDefaults.standardUserDefaults().objectForKey("list") as! [String]
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return list.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        var cell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
        
        cell.textLabel?.text = list[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        if editingStyle == UITableViewCellEditingStyle.Delete{
            list.removeAtIndex(indexPath.row)
            NSUserDefaults.standardUserDefaults().setObject(list, forKey: "list")
            tableView.reloadData()
        }
    }
    override func viewDidAppear(animated: Bool) {
        tableView.reloadData()
    }

}