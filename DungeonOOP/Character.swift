//
//  Character.swift
//  DungeonOOP
//
//  Created by Mir Ali on 3/3/16.
//  Copyright © 2016 Herban. All rights reserved.
//

import Foundation

class Character {
    
    var HP = 100
    fileprivate var _name: String = "Player"
    var attackPower: Int = 10 
    var type: String!
    
    init(HP: Int, name: String, type: String) {
        self.HP = HP
        self._name = name
        self.type = type
    }
    
    var name: String {
        get {
            return _name
        }
    }
    
    func isAlive()->Bool {
        if self.HP <= 0 {
            return false
        }
        else {
            return true
        }
    }
    
    func attack(_ damage:Int)->Bool {
        self.HP -= damage
        return true
    }
    
}
