//
//  Characters.swift
//  Projet 3 : Créez votre premier jeu vidéo avec Swift !
//
//  Created by Levent Bostanci on 05/11/2017.
//  Copyright © 2017 Levent Bostanci. All rights reserved.
//

import Foundation

class Characters {
    
    enum CharactersType{
        case Warrior, Mage, Colossus, Dwarf
    }
    
    var name: String?
    var type: CharactersType?
    var number: Int?
    
    var healthPoints: Int?
    var currentHealth: Int?
    var weapon: Weapon? 


//        var mainDescription: String? = "Character N°: \(self.number!), Name: \(self.name!), Type: \(self.type!), HP: \(self.currentHealth!)/\(healthPoints!)"
    

    
}
