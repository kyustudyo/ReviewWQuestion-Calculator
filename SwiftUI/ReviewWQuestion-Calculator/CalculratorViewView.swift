//
//  ContentView.swift
//  ReviewWQuestion-Calculator
//

import SwiftUI

struct CalculratorView: View {
    //extenstion 해서 사용하니, 다른 뷰에서 environment를 선언안해도 되는 장점.
    @EnvironmentObject var logic : Logic
    static let size:CGFloat = 70//줄이고싶다.
    static let buttonTitles = StaticData.calculatorLetters
    private var fixedItems: [GridItem] { [GridItem(.fixed(CGFloat(CalculratorView.size+10))),GridItem(.fixed(CGFloat(CalculratorView.size+10))),GridItem(.fixed(CGFloat(CalculratorView.size+10))),GridItem(.fixed(CGFloat(CalculratorView.size+10)))]}
    
    var body: some View {

        VStack(alignment:.trailing,spacing: 15){
            Spacer()
            resultView(resultText: logic.results)
                
            LazyVGrid(columns: fixedItems, alignment: .center, spacing: 20) {
                
                ForEach(0..<20) { index in
                    clickButton(index: index)
                }
            }.padding(.bottom,20)
            
        }
    }
}

//extension CalculratorView {
//    struct clickButton :View {
//        let index : Int
//
//
//        var body: some View {
//
//            if index == 16{
//                CalculratorView.widthLongButton()
//
//            }
//
//            else {
//                CalculratorView.widthShordButton(index: index)
//            }
//        }
//    }
//}

extension CalculratorView {
    struct resultView : View {
        let resultText : String
        var body: some View {
            Text("\(resultText)")
            .font(Font.system(size:85))
            .offset(x: -40, y: 0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CalculratorView()
                .environmentObject(Logic())
                .preferredColorScheme(.dark)
            CalculratorView()
                .environmentObject(Logic())
                .previewDevice("iPhone SE (2nd generation)")
                .preferredColorScheme(.light)
            CalculratorView()
                .environmentObject(Logic())
                .preferredColorScheme(.dark)
                .previewDevice("iPad Pro (12.9-inch) (2nd generation)")
        }
    }
}

