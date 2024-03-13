//
//  WithBackgroundProgressViewStyle.swift
//  Path2e
//
//  Created by Ryan Weber on 11/22/23.
//

import Foundation
import SwiftUI

struct WithBackgroundProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .padding(0)
            .background(Color.gray.opacity(0.25))
            .accentColor(.teal)
            .cornerRadius(8)
    }
}
