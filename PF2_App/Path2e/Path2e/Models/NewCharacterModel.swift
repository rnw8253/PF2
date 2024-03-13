//
//  ChosenItemModel.swift
//  Path2e
//
//  Created by Ryan Weber on 7/25/23.
//

import Foundation
import RealmSwift
import SwiftUI

class NewCharacterModel: ObservableObject, Hashable {
    static func == (lhs: NewCharacterModel, rhs: NewCharacterModel) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    private(set) var localRealm: Realm?
   
    init() {
        openRealm()
        addCharacter()
    }
    
    @Published var name = ""
    @Published var character = Character()
    @Published var viewToggle: Bool = false
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(character)
    }
    
    func openRealm() {
        do {
            let config = Realm.Configuration(schemaVersion: 1)
            Realm.Configuration.defaultConfiguration = config
            localRealm = try Realm()
        } catch {
            print("Error opening Realm: \(error)")
        }
    }
    
    func addCharacter() {
        if let localRealm = localRealm {
            do {
                try localRealm.write {
                    localRealm.add(character)
                }
            } catch {
                print("Error adding character to Realm: \(error)")
            }
        }
    }
}
