

import Foundation
import RealmSwift

class ChosenFeaturesModel: ObservableObject, Hashable {

    // Skill
    @Published var chooseLore: [String] = ["","","","",""]
    @Published var chooseLoreIncreasing: [String] = ["","","","",""]
    @Published var chooseSkill = ChosenSkill()
    @Published var chooseSkillFromList: [ChosenSkill] = [ChosenSkill(),ChosenSkill(),ChosenSkill(),ChosenSkill(),ChosenSkill()]
    @Published var skillIncrease = ChosenSkill()
    @Published var skillProficiency: [ChosenSkill] = [ChosenSkill(),ChosenSkill(),ChosenSkill(),ChosenSkill(),ChosenSkill()]
    // Spell
    @Published var chooseSpells: [ChosenSpellModel] = [ChosenSpellModel(),ChosenSpellModel(),ChosenSpellModel(),ChosenSpellModel(),ChosenSpellModel()]
    @Published var chooseSpellFromList: [ChosenSpellModel] = [ChosenSpellModel(),ChosenSpellModel(),ChosenSpellModel(),ChosenSpellModel(),ChosenSpellModel()]
    // Feature
    @Published var commonAncestryTrait: String = ""
    @Published var keyAbility: String = ""
    @Published var abilityBoost = ChosenAbilityBoostModel()
    @Published var languages: [String] = ["","","","",""]
    @Published var classAbilityFeatures: [ChosenClassAbilityModel?] = [nil,nil,nil,nil,nil]
    @Published var deity: DeityData? = nil
    @Published var domain: DomainData? = nil
    @Published var advancedDomain: DomainData? = nil
    // Weapon and Armor
    @Published var alchemicalFormula: [ItemData?] = [nil,nil,nil,nil,nil]
    @Published var fieldFormula: [ItemData?] = [nil,nil,nil,nil,nil]
    @Published var rageWeapon: ChosenItemModel? = nil
    // Feats
    @Published var giveFeat: [ChosenFeatModel] = [ChosenFeatModel(),ChosenFeatModel(),ChosenFeatModel(),ChosenFeatModel(),ChosenFeatModel()]
    @Published var chooseFeat: [ChosenFeatModel] = [ChosenFeatModel(),ChosenFeatModel(),ChosenFeatModel(),ChosenFeatModel(),ChosenFeatModel()]
    @Published var chooseFeatFromList: [ChosenFeatModel] = [ChosenFeatModel(),ChosenFeatModel(),ChosenFeatModel(),ChosenFeatModel(),ChosenFeatModel()]
    // ConditionalChanges
    @Published var ifGiveFeat: [ChosenFeatModel] = [ChosenFeatModel(),ChosenFeatModel(),ChosenFeatModel(),ChosenFeatModel(),ChosenFeatModel()]
    @Published var elseGiveFeat: [ChosenFeatModel] = [ChosenFeatModel(),ChosenFeatModel(),ChosenFeatModel(),ChosenFeatModel(),ChosenFeatModel()]
    
