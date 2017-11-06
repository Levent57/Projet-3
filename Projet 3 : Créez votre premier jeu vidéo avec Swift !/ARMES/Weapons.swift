//
//  Weapons.swift
//  Projet 3 : Créez votre premier jeu vidéo avec Swift !
//
//  Created by Levent Bostanci on 05/11/2017.
//  Copyright © 2017 Levent Bostanci. All rights reserved.
//

import Foundation

class Weapon {
    
    enum WeaponsType{
        case Healing, Attacking
    }
    
    var attackPoints: Int = 0
    var healPoints: Int = 0
    var type: WeaponsType?
}
