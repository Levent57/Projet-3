//
//  Team.swift
//  Projet 3 : Créez votre premier jeu vidéo avec Swift !
//
//  Created by Levent Bostanci on 15/11/2017.
//  Copyright © 2017 Levent Bostanci. All rights reserved.
//

import Foundation

class Team {
    var characters = [Character]()
    
    var name : String
    
    init(name: String){
        self.name = name
    }
    
    func teamDescription() {
        print()
        print("Nom de l'équipe : \(self.name) ")
        for c in characters {
            c.describ()
        }
    }
    
}
