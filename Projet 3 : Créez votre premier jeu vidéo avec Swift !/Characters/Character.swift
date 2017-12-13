//
//  Characters.swift
//  Projet 3 : Créez votre premier jeu vidéo avec Swift !
//
//  Created by Levent Bostanci on 05/11/2017.
//  Copyright © 2017 Levent Bostanci. All rights reserved.
//

import Foundation

enum CharacterType{
    case Warrior, Mage, Colossus, Dwarf
}

class Character {
    
    var name: String
    let type: CharacterType
    
    let healthPoints: Int
    var currentHealth: Int
    var weapon: Weapon


    init(name: String, type: CharacterType, healthPoints: Int, weapon: Weapon){
        self.name = name
        self.type = type
        self.healthPoints = healthPoints
        self.currentHealth = healthPoints
        self.weapon = weapon
    }

    func describ() {
        print()
        print("Nom du personnage: \(self.name) // Vie: \(currentHealth)/\(healthPoints) // Dégats de l'arme: \(self.weapon.attackPoints) // Soins prodigués: \(self.weapon.healPoints)")
    }
    
    var isAlive: Bool {
        if currentHealth <= 0 {
            return false
        } else {
            return true
        }
    }
    
    func attack(target: Character){
        if self.currentHealth > 0 {
            if target.currentHealth > 0{
                target.currentHealth -= self.weapon.attackPoints
                print("*** Vous avez infligés \(self.weapon.attackPoints) points de dégats ***")
                if target.currentHealth < 0 {
                    target.currentHealth = 0
                }
            }
        }
    }
    
    
 


}

