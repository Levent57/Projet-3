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
    
    var name: String    //name of the character
    let type: CharacterType   //type of the character
    
    let healthPoints: Int   //maximum healthPoints of the character
    var currentHealth: Int  //current healthPoints of the character
    var weapon: Weapon  //weapon carry by the character


    //character class init
    init(name: String, type: CharacterType, healthPoints: Int, weapon: Weapon){
        self.name = name
        self.type = type
        self.healthPoints = healthPoints
        self.currentHealth = healthPoints
        self.weapon = weapon
    }

    //Description of the Character, that contain the name, his life and the damage of the weapon
    func describ() {
        print("Nom du personnage: \(self.name) // Vie: \(currentHealth)/\(healthPoints) // Dégats de l'arme: \(self.weapon.attackPoints) // Soins prodigués: \(self.weapon.healPoints)")
    }
    
    //Check if character is still alive
    var isAlive: Bool {
        if currentHealth <= 0 { //if character is Dead
            return false
        } else {
            return true
        }
    }
    
    
    func attack(target: Character){
        if self.currentHealth > 0{  //check if character is alive
            if target.currentHealth > 0{    //check if target is alive
                target.currentHealth -= self.weapon.attackPoints
                print("*** Vous avez infligés \(self.weapon.attackPoints) points de dégats ***")
                if target.currentHealth < 0 {
                    target.currentHealth = 0    //can not go below 0 healsPoints
                }
                print("Il reste \(target.currentHealth)/\(target.healthPoints) points de vie au personnage \(target.name) ")
            } else {
                print("La cible est morte")
            }
        } else {
            print("Ce personnage est mort")
        }
    }

}

