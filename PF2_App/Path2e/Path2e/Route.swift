//
//  Route.swift
//  Path2e
//
//  Created by Ryan Weber on 7/18/23.
//

import Foundation
import SwiftUI
import RealmSwift

enum ContainerType {
    case ancestryFeat
    case feat
    case classAbility
    case currentClass
    case ancestry
    case heritage
    case versatileHeritage
    case physicalFeature
    case background
    case other
    case none
}

enum Route {
    // CHARACTER SHEET
    case characterSheetTabView(id: ObjectId)
    case abilityScoreBreakdownView(ability: String)
    case savingThrowBreakdownView(savingThrow: String)
    case statTabHeaderChangeAlignment
    case statTabAdjustXPView
    case statTabAdjustHealthView
    case statTabDyingView
    case perceptionBreakdownView
    case classDCBreakdownView
    case acBreakdownView
    case speedBreakdownView(speedType: String)
    // LEVEL UP CHARACTER
    case levelUpAbilitiesAndFeatsView
    case levelUpClassAbilitySelectionView(classAbility: ClassAbility)
    case levelUpSelectorListView(selectorID: Int, selectorClassAbility: ChosenClassAbilityModel)
    case levelUpSelectorSelectionView(classAbility: ClassAbility, selectorClassAbility: ChosenClassAbilityModel)
    
    case levelUpAncestryFeatSelectionView(feat: FeatData)
    case levelUpAncestryFeatListView
    
    case levelUpLevelOneView
    
    case levelUpSpellView
    case levelUpSpellListView(spellList: CharacterSpellList, listSpell: CharacterListSpell)
    case levelUpPreparedListListView(spellList: CharacterSpellList, spellLevel: Int)
    case levelUpSpellSelectionView(spell: SpellData, spellList: CharacterSpellList, listSpell: CharacterListSpell)
   
    case levelUpSignatureSpellView
    case levelUpSignatureSpellListView(spellList: CharacterSpellList, spellLevel: Int)
    case levelUpSignatureSpellSelectionView(spell: SpellData, spellList: CharacterSpellList, spellLevel: Int)
   
    case levelUpFormulaView
    case levelUpFormulaCategoryListView(listFormula: CharacterListFormula)
    case levelUpFormulaListView(listFormula: CharacterListFormula, filter: String)
    case levelUpFormulaSelectionView(item: ItemData, listFormula: CharacterListFormula)
    
    case levelUpConditionalChangeView
    case levelUpConditionalSelectionView(characterCondition: CharacterConditionalChange, conditionalChange: ConditionalChanges)
    
    // NEW CHARACTER
    case newCharacterCreationView(characterID: ObjectId)
    case classSelectionListDisplay
    case newCharacterClassSelectionView(currentClass: ClassData)
    case ancestrySelectionListDisplay
    case newCharacterAncestrySelectionView(ancestry: AncestryData)
    case heritageSelectionListDisplay
    case newCharacterHeritageSelectionView(heritage: Heritage)
    case newCharacterVersatileHeritageSelectionView(versatileHeritage: VersatileHeritageData)
    
    // ABIlITY BOOST
    case abilityBoostSelectionView(count: Int, options: Boosts?, boosts: [String]?, flaw: String?, chosenAbilityBoosts: ChosenAbilityBoostModel)
    
    // ALIGNMENT
    case alignmentSelectionView
    
    // ANCESTRY
    case ancestryView(ancestry: AncestryData)
    case visionView(vision: AncestryVisionSense)
    case senseView(sense: AncestryAdditionalSense)
    case languageView(language: Language)
    case physicalFeatureSelectionDisplay(feature: PhysicalFeature, chosenAncestry: ChosenAncestryModel, index: Int)
    case ancestryFeatListDisplay(ancestry: AncestryData)
    case ancestryHeritageListDisplay(ancestry: AncestryData)
    
    // BACKGROUND
    case backgroundSelectionListDisplay
    case newCharacterBackgroundSelectionView(background: BackgroundData)
    
    // HERITAGE
    case heritageView(heritage: Heritage)
    
    // CLASS
    case classView(currentClass: ClassData)
    case classAbilityListDisplay(currentClass: ClassData)
    
