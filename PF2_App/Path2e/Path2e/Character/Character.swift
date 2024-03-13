//
//  Character.swift
//  Path2e
//
//  Created by Ryan Weber on 7/18/23.
//

import Foundation
import RealmSwift

class Character: Object, ObjectKeyIdentifiable {

    //MARK: Name and Alignment
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String = "New Character"
    @Persisted var ethicsAlignment: String = "Neutral"
    @Persisted var moralsAlignment: String = "Neutral"
    var alignment: String {
        let str = ethicsAlignment+" "+moralsAlignment
        if str == "Neutral Neutral" {
            return "True Neutral"
        } else {
            return str
        }
    }
    var alignmentAbbrev: String {
        return alignment.components(separatedBy: " ").reduce("") { $0 + ($1.first.map(String.init) ?? "") }
    }
    var alignmentImage: String {
        switch alignment.components(separatedBy: " ")[0] {
        case "Lawful":
            return "hammer.circle"
        case "Neutral":
            return "staroflife.fill"
        case "Chaotic":
            return "tornado"
        default:
            return "staroflife.fill"
        }
    }
    var alignmentColor: UIColor {
        switch alignment.components(separatedBy: " ")[1] {
        case "Good":
            return UIColor.blue
        case "Neutral":
            return UIColor.gray
        case "Evil":
            return UIColor.red
        default:
            return UIColor.gray
        }
    }
    
    //MARK: HP
    @Persisted var tempHP: Int = 0
    @Persisted var currentHP: Int = 0
    var maxHP: Int {
        var hp: Int = 0
        if ancestry != nil {
            hp += ancestry!.hitPoints
        }
        if currentClass != nil {
            hp += currentClass!.hitPoints*level
        }
        hp += returnAbilityScoreMod(ability: "Constitution", excludeRoute: nil)*level
        hp += returnMaxHealthModificationBonus()
        hp += maxHealthCustomScore
        return hp
    }
    @Persisted var maxHealthCustomScore: Int = 0
    
    //MARK: Level
    @Persisted var level = 1
    var halfLevel: Int {
        return max(Int(level/2),1)
    }
    var levelString: String {
        String(level)
    }
    @Persisted var xp = 0
//    @Persisted var xpOverflow = 0
    
    //MARK: Class
    @Persisted var currentClass: CharacterClass? = nil
    
    //MARK: Ancestry
    @Persisted var ancestry: CharacterAncestry? = nil
    
    //MARK: Heritage
    @Persisted var heritage: CharacterHeritage? = nil
    
    //MARK: Versatile Heritage
    @Persisted var versatileHeritage: CharacterVersatileHeritage? = nil
    
    //MARK: Background
    @Persisted var background: CharacterBackground? = nil
    
    //MARK: Class Ability
    @Persisted var classAbilities = RealmSwift.List<CharacterClassAbility>()
    @Persisted var strCustomScore: Int = 0
    @Persisted var dexCustomScore: Int = 0
    @Persisted var conCustomScore: Int = 0
    @Persisted var intCustomScore: Int = 0
    @Persisted var chaCustomScore: Int = 0
    @Persisted var wisCustomScore: Int = 0

    //MARK: Saving Throws
    @Persisted var reflexCustomSavingThrow: Int = 0
    @Persisted var fortitudeCustomSavingThrow: Int = 0
    @Persisted var willCustomSavingThrow: Int = 0
    
    //MARK: Ancestry Feats
    @Persisted var ancestryFeats = RealmSwift.List<CharacterFeat>()
    
    //MARK: Initial Trained Skills
    @Persisted var initialTrainedSkills = RealmSwift.List<CharacterProficiency>()
    
    //MARK: Initial Languages
    @Persisted var initialLanguages = RealmSwift.List<String>()
    
    //MARK: - Money -
    @Persisted var platinum: Int = 0
    @Persisted var gold: Int = 15
    @Persisted var silver: Int = 0
    @Persisted var copper: Int = 0
    
    //MARK: Spells
    @Persisted var spellLists: RealmSwift.List<CharacterSpellList>
    
    //MARK: Formulas
    @Persisted var formulaList: CharacterFormulaList? = CharacterFormulaList(researchField: "")
    
    //MARK: Conditions
    @Persisted var conditions: RealmSwift.List<CharacterCondition>
    
    //MARK: Perception
    @Persisted var customPerceptionScore: Int = 0
    
    //MARK: Class DC
    @Persisted var customClassDCScore: Int = 0
    
    //MARK: AC
    @Persisted var customACScore: Int = 0
    
    //MARK: Speed
    @Persisted var customSpeedScore: Int = 0
    @Persisted var customFlySpeedScore: Int = 0
    @Persisted var customClimbSpeedScore: Int = 0
    @Persisted var customSwimSpeedScore: Int = 0
    @Persisted var customBurrowSpeedScore: Int = 0
    
    
    //MARK: Attack
    @Persisted var inRage: Bool = false
    @Persisted var customAttackBonus: Int = 0
    
}



