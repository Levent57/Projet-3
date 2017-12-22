//
//  Weapons.swift
//  Projet 3 : Créez votre premier jeu vidéo avec Swift !
//
//  Created by Levent Bostanci on 05/11/2017.
//  Copyright © 2017 Levent Bostanci. All rights reserved.
//

import Foundation

enum WeaponType{
    case Healing, Attacking
}

class Weapon {
    
    let attackPoints: Int
    let healPoints: Int
    let type: WeaponType
    
    init(attackPoints: Int, healPoints: Int, type: WeaponType){
        self.attackPoints = attackPoints
        self.healPoints = healPoints
        self.type = type
    }
}
