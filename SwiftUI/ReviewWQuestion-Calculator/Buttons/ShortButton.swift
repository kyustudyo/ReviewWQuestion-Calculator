//
//  ShortButton.swift
//  ReviewWQuestion-Calculator
//
//  Created by Hankyu Lee on 2022/05/29.
//

import SwiftUI

extension CalculratorView {
    struct clickButton :View {
        let index : Int
        
        
        var body: some View {
            
            if index == 16{
                widthLongButton()
                
            }
            
            else {
                widthShordButton(index: index)
            }
        }
    }
}

struct widthShordButton : View {
    let index : Int
    var clickedComponent : String {
        CalculratorView.buttonTitles[index]
    }
    @EnvironmentObject var logic : Logic
    //3,7,11,15,19
    var color : Color {
        if index < 3 {
            return .gray
        }
        else if index == 17 {
            return .clear
        }
        return (index - 3) % 4 == 0 ? .yellow : .brown
    }
    
    var body: some View {
        Button {
            print(clickedComponent)
//            logic.lastComponent = clickedComponent
            logic.AddComponet(what: clickedComponent)
        } label: {
            ZStack{
                Circle()
                    .applyBasicButtonModifier(color:color)

                Text("\(CalculratorView.buttonTitles[index])")
                    .applyBasicTextModifier()
                    
                    
            }
        }
    }
}


struct ShortButton_Previews: PreviewProvider {
    static var previews: some View {
        widthShordButton(index: 3)
    }
}