    // CLASS ABILITY
    case classAbilityView(classAbility: ClassAbility)
    case classAbilitySelectionView(classAbility: ClassAbility, chosenAbility: ChosenClassAbilityModel)
    case classAbilitySelectorListView(selectorID: Int, chosenClassAbility: ChosenClassAbilityModel)
    
    // FEAT
    case chooseFeatFromListDisplay(selection: ChooseFeatFromList, chosenFeat: ChosenFeatModel)
    case chooseFeatListDisplay(selection: ChooseFeat, chosenFeat: ChosenFeatModel)
    case featView(feat: FeatData)
    case featSelectionView(feat: FeatData, chosenFeat: ChosenFeatModel, popValue: Int)
   
    // DEITY
    case deityView(deity: DeityData)
    case deitySelectionView(deity: DeityData, chosenFeatures: ChosenFeaturesModel)
    
    // DOMAIN
    case domainView(domain: DomainData)
    case domainSelectionView(domain: DomainData, type: DomainSelectionType, chosenFeatures: ChosenFeaturesModel)
    
    // CONDITION
    case conditionView(condition: ConditionData)
    
    // TRAIT
    case traitView(trait: TraitData)
    
    // ITEM
    case itemView(item: ItemData)
    case itemSelectionView(item: ItemData, chosenFeature: ChosenFeaturesModel)
    case formulaSelectionView(item: ItemData, index: Int, type: FormulaSelectionType, chosenFeature: ChosenFeaturesModel)
   
    // SKILL
    case skillSelectionView(selectableSkills: [String]?, count: Int, maxProfInt: Int, chosenSkill: ChosenSkill)
    
    // SPELL
    case spellView(spell: SpellData)
    case spellSelectionView(spell: SpellData, chosenSpell: ChosenSpellModel)
    case chooseSpellFromListView(selection: ChooseSpellFromList, chosenSpell: ChosenSpellModel)
    case chooseSpellListView(chooseSpell: ChooseSpell, chosenSpell: ChosenSpellModel)
    
    // EFFECT
    case effectDisplay(effects: Coding, chosenFeature: ChosenFeaturesModel)

    
    // Effect - Weapon Display
    case chooseRageWeaponDisplay(chosenFeatures: ChosenFeaturesModel)
    case chooseFieldFormulaListDisplay(type: String, chosenFeatures: ChosenFeaturesModel, index: Int)
    case chooseAlchemicalFormulaListDisplay(level: Int, chosenFeatures: ChosenFeaturesModel, index: Int, filter: String)
    case chooseAlchemicalFormulaCategoryListDisplay(level: Int, chosenFeatures: ChosenFeaturesModel, index: Int)
    // Effect - Feature Display
    case deityListDisplay(type: String, chosenFeatures: ChosenFeaturesModel)
    case domainListDisplay(giveDomain: GiveDomain, chosenFeatures: ChosenFeaturesModel)
    case advancedDomainListDisplay(chosenFeatures: ChosenFeaturesModel)
    case classFeatureSelectionDisplay(classAbility: ClassAbility, chosenFeatures: ChosenFeaturesModel, index: Int, screenPop: Int)
    case classFeatureSelectorListDisplay(selectorID: Int, chosenFeatures: ChosenFeaturesModel, index: Int)
    
    // VERSATILE HERITAGE
    case versatileHeritageView(versatileHeritage: VersatileHeritageData)
}


extension Route {
    var type: ContainerType {
        switch self {
        case .levelUpAncestryFeatSelectionView:
            return .ancestryFeat
        case .levelUpClassAbilitySelectionView:
            return .classAbility
        case .levelUpSelectorSelectionView:
            return .classAbility
        case .featSelectionView:
            return .feat
        case .newCharacterBackgroundSelectionView:
            return .background
        case .newCharacterAncestrySelectionView:
            return .ancestry
        case .newCharacterHeritageSelectionView:
            return .heritage
        case .newCharacterVersatileHeritageSelectionView:
            return .versatileHeritage
        case .newCharacterClassSelectionView:
            return .currentClass
        case .physicalFeatureSelectionDisplay:
            return .physicalFeature
        default:
            return .other
        }
    }
}

