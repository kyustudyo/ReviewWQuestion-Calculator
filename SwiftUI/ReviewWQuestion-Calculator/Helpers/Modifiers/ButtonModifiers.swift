//
//  Modifiers.swift
//  ReviewWQuestion-Calculator
//
//  Created by Hankyu Lee on 2022/05/28.
//

import Foundation
import SwiftUI
extension View {
    func applyBasicButtonModifier(width:Double = CalculratorView.size, height:Double = CalculratorView.size ,color: Color = .gray) -> some View {
        let width = color == .clear ? 0 : width
        let heigth = color == .clear ? 0 : height
        return modifier(CalculratorView.basicButtonModifier(width: width, height: heigth, color: color))
    }
}
extension CalculratorView {
    struct basicButtonModifier : ViewModifier {
        let width: Double
        let height: Double
        let color: Color
        init(width:Double, height: Double, color : Color){
            self.width = width
            self.height = height
            self.color = color
        }
        func body(content: Content) -> some View {
            content
                .frame(width: width , height: height )
                .foregroundColor(color)
        }
    }
}
