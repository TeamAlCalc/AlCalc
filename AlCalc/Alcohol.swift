//
//  Alcohol.swift
//  AlCalc
//
//  Created by Ethan on 3/30/16.
//  Copyright © 2016 Team AlCalc. All rights reserved.
//

import Foundation

class Alcohol: NSObject {
    
    var name: String! = nil
    var qty: Int! = nil
    var price: Double! = nil
    var floz: Int! = nil
    var abv: Double! = nil
    
    init(n: String, q: Int, p: Double, f: Int, a: Double) {
        self.name = n
        self.qty = q
        self.price = p
        self.floz = f
        self.abv = a
    }
    
    
}