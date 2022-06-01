//
//  LongButton.swift
//  ReviewWQuestion-Calculator
//
//  Created by Hankyu Lee on 2022/05/29.
//

import SwiftUI

struct widthLongButton : View {
    let index : Int
    init(index:Int = 16){
        self.index = index
    }
    @EnvironmentObject var logic : Logic
    var body: some View {
        
        Button {
            print(CalculratorView.buttonTitles[index])
//            logic.lastComponent = "0"
            logic.AddComponet(what: "0")
        } label: {
//                ZStack{
//                    Circle()
//                        .applyBasicButtonModifier()
            ZStack {
                    RoundedRectangle(cornerRadius: 70.0)
                    
                        
                        .applyBasicButtonModifier(width: CalculratorView.size*2 + 20.0, height: CalculratorView.size, color: .gray)
                        
//                        .opacity(0.5)
//                            .offset(x: CalculratorView.size - 25)
                
                    Text("\(CalculratorView.buttonTitles[index])")
                        .applyBasicTextModifier()
                        .offset(x:25 - CalculratorView.size)
            }
            
//                }
        }.offset(x: CalculratorView.size - 25)
    
        
    }
}



struct LongButton_Previews: PreviewProvider {
    static var previews: some View {
        widthLongButton(index: 16)
    }
}
