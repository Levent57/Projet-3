//
//  Staff.swift
//  Projet 3 : Créez votre premier jeu vidéo avec Swift !
//
//  Created by Levent Bostanci on 05/11/2017.
//  Copyright © 2017 Levent Bostanci. All rights reserved.
//

import Foundation

class Staff : Weapon{
 
    init(){
        super.init(attackPoints: 0, healPoints: 8, type: .Healing)
    }
}
