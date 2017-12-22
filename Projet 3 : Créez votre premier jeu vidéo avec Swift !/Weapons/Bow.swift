//
//  X.swift
//  Projet 3 : Créez votre premier jeu vidéo avec Swift !
//
//  Created by Levent Bostanci on 08/12/2017.
//  Copyright © 2017 Levent Bostanci. All rights reserved.
//

import Foundation

class Bow : Weapon {    //Bonus attacking weapon
   
    init(){
        super.init(attackPoints: 25, healPoints: 0, type: .Attacking)
    }
}
