//
//  Colossus.swift
//  Projet 3 : Créez votre premier jeu vidéo avec Swift !
//
//  Created by Levent Bostanci on 05/11/2017.
//  Copyright © 2017 Levent Bostanci. All rights reserved.
//

import Foundation

class Colossus : Character{

    init(name: String){
        super.init(name: name, type: .Colossus, healthPoints: 140, weapon: Shield())
    }
}
