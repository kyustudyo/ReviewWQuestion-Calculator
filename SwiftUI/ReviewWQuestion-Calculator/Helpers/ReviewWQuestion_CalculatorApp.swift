//
//  ReviewWQuestion_CalculatorApp.swift
//  ReviewWQuestion-Calculator
//

import SwiftUI

@main
struct ReviewWQuestion_CalculatorApp: App {
    @StateObject var logic = Logic()
    var body: some Scene {
        WindowGroup {
            CalculratorView()
                .environmentObject(logic)
        }
    }
}
