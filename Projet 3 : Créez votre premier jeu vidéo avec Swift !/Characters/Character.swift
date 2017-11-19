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
    var number: Int?
    
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
        
        print("Nom du personnage: \(self.name)"
            + "\nType: \(self.type)"
            + "\nVie: \(currentHealth)/\(healthPoints)"
            + "\nArme: \(self.weapon)"
            + "")
    }

    func attack(target: Character){
        target.currentHealth -= self.weapon.attackPoints
        if self.currentHealth < 0 {
            self.currentHealth = 0
        }
    }



}

