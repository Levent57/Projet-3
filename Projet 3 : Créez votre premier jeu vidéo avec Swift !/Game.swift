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
    var teamUniqueNames = [String]()
    var characterUniqueNames = [String]()

    func start(){
        gameDescription()
        for i in 0..<2{
            print()
            print("joueur \(i + 1) c'est à vous !")
            let team = creatNewTeam()
            team.characters = addTeamCharacters()
            teams.append(team)
        }
        fight()
    }
    
    func gameDescription(){
                print("====== Bienvenue dans OC war ======")
                print("Ce jeu mettra en confrontation 2 équipes dans un combat à mort")
            }
    
    func creatNewTeam() -> Team {
        print("Veuillez entrer un nom pour votre équipe: ")
        var teamName: String = ""
        repeat {
            teamName = inputString()
            if teamUniqueNames.contains(teamName){
                repeat{
                print("=====================================================================")
                print("Ce nom est déjà utilisé, veuillez entrer un nom différent pour votre équipe: ")
                print("=====================================================================")
                teamName = inputString()
                } while teamUniqueNames.contains(teamName)
            } else {
                teamUniqueNames.append(teamName)
            }
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
                characterName = inputString()
                if characterUniqueNames.contains(characterName){
                    repeat{
                        print("=====================================================================")
                        print("Ce nom est déjà utilisé, veuillez entrer un nom différent pour votre joueur: ")
                        print("=====================================================================")
                        characterName = inputString()
                    } while characterUniqueNames.contains(characterName)
                } else {
                    characterUniqueNames.append(characterName)
                }
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
    
    func TeamsDescription() {
        print()
        print("==================================")
        print("Description de l'équipe : ")
        for i in teams{
            i.teamDescription()
        }
    }
    
    func fight() {
        var userChoice = 0

        repeat{
            for i in 0..<2 {
                print()
                print("C'est au tour du joueur \(i + 1) de jouer: ")
                
                print("==================================")
                print("Description de l'équipe \(i + 1): ")
                print("\(teams[i].teamDescription())")
                
                print("-- Choissez un personnage: --")
                repeat{
                    userChoice = inputInt()
                } while userChoice != 1 && userChoice != 2 && userChoice != 3
                
                let characterTeam = teams[i].characters[userChoice - 1]
                
                randomCoffre(character: characterTeam)
                
                if let mage = characterTeam as? Mage{
                    print("-- Selectionnez un personnage de votre équipe à soigner --")
                    print("\(teams[i].teamDescription())")
                   
                repeat{
                    userChoice = inputInt()
                } while userChoice != 1 && userChoice != 2 && userChoice != 3
                mage.heal(target: teams[i].characters[userChoice - 1])
                    
                print("Le personnage \(teams[i].characters[userChoice - 1].name) a maintenant \(teams[i].characters[userChoice - 1].currentHealth) points de vie ") //ou desciption équipe
                }else{
                    print("-- Selectionnez un personnage de l'équipe adverse à attaquer --")
                    
                    if i == 0 {
                        print("\(teams[i + 1].teamDescription())")
                        repeat{
                            userChoice = inputInt()
                        }while userChoice != 1 && userChoice != 2 && userChoice != 3
                        characterTeam.attack(target: teams[i + 1].characters[userChoice - 1])
                        
                        print("Il reste \(teams[i + 1].characters[userChoice - 1].currentHealth)  points de vie au personnage \(teams[i + 1].characters[userChoice -    1].name)")
                            if checkTeamIsDead(team: teams[i + 1]){
                                return
                            }
                    } else {
                        print("\(teams[i - 1].teamDescription())")
                        repeat{
                            userChoice = inputInt()
                        } while userChoice != 1 && userChoice != 2 && userChoice != 3
                        characterTeam.attack(target: teams[i - 1].characters[userChoice - 1])
                        
                        print("Il reste \(teams[i - 1].characters[userChoice - 1].currentHealth)  points de vie au personnage \(teams[i - 1].characters[userChoice - 1].name)")
                        if checkTeamIsDead(team: teams[i - 1]){
                            return
                        }
                    }
                }
            }
        } while true
    }
    
    func checkTeamIsDead(team: Team) -> Bool{
        var isDead = false
        for character in team.characters {
            if character.isAlive == true {
                return false
            } else {
                isDead = true
                print("Le personnage \(character.name) est mort")
            }
        }
        return isDead
    }
    
    func randomCoffre(character: Character) {
        let random = Int(arc4random_uniform(99))
        if random < 45 {
            print("======================")
            print("Un coffre est apparu !")
            print("======================")
            print()
            if let mage = character as? Mage{
                mage.weapon = Wand()
                print("Vos soins sont désormais de \(mage.weapon.healPoints) points")
                print()
            } else {
                character.weapon = Bow()
                print("Les dégats de votre nouvelle arme sont de: \(character.weapon.attackPoints)")
                print()
            }
        }
    }

}
