//
//  Game.swift
//  Projet 3 : Créez votre premier jeu vidéo avec Swift !
//
//  Created by Levent Bostanci on 05/11/2017.
//  Copyright © 2017 Levent Bostanci. All rights reserved.
//

import Foundation

class Game{
    

    func newGame(){
                gameDescription()
                creatTeam()
        }
    
    func gameDescription(){
            print("====== Bienvenue dans OC war ======")
            print("Ce jeu mettra en confrontation 2 équipes dans un combat à mort")
        }
    

    func creatTeam(){
        var team1 =  [Characters]()
//        var team2 = [Characters]()
        let boucleInfinie = true
//        let numberOfPlayer = 2
//        let numberOfCharacterPerPlayer = 3
        var choice1 = 0
        repeat{
            accueil()
            repeat{
                choice1 = inputInt()
            }while choice1 != 1 && choice1 != 2 && choice1 != 3 && choice1 != 4
            
            switch choice1{
            case 1:
                let warrior = Warrior()
                team1.append(warrior)
            case 2:
                let mage = Mage()
                team1.append(mage)
            case 3:
                let colossus = Colossus()
                team1.append(colossus)
            case 4:
                let dwarf = Dwarf()
                team1.append(dwarf)
            default:
                break
            
            }
        }while boucleInfinie       
    }

    func accueil(){
        print()
        print("Choisissez les personnages qui composeront l'équipe 1")
        print("1. Combattant")
        print("2. Mage")
        print("3. Géant")
        print("4. Nain")
    }


    func inputInt() -> Int {
        guard let data = readLine() else { return 0 }
        guard let dataToInt = Int(data) else { return 0 }
        return dataToInt
    }

}
    

