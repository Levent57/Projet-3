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
        for i in 0..<2{
            print()
            print("joueur \(i + 1) c'est à vous !")
            let team = creatNewTeam()
            team.characters = addTeamCharacters()
            teams.append(team)
        }
            GameDescription()
//        le combat commence
    }
    
    
    func gameDescription(){
                print("====== Bienvenue dans OC war ======")
                print("Ce jeu mettra en confrontation 2 équipes dans un combat à mort")
            }
    
    func creatNewTeam() -> Team {
        print("Veuillez entrer un nom pour votre équipe: ")
        var teamName: String = ""
        repeat {
            //        ici que se fera la verif des noms
            teamName = inputString()
        }while teamName == ""
        let team = Team(name: teamName)
        return team
    }
    
    
    func addTeamCharacters() -> [Character] {
        
        var charactersArray = [Character]()
        var characterName = ""
        var userChoice = 0
        
        for i in 0..<3{
            print()
            print("===========================")
            print("Choisissez le personnages numero \(i + 1) de votre équipe parmi les suivants: ")
            print("1. Combattant, personnage polyvalant")
            print("2. Colosse, personnage résistant aux attaques mais ayant de faibles dégats d'attaque")
            print("3. Mage, permet de soigner les autres joueurs de on équipe, ne peut pas attaquer")
            print("4. Nain, peu de vie mais inflige de plus gros dégats aux adversaires")
            print("===========================")
            repeat{
                userChoice = inputInt()
            }while userChoice != 1 && userChoice != 2 && userChoice != 3 && userChoice != 4
            print("Entre le nom de votre personnage: ")
            repeat{
//                verifier nom de l'utilisateur
                characterName = inputString()
            }while characterName == ""
            
            switch userChoice {
            case 1:
                let warrior = Warrior(name: characterName)
                charactersArray.append(warrior)
            case 2:
                let mage = Mage(name: characterName)
                charactersArray.append(mage)
            case 3:
                let colossus = Colossus(name: characterName)
                charactersArray.append(colossus)
            case 4:
                let dwarf = Dwarf(name: characterName)
                charactersArray.append(dwarf)
            default:
                break
            }
        }
         return charactersArray
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
    

    func GameDescription() {
    print()
    print("==================================")
    print("Résumé des deux équipes: ")
    for t in teams {
        t.teamDescription()
            }
        }
    
    func fight(playerOne : Character, playerTwo: Character){
        print("Que le combat commence !")
    
    }
    
    
    }
