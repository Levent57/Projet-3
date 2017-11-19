//
//  Game.swift
//  Projet 3 : Créez votre premier jeu vidéo avec Swift !
//
//  Created by Levent Bostanci on 05/11/2017.
//  Copyright © 2017 Levent Bostanci. All rights reserved.
//

import Foundation

class Game{

    var teams = [Team]()
    
        func start(){
                    gameDescription()
                    namePlayer1()
//                    namePlayer2()
//            for i in 0..<2 {
//                print("\nJoueur \(i + 1) Choisissez vos Héros")
//                    creatTeam1()
//                    creatTeam2()
                //créer l'équipe
                //créer joueurs (3)
                //ajouter les joueurs crées à l'équipe
                //ajouter l'équipe au tableau team
//            }
                //début du combat tour par tour
        }

    
        func gameDescription(){
        print("====== Bienvenue dans OC war ======")
        print("Ce jeu mettra en confrontation 2 équipes dans un combat à mort")
    }
    
    var player1 = [Character]()
    var player2 = [Character]()
    var player1Name : String = ""
    var player2Name : String = ""
    
    func namePlayer1(){
        print()
        print("Joueur 1 entrez le nom de votre équipe:")
        if let choice = readLine(){
            player1Name = choice
        }
        creatTeam1()
    }
    
    func namePlayer2(){
        print()
        print("Joueur 2 entrez le nom de votre équipe:")
        if let choice = readLine(){
            player2Name = choice
        }
        creatTeam2()
    }
    
    func creatTeam1(){
    
        var userChoice = 0
        print()
        print("Joueur 1: Veuillez choisir les 3 personnages qui composeront votre équipe: ")
       
        repeat{
            printSelectCharacter()
            repeat{
                userChoice = inputInt()
            }while userChoice != 1 && userChoice != 2 && userChoice != 3 && userChoice != 4
        
            switch userChoice {
            case 1:
                print("Veuillez entrez un nom à votre personnage")
                let characterName = inputString()
                if characterName != nil {
                    let warrior = Warrior(name: "\(characterName)")
                player1.append(warrior)
                }
                
            case 2:
                print("Veuillez entrez un nom à votre personnage")
                let characterName = inputString()
                if characterName != nil {
                let colossus = Colossus(name: "\(characterName)")
                player1.append(colossus)
                }
                
            case 3:
                print("Veuillez entrez un nom à votre personnage")
                let characterName = inputString()
                if characterName != nil {
                let mage = Mage(name: "\(characterName)")
                player1.append(mage)
                }
                
            case 4:
                print("Veuillez entrez un nom à votre personnage")
                let characterName = inputString()
                if characterName != nil {
                let dwarf = Dwarf(name: "\(characterName)")
                player1.append(dwarf)
                }
                
            default:
                break
            }
        }while player1.count != 3
        
            for c in player1 {
                print()
                print("===========================")
                print("Personnage \(c): ")
                c.describ()
            }
        namePlayer2()
    }
    
    func creatTeam2(){
        
        var userChoice = 0
        print()
        print("Joueur 2: Veuillez choisir les 3 personnages qui composeront votre équipe: ")
        
        repeat{
            printSelectCharacter()
            repeat{
                userChoice = inputInt()
            }while userChoice != 1 && userChoice != 2 && userChoice != 3 && userChoice != 4
            
            switch userChoice {
            case 1:
                print("Veuillez entrez un nom à votre personnage")
                let characterName = inputString()
                if characterName != nil {
                let warrior = Warrior(name: "\(characterName)")
                player2.append(warrior)
                }
                
            case 2:
                print("Veuillez entrez un nom à votre personnage")
                let characterName = inputString()
                if characterName != nil {
                let colossus = Colossus(name: "\(characterName)")
                player2.append(colossus)
                }
                
            case 3:
                print("Veuillez entrez un nom à votre personnage")
                let characterName = inputString()
                if characterName != nil {
                let mage = Mage(name: "\(characterName)")
                player2.append(mage)
                }
                
            case 4:
                print("Veuillez entrez un nom à votre personnage")
                let characterName = inputString()
                if characterName != nil {
                let dwarf = Dwarf(name: "\(characterName)")
                player2.append(dwarf)
                }
                
            default:
                break
            }
        }while player2.count != 3
        
        for c in player2 {
            print()
            print("=======================")
            print("Personnage \(c): ")
            c.describ()
        }
    }
    
    func printSelectCharacter(){
        print("===========================")
        print("1. Combattant, personnage polyvalant")
        print("2. Colosse, personnage résistant aux attaques mais ayant de faibles dégats d'attaque")
        print("3. Mage, permet de soigner les autres joueurs de on équipe, ne peut pas attaquer")
        print("4. Nain, peu de vie mais inflige de plus gros dégats aux adversaires")
        print("===========================")
    }
    
    
    
    
    func inputInt() -> Int {
        guard let data = readLine() else { return 0 }
        guard let dataToInt = Int(data) else { return 0 }
        return dataToInt
    }

    func inputString() -> String {
        guard let data = readLine() else { return "" }
        return data
    }


}
