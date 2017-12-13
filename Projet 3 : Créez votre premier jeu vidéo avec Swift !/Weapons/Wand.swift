//
//  BonusWeapon2.swift
//  Projet 3 : Créez votre premier jeu vidéo avec Swift !
//
//  Created by Levent Bostanci on 13/12/2017.
//  Copyright © 2017 Levent Bostanci. All rights reserved.
//

import Foundation

class Wand : Weapon{
    
    init(){
        super.init(attackPoints: 0, healPoints: 25, type: .Healing)
    }
}
