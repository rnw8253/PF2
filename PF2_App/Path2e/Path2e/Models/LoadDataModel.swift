//
//  BackgroundListViewModel.swift
//  PF2
//
//  Created by Ryan Weber on 1/17/22.
//
import Foundation
import RealmSwift

class LoadDataModel: ObservableObject {
    @Published var codeEffects: Results<Coding>
    @Published var archetypes: Results<ArchetypeData>
    @Published var ancestries: Results<AncestryData>
    @Published var heritages: Results<Heritage>
    @Published var backgrounds: Results<BackgroundData>
    @Published var classAbilities: Results<ClassAbility>
    @Published var classes: Results<ClassData>
    @Published var domains: Results<DomainData>
    @Published var deities: Results<DeityData>
    @Published var spells: Results<SpellData>
    @Published var conditions: Results<ConditionData>
    @Published var items: Results<ItemData>
    @Published var traits: Results<TraitData>
    @Published var feats: Results<FeatData>
    @Published var versatileHeritages: Results<VersatileHeritageData>
    @Published var conditionalChanges: Results<ConditionalChanges>

    init() {
        let config = Realm.Configuration(fileURL: Bundle.main.url(forResource: "data", withExtension: "realm"), readOnly: true)
        // Open the Realm with the configuration
        let realm = try! Realm(configuration: config)
        self.ancestries = realm.objects(AncestryData.self)
        self.heritages = realm.objects(Heritage.self)
        self.codeEffects = realm.objects(Coding.self)
        self.classes = realm.objects(ClassData.self)
        self.archetypes = realm.objects(ArchetypeData.self)
        self.backgrounds = realm.objects(BackgroundData.self)
        self.classAbilities = realm.objects(ClassAbility.self)
        self.domains = realm.objects(DomainData.self)
        self.deities = realm.objects(DeityData.self)
        self.spells = realm.objects(SpellData.self)
        self.conditions = realm.objects(ConditionData.self)
        self.items = realm.objects(ItemData.self)
        self.traits = realm.objects(TraitData.self)
        self.feats = realm.objects(FeatData.self)
        self.versatileHeritages = realm.objects(VersatileHeritageData.self)
        self.conditionalChanges = realm.objects(ConditionalChanges.self)
    }
}

