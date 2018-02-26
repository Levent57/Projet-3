//
//  Game.swift
//  Projet 3 : Créez votre premier jeu vidéo avec Swift !
//
//  Created by Levent Bostanci on 05/11/2017.
//  Copyright © 2017 Levent Bostanci. All rights reserved.
//

import Foundation

class Game{

    var teams = [Team]()    //stock the differents teams
    var teamUniqueNames = [String]()    //contain the team unique name
    var characterUniqueNames = [String]()   //contain the character unique name

    func start(){
        gameDescription()
        for i in 0..<2{     // Set at 2 because there is only 2 teams 
            print()
            print("joueur \(i + 1) c'est à vous !")
            let team = creatNewTeam()
            team.characters = addTeamCharacters()
            teams.append(team)
        }
        teamsFight()
        restart()
    }
    
    func gameDescription(){ //Introduce the game
        print("====== Bienvenue dans OC war ======")
        print("Ce jeu mettra en confrontation 2 équipes dans un combat à mort")
    }
    
    func creatNewTeam() -> Team {
        print("Veuillez entrer un nom pour votre équipe: ")
        var teamName: String = ""
        repeat {
            teamName = inputString()
            if teamUniqueNames.contains(teamName){  //create an unique name for the team
                print("=====================================================================")
                print("Ce nom est déjà utilisé, veuillez entrer un nom différent pour votre équipe: ")
                print("=====================================================================")
                teamName = ""
            } else {
                teamUniqueNames.append(teamName)
            }
        }while teamName == ""
        let team = Team(name: teamName)
        return team
    }
    
    //adding characters to teams
    func addTeamCharacters() -> [Character] {
        var charactersArray = [Character]()
        var characterName = ""
        var userChoice = 0
        for i in 0..<3{     //set at 3 because there is only 3 characters per team
            print()
            print("===========================")
            print("Choisissez le personnages numero \(i + 1) de votre équipe parmi les suivants: ")
            print("1. Combattant, personnage polyvalant")
            print("2. Mage, permet de soigner les autres joueurs de on équipe, ne peut pas attaquer")
            print("3. Colosse, personnage résistant aux attaques mais ayant de faibles dégats d'attaque")
            print("4. Nain, peu de vie mais inflige de plus gros dégats aux adversaires")
            print("===========================")
            repeat{
                userChoice = inputInt()
            }while userChoice != 1 && userChoice != 2 && userChoice != 3 && userChoice != 4 //the player's choice is between 1 and 4
            print("Entre le nom de votre personnage: ")
            repeat{
                characterName = inputString()
                if characterUniqueNames.contains(characterName){  //create an unique name for the character
                    print("=====================================================================")
                    print("Ce nom est déjà utilisé, veuillez entrer un nom différent pour votre joueur: ")
                    print("=====================================================================")
                    characterName = ""
                } else {
                    characterUniqueNames.append(characterName)
                }
            }while characterName == ""
            
            switch userChoice {     //add selected character in character array
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
    
    func teamsFight() {
        var userChoice = 0
        repeat{
            for i in 0..<2 {    // Set at 2 because there is only 2 teams
                print()
                print("C'est au tour du joueur \(i + 1) de jouer: ")
                print("==================================")
                print("Description de l'équipe \(i + 1): ")
                print("\(teams[i].teamDescription())")
                print("-- Choissez un personnage: --")
                userChoice = choiceUser()  //the player's choice is between 1 and 3
                
                let characterTeam = teams[i].characters[userChoice - 1]
                
                randomCheast(character: characterTeam) //the chest appears randomly
                
                if let mage = characterTeam as? Mage{   //if the character choosen is a Mage, the game will invite the player to heal an ally
                    print("-- Selectionnez un personnage de votre équipe à soigner --")
                    print("\(teams[i].teamDescription())")  //show his team members
                    userChoice = choiceUser()
                    mage.heal(target: teams[i].characters[userChoice - 1])  //heal the member of his team

                }else{
                    print("-- Selectionnez un personnage de l'équipe adverse à attaquer --")
                    if i == 0 {     //if team 1 is playling
                        print("\(teams[i + 1].teamDescription())")  //show team 2 characters
                        userChoice = choiceUser()
                        characterTeam.attack(target: teams[i + 1].characters[userChoice - 1])
                        if checkTeamIsDead(team: teams[i + 1]){     //check if there are deaths in the team
                            return
                        }
                    } else {    //if team 2 is playing
                        print("\(teams[i - 1].teamDescription())")  //show team 1 characters
                        userChoice = choiceUser()
                        characterTeam.attack(target: teams[i - 1].characters[userChoice - 1])
                        if checkTeamIsDead(team: teams[i - 1]){
                            return
                        }
                    }
                }
            }
        } while true
    }
    
    func choiceUser() -> Int {  
        var userChoice = 0
        repeat{
            userChoice = inputInt()
        } while userChoice != 1 && userChoice != 2 && userChoice != 3
        return userChoice
    }
    
    
    //check if the team characters still alive
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
    
    
    //random appearance of the cheast, add 2 bonus weapons to the game
    func randomCheast(character: Character) {
        let random = arc4random_uniform(99)
        if random < 20 {    //the cheast have 20% chance of appearing
            print("======================")
            print("Un coffre est apparu !")
            print("======================")
            print()
            if character is Mage{   //if the character choosen is a mage, bonus healing weapon emerge
                character.weapon = Wand()
                print("Vos soins sont désormais de \(character.weapon.healPoints) points")
                print()
            } else {
                character.weapon = Bow()    //for the other character, bonus attacking weapon emerge
                print("Les dégats de votre nouvelle arme sont de: \(character.weapon.attackPoints)")
                print()
            }
        }
    }
    
    //allows to restart the game
    func restart(){
        var userChoice : Int
        print("Souhaitez vous relancer une nouvelle partie ?")
        print("1. Oui")
        print("2. Non")
        
        repeat{
            userChoice = inputInt()
        } while userChoice != 1 && userChoice != 2
        
        switch userChoice {
            case 1:     //empty all the arrays
                teams.removeAll()
                teamUniqueNames.removeAll()
                characterUniqueNames.removeAll()
                start()
            case 2:
                print("Merci d'avoir joué !")   //stop the game
            default:
                break
        }
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
