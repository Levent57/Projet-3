//
//  Mage.swift
//  Projet 3 : Créez votre premier jeu vidéo avec Swift !
//
//  Created by Levent Bostanci on 05/11/2017.
//  Copyright © 2017 Levent Bostanci. All rights reserved.
//

import Foundation

class Mage : Character{

    init(name: String){
        super.init(name: name, type: .Mage, healthPoints: 100, weapon: Staff())
    }
    
    //the mage can not attack
    override func attack(target: Character) {
        print("Ne peut pas attaquer")
    }
    
    //will make a character from its own team recover amount of health point
    func heal(target: Character){
        if self.currentHealth > 0 {     //check if mage is alive
            if target.currentHealth > 0 {    //check if target is alive
                target.currentHealth += self.weapon.healPoints
                print("*** Vous avez soigné le personnage de \(self.weapon.healPoints) points ***")
                print("Le personnage \(target.name) a maintenant \(target.currentHealth)/\(target.healthPoints) points de vie")
                if target.currentHealth > target.healthPoints{
                    target.currentHealth = target.healthPoints     //does not exceed his maximum health points
                }
            }
        }
    }
    
 
}
