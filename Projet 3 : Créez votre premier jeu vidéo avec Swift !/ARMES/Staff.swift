//
//  Staff.swift
//  Projet 3 : Créez votre premier jeu vidéo avec Swift !
//
//  Created by Levent Bostanci on 05/11/2017.
//  Copyright © 2017 Levent Bostanci. All rights reserved.
//

import Foundation

class Staff : Weapon{
    
    override init(){
        super.init()
        type = .Healing
        self.healPoints = 8
    }
}
