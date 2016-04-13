//
//  Party+CoreDataProperties.swift
//  AlCalc
//
//  Created by Ethan on 4/13/16.
//  Copyright © 2016 Team AlCalc. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Party {

    @NSManaged var guestList: String?
    @NSManaged var purchasedBeer: String?
    @NSManaged var date: NSDate?
    @NSManaged var numberOfGuests: NSNumber?

}

//func addParty() {
//    
//    let moc = DataController().managedObjectContext
//    
//    // we set up our entity by selecting the entity and context that we're targeting
//    let entity = NSEntityDescription.insertNewObjectForEntityForName("Party", inManagedObjectContext: moc) as! [Party]
//    
//    // add our data
//    entity.setValue(guestList, forKey: "guestList")
//    entity.setValue(purchasedBeer, forKey: "purchasedBeer")
//    entity.setValue(date, forKey: "date")
//    entity.setValue(numOfGuests, forKey: "numberOfGuests")

//    
//    // we save our entity
//    do {
//        try moc.save()
//    } catch {
//        fatalError("Failure to save context: \(error)")
//    }
//}
//
//func loadParties()
//
//
//    let moc = DataController().managedObjectContext
//    let partyFetch = NSFetchRequest(entityName: "Party")
//
//    do {
//        var parties = try moc.executeFetchRequest(partyFetch) as! [Party]
//
//    } catch {
//       fatalError("Failure to save context: \(error)")
//    }







//