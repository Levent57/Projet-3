//
//  Dwarf.swift
//  Projet 3 : Créez votre premier jeu vidéo avec Swift !
//
//  Created by Levent Bostanci on 05/11/2017.
//  Copyright © 2017 Levent Bostanci. All rights reserved.
//

import Foundation

class Dwarf : Characters{
    override init(){
        super.init()
        type = CharactersType.Dwarf
        healthPoints = 75
        currentHealth = healthPoints
        weapon = Axe()
    }
}
