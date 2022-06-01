//
//  TextModifiers.swift
//  ReviewWQuestion-Calculator
//
//  Created by Hankyu Lee on 2022/05/28.
//

import Foundation
import SwiftUI

extension View {
    func applyBasicTextModifier(color: Color = .white)-> some View {
        modifier(CalculratorView.basicTextModifier(color: color))
    }
}
extension CalculratorView {
    struct basicTextModifier : ViewModifier {
        let color: Color
        init(color : Color){
            self.color = color
        }
        func body(content: Content) -> some View {
            content
                .font(.largeTitle)
                .foregroundColor(.white)
        }
    }
}
