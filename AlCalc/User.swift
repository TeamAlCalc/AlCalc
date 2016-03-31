//
//  User.swift
//  AlCalc
//
//  Created by Ethan on 3/30/16.
//  Copyright © 2016 Team AlCalc. All rights reserved.
//

import Foundation

class User: NSObject, NSCoding {
    
    var dob: String

    struct PropertyKey {
    
        static let dobKey = "usersDob"//dateOfBirth
    
    }
    
    //MARK: NSCoding
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(dob, forKey: PropertyKey.dobKey)
    
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let dob = aDecoder.decodeObjectForKey(PropertyKey.dobKey) as! String
        
        self.init(dob: dob)
        
    }
    
    init?(dob: String) {
        // Initialize stored properties.
        self.dob = dob
        
        super.init()
        // Initialization should fail if there is no name or if the rating is negative.
        if dob.isEmpty{
            return nil
        }
    }
    
    // MARK: Archiving Paths
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("dateOfBirth")
    
}