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
    
    override func attack(target: Character) {
        print("peut pas attack")
    }
    
    func heal(target: Character){
        if target.currentHealth > 0{
            target.currentHealth += self.healthPoints
            if target.currentHealth > target.healthPoints{
                target.currentHealth = target.healthPoints
            }
        }
    }
}
