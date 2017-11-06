//
//  Colossus.swift
//  Projet 3 : Créez votre premier jeu vidéo avec Swift !
//
//  Created by Levent Bostanci on 05/11/2017.
//  Copyright © 2017 Levent Bostanci. All rights reserved.
//

import Foundation

class Colossus : Characters{
    override init(){
        super.init()
        type = CharactersType.Colossus
        healthPoints = 140
        currentHealth = healthPoints
        weapon = Shield()
    }
}
