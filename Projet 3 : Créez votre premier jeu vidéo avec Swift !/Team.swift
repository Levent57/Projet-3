//
//  Team.swift
//  Projet 3 : Créez votre premier jeu vidéo avec Swift !
//
//  Created by Levent Bostanci on 15/11/2017.
//  Copyright © 2017 Levent Bostanci. All rights reserved.
//

import Foundation

class Team {
    var characters = [Character]()  //list of game character that represent the team of the player
    
    var name : String
  
    //team class init
    init(name: String){
        self.name = name
    }
    
    //print the team name, that contain characters description
    func teamDescription() {
        print()
        print("Nom de l'équipe : \(self.name)")
        for c in characters {
            c.describ()
        }
    }
    
}
