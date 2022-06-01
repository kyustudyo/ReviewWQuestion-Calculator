//
//  ContentView.swift
//  ReviewWQuestion-Calculator
//

import SwiftUI


    


struct CalculratorView: View {
    
    
    static let size:CGFloat = 70//줄이고싶다.
    static let buttonTitles = StaticData.calculatorLetters
    private var fixedItems: [GridItem] { [GridItem(.fixed(CGFloat(CalculratorView.size+10))),GridItem(.fixed(CGFloat(CalculratorView.size+10))),GridItem(.fixed(CGFloat(CalculratorView.size+10))),GridItem(.fixed(CGFloat(CalculratorView.size+10)))]}
    
    var body: some View {

        VStack(alignment:.trailing){
            Spacer()
            
            LazyVGrid(columns: fixedItems, alignment: .center, spacing: 20) {
                
                ForEach(0..<20) { index in
                    clickButton(index: index)
                        
                }
            }
            
        }
    }

}

extension CalculratorView {
    struct clickButton :View {
        let index : Int
        
        
        var body: some View {
            
            if index == 16{
                CalculratorView.widthLongButton()
            }
            else {
                CalculratorView.widthShordButton(index: index)
            }
        }
    }
}
extension CalculratorView {
    struct widthShordButton : View {
        let index : Int
        //3,7,11,15,19
        var color : Color {
            if index < 3 {
                return .gray
            }
            return (index - 3) % 4 == 0 ? .yellow : .brown
        }
        var body: some View {
            ZStack{
                Circle()
                    .applyBasicButtonModifier(color:color)
                Text("\(CalculratorView.buttonTitles[index])")
                    .applyBasicTextModifier()
                    
            }
        }
    }
}
extension CalculratorView {
    struct widthLongButton : View {
        let index : Int
        init(index:Int = 16){
            self.index = index
        }
        var body: some View {
            ZStack{
                Circle()
                    .applyBasicButtonModifier()
                ZStack{
                    RoundedRectangle(cornerRadius: 70.0)
                        .applyBasicButtonModifier(width: CalculratorView.size*2 + 20.0, height: CalculratorView.size, color: .red)
                        .offset(x: CalculratorView.size - 25)
                        .opacity(0.5)
                       
                    Text("\(CalculratorView.buttonTitles[index])")
                        .applyBasicTextModifier()
                }
            }
        }
    }

}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CalculratorView()
                .preferredColorScheme(.dark)
            CalculratorView()
                .preferredColorScheme(.dark)
                .previewDevice("iPad Pro (12.9-inch) (2nd generation)")
        }
    }
}

