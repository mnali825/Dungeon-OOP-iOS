//
//  enemyMid.swift
//  DungeonOOP
//
//  Created by Mir Ali on 3/4/16.
//  Copyright © 2016 Herban. All rights reserved.
//

import Foundation

class enemyMid:Enemy {
    
    override var loot: [String] {
        return ["Iron Axe","Steel Buckler","Leather Gloves"]
    }
    
    override var lootVal: [String:Int] {
        return ["Iron Axe":5, "Steel Buckler":5, "Leather Gloves":3]
    }
    
    override var lootType: [String:String] {
        return ["Iron Axe":"Attack", "Steel Buckler":"Defense", "Leather Gloves":"Attack"]
    }
}