    @Published var updateView: Bool = false
    static func == (lhs: ChosenFeaturesModel, rhs: ChosenFeaturesModel) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(chooseLore)
        hasher.combine(chooseLoreIncreasing)
        hasher.combine(chooseSkill)
        hasher.combine(chooseSkillFromList)
        hasher.combine(skillIncrease)
        hasher.combine(skillProficiency)
        hasher.combine(chooseSpells)
        hasher.combine(chooseSpellFromList)
        hasher.combine(commonAncestryTrait)
        hasher.combine(keyAbility)
        hasher.combine(abilityBoost)
        hasher.combine(languages)
        hasher.combine(classAbilityFeatures)
        hasher.combine(deity)
        hasher.combine(domain)
        hasher.combine(advancedDomain)
        hasher.combine(alchemicalFormula)
        hasher.combine(fieldFormula)
        hasher.combine(rageWeapon)
        hasher.combine(giveFeat)
        hasher.combine(chooseFeat)
        hasher.combine(chooseFeatFromList)
        hasher.combine(ifGiveFeat)
        hasher.combine(elseGiveFeat)
    }
    
    func returnCharacterEffect(levelGained: Int, effects: Coding, containerKey: ObjectId) -> CharacterEffects {
        let newEffects = CharacterEffects()
        newEffects.containerKey = containerKey
        // -- FEATS --
        if effects.feat != nil {
            for featModel in giveFeat {
                if featModel.feat != nil {
                    newEffects.feats.append(featModel.returnCharacterFeat(levelGained: levelGained))
                }
            }
            for featModel in chooseFeat {
                if featModel.feat != nil {
                    newEffects.feats.append(featModel.returnCharacterFeat(levelGained: levelGained))
                }
            }
            for featModel in chooseFeatFromList {
                if featModel.feat != nil {
                    newEffects.feats.append(featModel.returnCharacterFeat(levelGained: levelGained))
                }
            }
//            newEffects.overrideFeatLevel = effects.feat!.overrideFeatLevel
        }
        // -- SKILLS --
        if effects.skill != nil {
            var newSkill = CharacterSkill()
            if effects.skill!.addLevelToUntrainedSkills == true {
                newEffects.addLevelToUntrainedSkills = true
            }
            
            if chooseSkill.name.count > 0 {
                for index in chooseSkill.name.indices {
                    newSkill = CharacterSkill()
                    newSkill.skill = chooseSkill.name[index]
                    newSkill.prof = chooseSkill.prof[index]
                    newEffects.skills.append(newSkill)
                }
            }
            for skillModel in chooseSkillFromList {
                if skillModel.name.count > 0  {
                    for index in skillModel.name.indices {
                        newSkill = CharacterSkill()
                        newSkill.skill = skillModel.name[index]
                        newSkill.prof = skillModel.prof[index]
                        newEffects.skills.append(newSkill)
                    }
                }
            }
            if skillIncrease.name.count > 0 {
                for index in skillIncrease.name.indices {
                    newSkill = CharacterSkill()
                    newSkill.skill = skillIncrease.name[index]
                    newSkill.prof = skillIncrease.prof[index]
                    newEffects.skills.append(newSkill)
                }
            }
            for index in effects.skill!.skillProficiencies.indices {
                if skillProficiency[index].returnSelection() != "Unselected" {
                    newSkill = CharacterSkill()
                    newSkill.skill = skillProficiency[index].name[0]
                    newSkill.prof = skillProficiency[index].prof[0]
                    newEffects.skills.append(newSkill)
                } else {
                    newSkill = CharacterSkill()
                    newSkill.skill = effects.skill!.skillProficiencies[index].name!
                    newSkill.prof = convertProf(effects.skill!.skillProficiencies[index].prof)
                    newEffects.skills.append(newSkill)
                }
            }
            for skill in effects.skill!.giveLore {
                newSkill = CharacterSkill()
                newSkill.skill = skill
                newSkill.prof = "Trained"
                newEffects.skills.append(newSkill)
            }
            for skill in chooseLore {
                if skill != "" {
                    newSkill = CharacterSkill()
                    newSkill.skill = skill
                    newSkill.prof = "Trained"
                    newEffects.skills.append(newSkill)
                }
            }
            for skill in chooseLoreIncreasing {
                if skill != "" {
                    newEffects.loreIncreasing.append(skill)
                }
            }
        }
        // -- SPELL --
        var newSpell = CharacterSpell()
        var newSpellProf = CharacterProficiency()
        if effects.spell != nil {
            newEffects.spellSlot = effects.spell!.giveSpellSlot
            if effects.spell!.setSpellCastingType != nil || effects.spell!.setSpellSlots != nil || effects.spell!.setSpellKeyAbility != nil || effects.spell!.setSpellTradition != nil || effects.spell!.chooseSchoolSpell != nil || effects.spell!.signatureSpells == true || effects.spell!.unlimitedSignatureSpells == true {
                let newSpellSlot = SetSpellSlots()
                newSpellSlot.keyAbility = effects.spell!.setSpellKeyAbility
                newSpellSlot.spellSlots = effects.spell!.setSpellSlots
                newSpellSlot.tradition = effects.spell!.setSpellTradition
                newSpellSlot.school = effects.spell!.chooseSchoolSpell
                newSpellSlot.castingType = effects.spell!.setSpellCastingType
                newSpellSlot.unlimitedSignatureSpells = effects.spell!.unlimitedSignatureSpells
                newEffects.setSpellSlots = newSpellSlot
            }
            if effects.spell!.giveFocusPoint == true {
                newEffects.giveFocusPoint = true
            }
            if effects.spell!.signatureSpells == true {
                newEffects.signatureSpells = true
            }
            for proficiency in effects.spell!.spellProficiencies {
                newSpellProf = CharacterProficiency()
                newSpellProf.prof = proficiency.prof
                newSpellProf.type = proficiency.type
                newSpellProf.name = proficiency.name
                newEffects.spellProficiency.append(newSpellProf)
            }
            for spell in effects.spell!.giveSpell {
                newSpell = CharacterSpell()
                newSpell.type = spell.type
                newSpell.spell = spell.name
                newSpell.level = spell.level
                newSpell.usesPerDay = spell.usesPerDay
                newSpell.tradition = spell.tradition
                newEffects.spell.append(newSpell)
            }
            for index in effects.spell!.chooseSpell.indices {
                if chooseSpells[index].spell != nil {
                    newSpell = CharacterSpell()
                    newSpell.spell = chooseSpells[index].spell!.name
                    newSpell.level = effects.spell!.chooseSpell[index].level
                    newSpell.usesPerDay = effects.spell!.chooseSpell[index].usesPerDay
                    newSpell.tradition = effects.spell!.chooseSpell[index].tradition
                    newEffects.spell.append(newSpell)
                }
            }
            for spell in chooseSpellFromList {
                if spell.spell != nil {
                    newSpell = CharacterSpell()
                    newSpell.spell = spell.spell!.name
                    newEffects.spell.append(newSpell)
                }
            }
            for spell in effects.spell!.addSpellToList {
                newSpell = CharacterSpell()
                newSpell.type = spell.type
                newSpell.spell = spell.name
                newSpell.level = spell.level
                newSpell.usesPerDay = spell.usesPerDay
                newSpell.tradition = spell.tradition
                newEffects.addSpellToList.append(newSpell)
            }
        }
        // -- WEAPON AND ARMOR --
        var newProf = CharacterProficiency()
        if effects.weaponAndArmor != nil {
            newEffects.setMightyBulwark = effects.weaponAndArmor!.setMightyBulwark
            newEffects.setArmorStealth = effects.weaponAndArmor!.setArmorStealth
            newEffects.setUnburdenedIron = effects.weaponAndArmor!.setUnburdenedIron
            newEffects.improvisedWeaponNoPenalty = effects.weaponAndArmor!.improvisedWeaponNoPenalty
            newEffects.addLevelToUntrainedWeapons = effects.weaponAndArmor!.addLevelToUntrainedWeapons
            newEffects.setTier2Agile = effects.weaponAndArmor!.setTier2Agile
            newEffects.onHitDamage = effects.weaponAndArmor!.onHitDamage
            newEffects.onHitOther = effects.weaponAndArmor!.onHitOther
            newEffects.onHitConditional = effects.weaponAndArmor!.onHitConditional
            newEffects.onCritOther = effects.weaponAndArmor!.onCritOther
            newEffects.onCritConditional = effects.weaponAndArmor!.onCritConditional
            newEffects.overrideArmorCheckPenalty = effects.weaponAndArmor!.overrideArmorCheckPenalty
            newEffects.overrideArmorSpeedPenalty = effects.weaponAndArmor!.overrideArmorSpeedPenalty
            newEffects.giveWeaponSpecialization = effects.weaponAndArmor!.giveWeaponSpecialization
            newEffects.giveGreaterWeaponSpecialization = effects.weaponAndArmor!.giveGreaterWeaponSpecialization
            newEffects.setFinesseMeleeDamageAsDex = effects.weaponAndArmor!.setFinesseMeleeDamageAsDex
            newEffects.increaseDeificWeaponDamge = effects.weaponAndArmor!.increaseDeificWeaponDamge
            newEffects.upgradeUnarmedAttackDice = effects.weaponAndArmor!.upgradeUnarmedAttackDice
            for proficiency in effects.weaponAndArmor!.weaponProficiencies {
                newProf = CharacterProficiency()
                newProf.prof = proficiency.prof
                newProf.type = proficiency.type
                newProf.name = proficiency.name
                newEffects.weaponProficiencies.append(newProf)
                
            }
            for proficiency in effects.weaponAndArmor!.armorProficiencies {
                newProf = CharacterProficiency()
                newProf.prof = proficiency.prof
                newProf.type = proficiency.type
                newProf.name = proficiency.name
                newEffects.armorProficiencies.append(newProf)
                
            }
            var newSpec = CharacterArmorSpecialization()
            for spec in effects.weaponAndArmor!.giveArmorSpecialization {
                newSpec = CharacterArmorSpecialization()
                newSpec.type = spec.type
                newSpec.value = spec.value
                newEffects.giveArmorSpecialization.append(newSpec)
            }
            newEffects.giveWeaponFamiliarity = effects.weaponAndArmor!.giveWeaponFamiliarity
            var newWeaponSpec = CharacterWeaponCriticalizationSpecialization()
            for spec in effects.weaponAndArmor!.giveWeaponCriticalSpecialization {
                newWeaponSpec = CharacterWeaponCriticalizationSpecialization()
                newWeaponSpec.type = spec.type
                newWeaponSpec.value = spec.value
                newEffects.giveWeaponCriticalSpecialization.append(newWeaponSpec)
            }
            newEffects.defaultArmorRune = effects.weaponAndArmor!.defaultArmorRune
            newEffects.defaultWeaponRune = effects.weaponAndArmor!.defaultWeaponRune
            newEffects.increaseRageDamage = effects.weaponAndArmor!.increaseRageDamage
            newEffects.giveRageAttack = effects.weaponAndArmor!.giveRageAttack
            for formula in alchemicalFormula {
                if formula != nil {
                    newEffects.alchemicalFormulas.append(formula!.id)
                }
            }
            for formula in fieldFormula {
                if formula != nil {
                    newEffects.fieldFormulas.append(formula!.id)
                }
            }
            newEffects.convertAlchemicalItemDCtoClassDC = effects.weaponAndArmor!.convertAlchemicalItemDCtoClassDC
            if rageWeapon != nil {
                newEffects.rageWeapon = rageWeapon!.item?.id ?? nil
                giveCharacterItem(itemModel: rageWeapon!)
            }
            newEffects.addItemToBag = effects.weaponAndArmor!.addItemToBag
        }

        // -- FEATURE --
        var newResistance = CharacterResistance()
        var newWeakness = CharacterWeakness()
        if effects.feature != nil {
            var newSpeed = CharacterGiveSpeed()
            for speed in effects.feature!.giveSpeed {
                newSpeed = CharacterGiveSpeed()
                newSpeed.type = speed.type
                newSpeed.value = speed.value
                newSpeed.landSpeed = speed.landSpeed
                newEffects.giveSpeed.append(newSpeed)
            }
            newEffects.giveSense = effects.feature!.giveSense
            newEffects.givePhysicalFeature = effects.feature!.givePhysicalFeature
            for resistance in effects.feature!.giveResistance {
                newResistance = CharacterResistance()
                newResistance.type = resistance.type
                newResistance.value = resistance.value
                newResistance.halfLevel = resistance.halfLevel
                newResistance.level = resistance.level
                newResistance.addConMod = resistance.addConMod
                newEffects.giveResistance.append(newResistance)
            }
            for weakness in effects.feature!.giveWeakness {
                newWeakness = CharacterWeakness()
                newWeakness.type = weakness.type
                newWeakness.value = weakness.value
                newWeakness.halfLevel = weakness.halfLevel
                newEffects.giveWeakness.append(newWeakness)
            }
            newEffects.setSize = effects.feature!.setSize
            if effects.feature!.giveCondition != nil {
                let newCond = CharacterPlayerCondition()
                newCond.name = effects.feature!.giveCondition!.name
                newCond.value = effects.feature!.giveCondition!.value
                newEffects.giveCondition = newCond
            }
            if effects.feature!.giveRageCondition != nil {
                let newRageCon = CharacterPlayerCondition()
                newRageCon.name = effects.feature!.giveRageCondition!.name
                newRageCon.value = effects.feature!.giveRageCondition!.value
                newEffects.giveRageCondition = newRageCon
            }
            newEffects.giveApexAbilityScore = effects.feature!.giveApexAbilityScore
            newEffects.giveAlchemistProgression = effects.feature!.giveAlchemistProgression
            newEffects.advancedAlchemy = effects.feature!.advancedAlchemy
            newEffects.giveLangBonusOnly = effects.feature!.giveLangBonusOnly
            newEffects.increasePanacheSpeed = effects.feature!.increasePanacheSpeed
            if keyAbility != "" {
                newEffects.keyAbility = keyAbility
            }
            newEffects.deity = deity?.id ?? nil
            newEffects.domain = domain?.id ?? nil
            newEffects.domainAdvancement = advancedDomain?.id ?? nil
            newEffects.traits = effects.feature!.giveCharacterTrait
            if effects.feature!.giveHeritageEffectAncestry != nil {
                newEffects.traits.append(effects.feature!.giveHeritageEffectAncestry!)
            }
            if commonAncestryTrait != "" {
                newEffects.traits.append(commonAncestryTrait)
            }

            newEffects.languages = effects.feature!.giveLanguage
            for lang in languages {
                if lang != "" {
                    newEffects.languages.append(lang)
                }
            }
            for boost in abilityBoost.abilityBoosts {
                newEffects.abilityBoost.append(boost)
            }
            for proficiency in effects.feature!.proficiencies {
                newProf = CharacterProficiency()
                newProf.prof = proficiency.prof
                newProf.type = proficiency.type
                newProf.name = proficiency.name
                newEffects.otherProficiency.append(newProf)
                
            }
            newEffects.giveDragonType = effects.feature!.giveDragonType
            for feature in classAbilityFeatures {
                if feature != nil {
                    newEffects.classFeatures.append(feature!.classAbility!)
                }
            }
            newEffects.giveDivineFont = effects.feature!.giveDivineFont
        }
        //        @Persisted var giveDivineFont: String? = nil

        // -- OTHER --
        if effects.other != nil {
            newEffects.addText = effects.other!.giveNotesField
            newEffects.giveCurseCounter = effects.other!.giveCurseCounter
            newEffects.givePanacheButton = effects.other!.givePanacheButton
        }
        // -- MODIFICATIONS --
        var newMod = CharacterModification()
        for modification in effects.modification {
            newMod = CharacterModification()
            newMod.category = modification.category
            newMod.name = modification.name
            newMod.value = modification.value
            newMod.valueTimesTwo = modification.valueTimesTwo
            newMod.valueTimesLevel = modification.valueTimesLevel
            newMod.level = modification.level
            newMod.type = modification.type
            newMod.isPenalty = modification.isPenalty
            newEffects.modification.append(newMod)
        }
        // -- TEMPORARY MODIFICATIONS --
        var newTempMod = CharacterTemporaryModification()
        for modification in effects.temporaryModification {
            newTempMod = CharacterTemporaryModification()
            newTempMod.category = modification.category
            newTempMod.name = modification.name
            newTempMod.value = modification.value
            newTempMod.condition = modification.condition
            newEffects.temporaryModification.append(newTempMod)
        }
        // -- TEMPORARY EFFECTS --
        var newTempEffect = CharacterTemporaryEffects()
        for eff in effects.temporaryEffect {
            newTempEffect = CharacterTemporaryEffects()
            newTempEffect.category = eff.category
            newTempEffect.name = eff.name
            newTempEffect.effect = eff.effect
            newEffects.temporaryEffect.append(newTempEffect)
        }
        // -- CONDITIONAL CHANGE --
        var newCond = CharacterConditionalChange()
        for (index, cond) in Array(effects.conditionalChange.enumerated()) {
            newCond = CharacterConditionalChange()
            newCond.containerKey = containerKey
            if !checkConditionForChoice(conditionalChange: cond) {
                newCond.selectedLevel = levelGained
                newCond.containsSelection = false
            } else {
                newCond.containsSelection = true
            }
            newCond.hasLevelGreaterThan = cond.hasLevelGreaterThan
            newCond.hasLevelLessThan = cond.hasLevelLessThan
            newCond.hasLevel = cond.hasLevel
            newCond.hasClassAbility = cond.hasClassAbility
            newCond.doesNothaveClassAbility = cond.doesNothaveClassAbility
            newCond.hasFeat = cond.hasFeat
            newCond.doesNotHaveFeat = cond.doesNotHaveFeat
            newCond.doesNotHaveFocusPoint = cond.doesNotHaveFocusPoint
            newCond.hasProfOrHigher = cond.hasProfOrHigher
            newCond.hasProf = cond.hasProf
            newCond.hasHeritage = cond.hasHeritage
            newCond.inOverdrive = cond.inOverdrive
            newCond.inRage = cond.inRage
            newCond.isUnarmored = cond.isUnarmored
            newCond.hasLowLightVision = cond.hasLowLightVision
            // IF-CHANGE
            newCond.giveProficiency = cond.giveProficiency
            if cond.modification != nil {
                newCond.modification = cond.modification
            }
            if cond.temporaryModification != nil {
                newCond.temporaryModification = cond.temporaryModification
            }
            newCond.tempSaveReflex = cond.tempSaveReflex
            newCond.tempSaveFort = cond.tempSaveFort
            newCond.tempSaveWill = cond.tempSaveWill
            // -- Feature --
            newCond.upgradeVision = cond.upgradeVision
            newCond.giveSpeed = cond.giveSpeed
            if cond.giveResistance != nil {
                newCond.giveResistance = cond.giveResistance
            }
            newCond.physicalFeature = cond.givePhysicalFeatureName
            // -- Feat --
            if cond.giveFeatName != nil {
                newCond.feat = ifGiveFeat[index].returnCharacterFeat(levelGained: levelGained)
            }
            // -- Spell --
            newCond.spellSlot = cond.giveSpellSlot
            if cond.giveSpell != nil {
                newSpell = CharacterSpell()
                newSpell.type = cond.giveSpell!.type
                newSpell.spell = cond.giveSpell!.name
                newSpell.level = cond.giveSpell!.level
                newSpell.usesPerDay = cond.giveSpell!.usesPerDay
                newSpell.tradition = cond.giveSpell!.tradition
                newCond.spell = newSpell
            }
            newCond.giveFocusPoint = cond.giveFocusPoint
            if cond.addSpellToList != nil {
                newSpell = CharacterSpell()
                newSpell.type = cond.addSpellToList!.type
                newSpell.spell = cond.addSpellToList!.name
                newSpell.level = cond.addSpellToList!.level
                newSpell.usesPerDay = cond.addSpellToList!.usesPerDay
                newSpell.tradition = cond.addSpellToList!.tradition
                newCond.addSpellToList = newSpell
            }
            // -- Weapon and Armor
            var newWeaponSpecial = CharacterWeaponCriticalizationSpecialization()
            if cond.giveWeaponCriticalSpecialization != nil {
                newWeaponSpecial = CharacterWeaponCriticalizationSpecialization()
                newWeaponSpecial.type = cond.giveWeaponCriticalSpecialization!.type
                newWeaponSpecial.value = cond.giveWeaponCriticalSpecialization!.value
                newCond.weaponCriticalSpecialization = newWeaponSpecial
            }
            
            var newArmorSpecial = CharacterArmorSpecialization()
            if cond.giveArmorSpecialization != nil {
                newArmorSpecial = CharacterArmorSpecialization()
                newArmorSpecial.type = cond.giveArmorSpecialization!.type
                newArmorSpecial.value = cond.giveArmorSpecialization!.value
                newCond.armorSpecialization = newArmorSpecial
            }
            newCond.tempAttackDamageBonus = cond.tempAttackDamageBonus
            newCond.setMAP = cond.setMAP
            newCond.increaseRageAttackDamage = cond.increaseRageAttackDamage
            newCond.increaseRageDamage = cond.increaseRageDamage
            newCond.upgradeRageAttack = cond.upgradeRageAttack
            newCond.increaseRageWeaponDamage = cond.increaseRageWeaponDamage
            // -- Other --
            newCond.setVariable = cond.setVariable
            newCond.addText = cond.addText
            // ELSE-CHANGE
            if cond.elseGiveFeatName != nil {
                newCond.elseFeat = elseGiveFeat[index].returnCharacterFeat(levelGained: levelGained)
            }
            if cond.elseGiveLore != nil {
                let newLore = CharacterSkill()
                newLore.skill = cond.elseGiveLore!
                newLore.prof = "Trained"
                newCond.elseSkill = newLore
            }
            newCond.elseProficiency = cond.elseGiveProficiency
            newCond.elseGiveLowLightVision = cond.elseGiveLowLightVision
            newCond.elseGiveSpeed = cond.elseGiveSpeed
            newCond.elseGiveSpell = cond.elseGiveSpell
            newCond.elseSetVariable = cond.elseSetVariable
            if cond.elseTemporaryModifications != nil {
                newCond.elseTemporaryModifications = cond.elseTemporaryModifications
            }
            newEffects.conditionalChanges.append(newCond)
        }
        
        return newEffects
    }
}


