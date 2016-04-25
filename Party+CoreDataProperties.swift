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

    @NSManaged var guestList: [String]
    @NSManaged var purchasedBeer: [String]
    @NSManaged var payed: [Bool]
    @NSManaged var date: String
    @NSManaged var price: String
    @NSManaged var cans: String
    @NSManaged var notifID: String

}

