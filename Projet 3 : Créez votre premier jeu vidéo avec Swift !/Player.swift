//
//  Player.swift
//  Projet 3 : Créez votre premier jeu vidéo avec Swift !
//
//  Created by Levent Bostanci on 07/11/2017.
//  Copyright © 2017 Levent Bostanci. All rights reserved.
//

import Foundation


//class Player {
//
//    var characters = [Character]()
//    
//    let playerIDNumber : Int
//    
//    init(playerIDNumber: Int){
//        self.playerIDNumber = playerIDNumber
//    }
//    
//    
//    func printTeam() {
//        print("Équipe du joueur \(self.playerIDNumber): ")
//        for charac in characters{
//            print(charac)
//        }
//    }
//    
//    func initiateTeamBuilding(numberOfCharacterToGenerate: Int, playersList: [Player]){
//        print()
//        print("C'est un tour du joueur \(playerIDNumber)")
//        print()
//        for characterNumber in 1...numberOfCharacterToGenerate {
//            pickCharacter(characterNumber: characterNumber, playerList: playersList)
//        }
//    }
//    
//    func pickCharacter(characterNumber: Int, playerList: [Player]){
//        
//        var newCharacter: Character? = nil
//        
//        print("Joueur \(characterNumber): choisissez parmis les personnages suivants:")
//        print()
//        print("1. Combattant, 2. Colosse, 3. Nain, 4. Mage")
//        
//        var validInputForType: Bool
//        
//        repeat{
//            print("Entre un chiffre compris entre 1 et 5 pour composer votre équipe")
//            
//            validInputForType = true
//            
//            let typeChoiceNumber = readLine()!
//            
//            switch typeChoiceNumber{
//                case "1":
//                    newCharacter = Warrior(name: "")
//                case "2":
//                    newCharacter = Colossus(name: "")
//                case "3":
//                    newCharacter = Dwarf(name: "")
//                case "4":
//                    newCharacter = Mage(name: "")
//            default:
//                validInputForType = false
//            }
//        }while !validInputForType
//    }
//    
//    
//    
//}

