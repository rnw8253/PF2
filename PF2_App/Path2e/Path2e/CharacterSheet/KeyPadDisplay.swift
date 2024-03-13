//
//  KeyPadDisplay.swift
//  Path2e
//
//  Created by Ryan Weber on 11/25/23.
//

import Foundation
import SwiftUI

struct KeyDisplay: View {
    var key: String
    @Binding var numberStr: String
    var maxWidth: CGFloat
    var body: some View {
        Button {
            switch key {
            case "0":
                if numberStr != "0" || numberStr != "-0" {
                    numberStr += key
                }
            case "1"..."9":
                if numberStr == "0" {
                    numberStr = key
                } else if numberStr == "-0" {
                    numberStr = "-"+key
                } else {
                    numberStr += key
                }
            case "+/-":
                if numberStr.prefix(1) == "-" {
                    numberStr = String(numberStr.suffix(numberStr.count-1))
                } else {
                    numberStr = "-"+numberStr
                }
            case "C":
                if numberStr.prefix(1) == "-" {
                    numberStr = "-0"
                } else {
                    numberStr = "0"
                }
            default:
               break
            }
        } label: {
            ZStack {
                Rectangle()
                    .fill(.white)
                    .aspectRatio(1.0, contentMode: .fit)
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1))
                    .shadow(radius: 10)
                    .frame(minWidth: 0, maxWidth: maxWidth, minHeight: 0)
                Text(key)
                    .font(.title)
                
            }
        }
    }
}

struct CustomKeyPad: View {
    @Binding var numberStr: String
    var keyWidth: CGFloat
    private let adaptiveColumns = Array(repeating: GridItem(.flexible(), spacing: 5), count: 3)
    private let adaptiveColumnsString = Array(repeating: GridItem(.flexible(), spacing: 5), count: 1)
    var body: some View {
        VStack {
            LazyVGrid(columns: adaptiveColumnsString, spacing: 5) {
                ZStack {
                    Rectangle()
                        .fill(.white)
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.black, lineWidth: 1))
                        .shadow(radius: 10)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 45)
                    Text(numberStr)
                }
            }
            LazyVGrid(columns: adaptiveColumns, spacing: 5) {
                Group {
                    KeyDisplay(key: "1", numberStr: $numberStr, maxWidth: keyWidth)
                    KeyDisplay(key: "2", numberStr: $numberStr, maxWidth: keyWidth)
                    KeyDisplay(key: "3", numberStr: $numberStr, maxWidth: keyWidth)
                    KeyDisplay(key: "4", numberStr: $numberStr, maxWidth: keyWidth)
                    KeyDisplay(key: "5", numberStr: $numberStr, maxWidth: keyWidth)
                    KeyDisplay(key: "6", numberStr: $numberStr, maxWidth: keyWidth)
                }
                Group {
                    KeyDisplay(key: "7", numberStr: $numberStr, maxWidth: keyWidth)
                    KeyDisplay(key: "8", numberStr: $numberStr, maxWidth: keyWidth)
                    KeyDisplay(key: "9", numberStr: $numberStr, maxWidth: keyWidth)
                    KeyDisplay(key: "+/-", numberStr: $numberStr, maxWidth: keyWidth)
                    KeyDisplay(key: "0", numberStr: $numberStr, maxWidth: keyWidth)
                    KeyDisplay(key: "C", numberStr: $numberStr, maxWidth: keyWidth)
                }
            }
        }
    }
}
