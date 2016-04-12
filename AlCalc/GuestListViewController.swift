//
//  GuestListViewController.swift
//  AlCalc
//
//  Created by Young, Kennon Lucas on 3/31/16.
//  Copyright © 2016 Team AlCalc. All rights reserved.
//


import UIKit

//var num : Int!

class GuestListViewController : UIViewController, UITableViewDataSource {
    
    @IBAction func cancelToGuestListViewController(segue: UIStoryboardSegue){
        
    }
    @IBOutlet weak var addButton: UIBarButtonItem!

    @IBOutlet weak var selectButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    

    
    var names = [String]()
    var deletearray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    
    }
    
    
  
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            return names.count
    }
    

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell =
        tableView.dequeueReusableCellWithIdentifier("Cell")
        cell!.textLabel!.text = names[indexPath.row]
        
        return cell!
    }
    
  
   
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        if editingStyle == .Delete {
            self.names.removeAtIndex(indexPath.row)
            self.tableView.reloadData()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    
    
    
    @IBAction func selectBeer(sender: AnyObject) {
        self.performSegueWithIdentifier("passInt", sender: names.count)
        
   
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if( segue.identifier == "passInt"){
            let destination = (segue.destinationViewController as! BeerSelectionViewController)
                destination.value = names.count
                destination.newNames = names
            
            
        }
    }
    
    @IBAction func addPressed(sender: AnyObject?) {
        
        let alert = UIAlertController(title: "Add Guest", message: "Add Names of Guest", preferredStyle: UIAlertControllerStyle.Alert)
        
               let okaction = UIAlertAction(title: "Ok", style: .Default,
            handler: {(action: UIAlertAction!) -> Void in
                
                let textField = alert.textFields!.first
                self.names.append(textField!.text!)
                self.tableView.reloadData()
            })
        let cancelaction = UIAlertAction(title: "Cancel", style: .Default) { (action: UIAlertAction) -> Void in
        }
        
        

        
        alert.addTextFieldWithConfigurationHandler {(textField : UITextField!) -> Void in
            textField.placeholder = "Drinking Buds"
            
    }
        alert.addAction(cancelaction)
        alert.addAction(okaction)
        
        
        //print(num)
        
        
        self.presentViewController(alert, animated: true, completion: nil)
    }

  
    
    
}

