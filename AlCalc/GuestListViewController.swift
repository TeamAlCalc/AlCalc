//
//  GuestListViewController.swift
//  AlCalc
//
//  Created by Young, Kennon Lucas on 3/31/16.
//  Copyright © 2016 Team AlCalc. All rights reserved.
//


import UIKit


class GuestListViewController : UIViewController, UITableViewDataSource {
    
    @IBAction func cancelToGuestListViewController(segue: UIStoryboardSegue){
        
    }
    @IBOutlet weak var addButton: UIBarButtonItem!

    @IBOutlet weak var selectButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    

    
    var names = [String]()
   
    //presents tableView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    
    }
    
    //indicates number of names( allocates row)
  
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            return names.count
    }
    //tells what string(names) will be in each row

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell =
        tableView.dequeueReusableCellWithIdentifier("Cell")
        cell!.textLabel!.text = names[indexPath.row]
        
        return cell!
    }
    
  
   //allows ability to swipe delete
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        if editingStyle == .Delete {
            self.names.removeAtIndex(indexPath.row)
            self.tableView.reloadData()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    
    // allows and action to be done, after cicking
    
    @IBAction func selectBeer(sender: AnyObject) {
        self.performSegueWithIdentifier("passInt", sender: names.count)
        
   
    }
    
    // performs segue between GuestListViewController -> BeerSelectionViewController (so count of people, appears on label, in
    // BeerSelectionViewController
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if( segue.identifier == "passInt"){
            let destination = (segue.destinationViewController as! BeerSelectionViewController)
            destination.value = names.count
            destination.newNames = names
            currentParty = true;
            NSUserDefaults.standardUserDefaults().setObject(true, forKey: "currentParty")
            
            
        }
    }
    //allows textfield to appear, where one can type in names of desired guest
    
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
        
        
        
        
        self.presentViewController(alert, animated: true, completion: nil)
    }

  
    
    
}

