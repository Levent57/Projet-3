//
//  Sword.swift
//  Projet 3 : Créez votre premier jeu vidéo avec Swift !
//
//  Created by Levent Bostanci on 05/11/2017.
//  Copyright © 2017 Levent Bostanci. All rights reserved.
//

import Foundation

class Sword : Weapon{

    init(){
        super.init(attackPoints: 10, healPoints: 0, type: .Attacking)
    }
}
