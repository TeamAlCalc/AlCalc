//
//  FinalGuestListViewController.swift
//  AlCalc
//
//  Created by Young, Kennon Lucas on 4/11/16.
//  Copyright © 2016 Team AlCalc. All rights reserved.
//


import UIKit

class FinalGuestListViewController : UIViewController,UITableViewDataSource {
    
    var finalNames : [String]!
    
    @IBOutlet weak var tview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    
    /*
    
    func tableView(tview: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        if editingStyle == .Delete {
            self.finalNames.removeAtIndex(indexPath.row)
            self.tview.reloadData()
        }
    }
    */
    /*
    func Done (self.UITableViewRowAction!,
        NSIndexPath!)->Void{
            
    }
*/
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     func tableView(tview: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        var more = UITableViewRowAction(style: .Normal, title: "More") {(action: UITableViewRowAction!, indexPath: NSIndexPath!)-> Void in
           
            var firstActivityItem = self.finalNames[indexPath.row]
            
            var activityViewController = UIActivityViewController(activityItems: [firstActivityItem], applicationActivities: nil)
            self.presentViewController(activityViewController, animated: true, completion:nil)
        }
        more.backgroundColor = UIColor.lightGrayColor()
        
        //let favorite = UITableViewRowAction(style: .Normal, title: "Favorite") { action, index in
         //   print ("favorite button tapped")
       // }
       // favorite.backgroundColor = UIColor.orangeColor()
        
       // let share = UITableViewRowAction(style: .Normal, title: "Share") { action, index in
        //    print("share button tapped")
        //}
        //share.backgroundColor = UIColor.blueColor()
        
        return [more]
    }
    func tableView(tview: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // the cells you would like the actions to appear needs to be editable
        return true
    }
    
    func tableView(tview: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        // you need to implement this method too or you can't swipe to display the actions
    }

  
    
}
