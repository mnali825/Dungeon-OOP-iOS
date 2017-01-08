//
//  ViewController.swift
//  DungeonOOP
//
//  Created by Mir Ali on 3/3/16.
//  Copyright © 2016 Herban. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var actionLabel: UILabel!
    @IBOutlet var enemyHP: UILabel!
    @IBOutlet var playerHP: UILabel!
    @IBOutlet var enemyImage: UIImageView!
    @IBOutlet var chestImage: UIButton!
    
    @IBOutlet var playerName: UILabel!
    @IBOutlet var playerAtk: UILabel!
    @IBOutlet var playerHealth: UILabel!
    @IBOutlet var enemyType: UILabel!
    @IBOutlet var enemyImmune: UILabel!
    
    @IBOutlet var statIncrease: UIView!
    @IBOutlet var statIncreaseLabel: UILabel!
    
    var player:Character!
    var enemy:Enemy!
    var chestMessage: String!
    var currentLoot: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        player = Character(HP: 100, name: "Mir0ko", type: "Human")
        playerHP.text = "\(player.HP) HP"
        generateEnemy()
        playerName.text = "\(player.name)"
        playerAtk.text = "Attack : \(player.attackPower)"
        playerHealth.text = "Health : \(player.HP)"
        
        }
    
    func generateEnemy() {

        let rand1 = Int(arc4random_uniform(10))
        let rand2 = Int(arc4random_uniform(20))
        if player.attackPower <= 15 {
            enemy = Enemy(immunity: rand1, HP: 100, name: "Orc", type: "Orc")
        } else {
            enemy = enemyMid(immunity: rand2, HP: 100, name: "Orc", type: "Warlock")
        }
        
        
        actionLabel.text = "Encountered \(enemy.type) with \(enemy.immunity) Immunity"
        enemyHP.text = "\(enemy.HP) HP"
        enemyType.text = "Type : \(enemy.type)"
        enemyImmune.text = "Immune : \(enemy.immunity)"
        enemyImage.isHidden = false
    }
    
    @IBAction func attack(_ sender: AnyObject) {
        if enemy.HP > 0 {
            let type = enemy.type
            if enemy.attack(player.attackPower){
                
                actionLabel.text = "\(player.name) attacked \(type) for \(player.attackPower) damage"
                
            } else {
                
                actionLabel.text = "\(type) is immune to your attacks!"
            }
        }
        
        if let loot = enemy.dropLoot() {
            chestMessage = "\(enemy.type) dropped \(loot)!"
            currentLoot = loot
        }
        
        if !enemy.isAlive() {
            enemyImage.isHidden = true
            chestImage.isHidden = false
            enemyHP.text = ""
            actionLabel.text = "\(player.name) killed \(enemy.type)"
            
        }
        
        enemyHP.text = "\(enemy.HP) HP"
    }
    
    @IBAction func runAway(_ sender: AnyObject) {
        enemyImage.isHidden = true
        Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(ViewController.generateEnemy), userInfo: nil, repeats: false)
    }

    @IBAction func tapChest(_ sender: AnyObject) {
        chestImage.isHidden = true
        actionLabel.text = chestMessage
        Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(ViewController.generateEnemy), userInfo: nil, repeats: false)
        
        statIncreaseLabel.text = "+\(enemy.lootVal[currentLoot]!) \(enemy.lootType[currentLoot]!)"
        statIncrease.isHidden = false

    }

    
    func addStats(_ loot: String) {
        if loot == "Rusty Dagger" {
            player.attackPower += enemy.lootVal[loot]!
            playerAtk.text = "Attack : \(player.attackPower)"
        }
        else if loot == "Cracked Shield" {
            player.HP += enemy.lootVal[loot]!
            playerHP.text = "Health : \(player.HP)"
            playerHealth.text = "Health : \(player.HP)"
            
        }
        else if loot == "Worn Gloves" {
            player.attackPower += enemy.lootVal[loot]!
            playerAtk.text = "Attack : \(player.attackPower)"
        }
    }
    
    @IBAction func addStatBox(_ sender: AnyObject) {
        statIncrease.isHidden = true
        addStats(currentLoot)
    }
}

