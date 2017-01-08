//
//  Enemy.swift
//  DungeonOOP
//
//  Created by Mir Ali on 3/4/16.
//  Copyright © 2016 Herban. All rights reserved.
//

import Foundation

class Enemy: Character {
    
    var loot: [String]! {
        return ["Rusty Dagger", "Cracked Shield", "Worn Gloves"]
        
    }
    var lootVal: [String: Int]! {
        return ["Rusty Dagger":3, "Cracked Shield":2, "Worn Gloves":1]
    }
    var lootType: [String:String]! {
        return["Rusty Dagger":"Attack", "Cracked Shield": "Defense", "Worn Gloves":"Atack"]
    }
    
    var immunity: Int = 0
    
    convenience init(immunity:Int, HP: Int, name: String, type: String) {
        self.init(HP: HP, name: name, type: type)
        self.immunity = immunity
    
    }
    
    func increaseStats(_ player:Character, loots:String) {
        if loots == "Rusty Dagger" {
            player.attackPower += lootVal["Rusty Dagger"]!
        }
            
        else if loots == "Cracked Shield" {
            player.HP += lootVal["Cracked Shield"]!
        }
        else if loots == "Worn Gloves" {
            player.attackPower += lootVal["Worn Gloves"]!
        }
    }
    
    func dropLoot()->String? {
        
        if !isAlive() {
            let rand = Int(arc4random_uniform(UInt32(loot.count)))
            return loot[rand]
        }
        
        return nil
        
    }
    
    override func attack(_ damage: Int)-> Bool{
        if damage >= immunity {
            super.attack(damage)
            return true
        }
        else {
            return false
        }
    }
}