extension Route {
    var name: String {
        switch self {
        case let .levelUpAncestryFeatSelectionView(feat):
            return feat.name
        case let .levelUpClassAbilitySelectionView(classAbility):
            return classAbility.name
        case let .levelUpSelectorSelectionView(classAbility, _):
            return classAbility.name
        case let .featSelectionView(feat, _, _):
            return feat.name
        case let .newCharacterBackgroundSelectionView(background):
            return background.name
        case let .newCharacterAncestrySelectionView(ancestry):
            return ancestry.name
        case let .newCharacterHeritageSelectionView(heritage):
            return heritage.name
        case let .newCharacterVersatileHeritageSelectionView(versatileHeritage):
            return versatileHeritage.name
        case let .newCharacterClassSelectionView(currentClass):
            return currentClass.name
        case let .physicalFeatureSelectionDisplay(feature, _, _):
            return feature.name
        default:
            return "None"
        }
    }
}

extension Route: Hashable {
//    static func == (lhs: Route, rhs: Route) -> Bool {
//        return true
//    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.hashValue)
    }
}

extension Route: View {
    var body: some View {
        switch self {
        // CHARACTER SHEET
        case let .characterSheetTabView(id):
            CharacterSheetTabView(characterID: id)
        case let .abilityScoreBreakdownView(ability):
            AbilityScoreBreakdownView(ability: ability)
        case let .savingThrowBreakdownView(savingThrow):
            SavingThrowBreakdown(savingThrow: savingThrow)
        case .statTabHeaderChangeAlignment:
            StatTabHeaderChangeAlignment()
        case .statTabAdjustXPView:
            StatTabAdjustXPView()
        case .statTabAdjustHealthView:
            StatTabAdjustHealthView()
        case .statTabDyingView:
            StatTabDyingView()
        case .perceptionBreakdownView:
            PerceptionBreakdownView()
        case .classDCBreakdownView:
            ClassDCBreakdownView()
        case .acBreakdownView:
            ACBreakdownView()
        case let .speedBreakdownView(speedType):
            SpeedBreakdownView(speedType: speedType)
        // LEVEL UP CHARACTER
        case let .levelUpClassAbilitySelectionView(classAbility):
            LevelUpClassAbilitySelectionView(classAbility: classAbility)
        case .levelUpAbilitiesAndFeatsView:
            LevelUpAbilitiesAndFeatsView()
        case let .levelUpSelectorListView(selectorID, selectorClassAbility):
            LazyView(LevelUpSelectorListView(selectorID: selectorID, selectorClassAbility: selectorClassAbility))
        case let .levelUpSelectorSelectionView(classAbility, selectorClassAbility):
            LevelUpSelectorSelectionView(classAbility: classAbility, selectorClassAbility: selectorClassAbility)
        case .levelUpAncestryFeatListView:
            LazyView(LevelUpAncestryFeatListView())
        case let .levelUpAncestryFeatSelectionView(feat):
            LevelUpAncestryFeatSelectionView(feat: feat)
        case .levelUpLevelOneView:
            LevelUpLevelOneView()
        case .levelUpSpellView:
            LevelUpSpellView().navigationBarBackButtonHidden(true)
        case let .levelUpSpellListView(spellList, listSpell):
            LevelUpSpellListView(spellList: spellList, listSpell: listSpell)
        case let .levelUpPreparedListListView(spellList, spellLevel):
            LevelUpPreparedListListView(spellList: spellList, spellLevel: spellLevel)
        case let .levelUpSpellSelectionView(spell, spellList, listSpell):
            LevelUpSpellSelectionView(spell: spell, spellList: spellList, listSpell: listSpell)
        case .levelUpSignatureSpellView:
            LevelUpSignatureSpellView().navigationBarBackButtonHidden(true)
        case let .levelUpSignatureSpellListView(spellList, spellLevel):
            LevelUpSignatureSpellListView(spellList: spellList, spellLevel: spellLevel)
        case let .levelUpSignatureSpellSelectionView(spell, spellList, spellLevel):
            LevelUpSignatureSpellSelectionView(spell: spell, spellList: spellList, spellLevel: spellLevel)
        case .levelUpFormulaView:
            LevelUpFormulaView().navigationBarBackButtonHidden(true)
        case let .levelUpFormulaCategoryListView(listFormula):
            LevelUpFormulaCategoryListView(listFormula: listFormula)
        case let .levelUpFormulaListView(listFormula, filter):
            LevelUpFormulaListView(listFormula: listFormula, filter: filter)
        case let .levelUpFormulaSelectionView(item, listFormula):
            LevelUpFormulaSelectionView(item: item, listFormula: listFormula)
        case .levelUpConditionalChangeView:
            LevelUpConditionalChangeView()
        case let .levelUpConditionalSelectionView(characterCondition, conditionalChange):
            LevelUpConditionalSelectionView(characterCondition: characterCondition, conditionalChange: conditionalChange)
        // NEW CHARACTER
        case let .newCharacterCreationView(characterID):
            NewCharacterCreationView(characterID: characterID).navigationBarBackButtonHidden(true)
        case .classSelectionListDisplay:
            LazyView(ClassSelectionListDisplay())
        case let .newCharacterClassSelectionView(currentClass):
            NewCharacterClassSelectionView(currentClass: currentClass)
        case .ancestrySelectionListDisplay:
            LazyView(AncestrySelectionListDisplay())
        case let .newCharacterAncestrySelectionView(ancestry):
            NewCharacterAncestrySelectionView(ancestry: ancestry)
        case .heritageSelectionListDisplay:
            LazyView(HeritageSelectionListDisplay())
        case let .newCharacterHeritageSelectionView(heritage):
            NewCharacterHeritageSelectionView(heritage: heritage)
        case let .newCharacterVersatileHeritageSelectionView(versatileHeritage):
            NewCharacterVersatileHeritageSelectionView(versatileHeritage: versatileHeritage)
        // ALIGNMENT
        case .alignmentSelectionView:
            AlignmentSelectionView()
        // VERSATILE HERITAGE
        case let .versatileHeritageView(versatileHeritage):
            VersatileHeritageView(versatileHeritage: versatileHeritage)
        // BACKGROUND
        case .backgroundSelectionListDisplay:
            LazyView(BackgroundSelectionListDisplay())
        case let .newCharacterBackgroundSelectionView(background):
            NewCharacterBackgroundSelectionView(background: background)
        // ANCESTRY
        case let .ancestryView(ancestry):
            AncestryView(ancestry: ancestry)
        case let .ancestryHeritageListDisplay(ancestry):
            AncestryDisplayHeritageListView(ancestry: ancestry)
        case let .ancestryFeatListDisplay(ancestry):
            LazyView(AncestryFeatListDisplay(ancestry: ancestry))
        case let .physicalFeatureSelectionDisplay(feature, chosenAncestry, index):
            AncestryPhysicalFeatureSelectionView(features: feature, chosenAncestry: chosenAncestry, index: index)
        case let .visionView(vision):
            VisionView(vision: vision)
        case let .languageView(language):
            LanguageView(language: language)
        case let .senseView(sense):
            SenseView(sense: sense)
        // HERITAGE
        case let .heritageView(heritage):
            HeritageView(heritage: heritage)
        // ABIlITY BOOST
        case let .abilityBoostSelectionView(count, options, boosts, flaw, chosenAbilityBoosts):
            AbilityBoostSelectionView(count: count, options: options, boosts: boosts, flaw: flaw, chosenAbilityBoosts: chosenAbilityBoosts)
        // CLASS
        case let .classView(currentClass):
            ClassView(currentClass: currentClass)
        // CLASS ABILITY
        case let .classAbilityListDisplay(currentClass):
            LazyView(ClassAbilityListDisplay(currentClass: currentClass))
        case let .classAbilityView(classAbility):
            ClassAbilityView(classAbility: classAbility)
        case let .classAbilitySelectionView(classAbility, chosenAbility):
            ClassAbilitySelectionView(classAbility: classAbility, chosenAbility: chosenAbility)
        case let .classAbilitySelectorListView(selectorID, chosenClassAbility):
            LazyView(ClassAbilitySelectorListView(selectorID: selectorID, chosenClassAbility: chosenClassAbility))
        // FEAT
        case let .chooseFeatFromListDisplay(selection, chosenFeat):
            ChooseFeatFromListDisplay(selection: selection, chosenFeat: chosenFeat)
        case let .chooseFeatListDisplay(selection, chosenFeat):
            ChooseFeatListDisplay(chooseFeat: selection, chosenFeat: chosenFeat)
        case let .featView(feat):
            FeatView(feat: feat)
        case let .featSelectionView(feat, chosenFeat, popValue):
            FeatSelectionView(feat: feat, chosenFeat: chosenFeat, popValue: popValue)
        // DEITY
        case let .deityView(deity):
            DeityView(deity: deity)
        case let .deitySelectionView(deity, chosenFeatures):
            DeitySelectionView(deity: deity, chosenFeatures: chosenFeatures)
        // DOMAIN
        case let .domainView(domain):
            DomainView(domain: domain)
        case let .domainSelectionView(domain, type, chosenFeatures):
            DomainSelectionView(domain: domain, type: type, chosenFeatures: chosenFeatures)
        // CONDITION
        case let .conditionView(condition):
            ConditionView(condition: condition)
        // TRAIT
        case let .traitView(trait):
            TraitView(trait: trait)
        // ITEM
        case let .itemView(item):
            ItemView(item: item)
        case let .itemSelectionView(item, chosenFeature):
            ItemSelectionView(item: item, chosenFeature: chosenFeature)
        case let .formulaSelectionView(item, index, type, chosenFeature):
            FormulaSelectionView(item: item, index: index, type: type, chosenFeature: chosenFeature)
        // SKILL
        case let .skillSelectionView(selectableSkills, count, maxProfInt, chosenSkill):
            SkillSelectionView(selectableSkills: selectableSkills, count: count, maxProfInt: maxProfInt, chosenSkill: chosenSkill)
        // SPELL
        case let .spellView(spell):
            SpellView(spell: spell)
        case let .spellSelectionView(spell, chosenSpell):
            SpellSelectionDisplay(spell: spell, chosenSpell: chosenSpell)
        case let .chooseSpellFromListView(selection, chosenSpell):
            LazyView(ChooseSpellFromListView(selection: selection, chosenSpell: chosenSpell))
        case let .chooseSpellListView(chooseSpell, chosenSpell):
            LazyView(ChooseSpellListView(chooseSpell: chooseSpell, chosenSpell: chosenSpell))
        // BASIC VIEW TAB
        case let .effectDisplay(effects, chosenFeatures):
            EffectDisplay(effects: effects, chosenFeatures: chosenFeatures)
       
        // Effect - Weapon and Armor Display
        case let .chooseRageWeaponDisplay(chosenFeatures):
            ChooseRageWeaponDisplay(chosenFeatures: chosenFeatures)
        case let .chooseFieldFormulaListDisplay(type, chosenFeatures, index):
            LazyView(ChooseFieldFormulaListDisplay(type: type, chosenFeatures: chosenFeatures, index: index))
        case let .chooseAlchemicalFormulaCategoryListDisplay(level, chosenFeatures, index):
            LazyView(ChooseAlchemicalFormulaCategoryListView(level: level, chosenFeatures: chosenFeatures, index: index))
        case let .chooseAlchemicalFormulaListDisplay(level, chosenFeatures, index, filter):
            LazyView(ChooseAlchemicalFormulaListDisplay(level: level, chosenFeatures: chosenFeatures, index: index, filter: filter))
        // Effect - Feature Display
        case let .deityListDisplay(type, chosenFeatures):
            LazyView(DeityListDisplay(type: type, chosenFeatures: chosenFeatures))
        case let .domainListDisplay(giveDomain, chosenFeatures):
            LazyView(DomainListDisplay(giveDomain: giveDomain, chosenFeatures: chosenFeatures))
        case let .advancedDomainListDisplay(chosenFeatures):
            AdvancedDomainListDisplay(chosenFeatures: chosenFeatures)
        case let .classFeatureSelectorListDisplay(selectorID, chosenFeatures, index):
            ClassFeatureSelectorListDisplay(selectorID: selectorID, chosenFeatures: chosenFeatures, index: index)
        case let .classFeatureSelectionDisplay(classAbility, chosenFeatures, index, screenPop):
            ClassFeatureSelectionDisplay(classAbility: classAbility, chosenFeature: chosenFeatures, index: index, screenPop: screenPop)
        }
    }
}
