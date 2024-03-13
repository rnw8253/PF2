//
//  AppState.swift
//  PF2
//
//  Created by Ryan Weber on 1/17/22.
//


import SwiftUI

class AppState: ObservableObject {
    
    @Published var path = [Route]()
    
    func popToRoot() {
        path = []
    }
    
    func popXViews(_ x: Int) {
        if x <= path.count {
            path.removeLast(x)
        }
    }
    
    func push(to screen: Route) {
        path.append(screen)
    }

}




