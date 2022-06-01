//
//  Logic.swift
//  ReviewWQuestion-Calculator
//
//  Created by Hankyu Lee on 2022/05/29.
//

import Foundation

class Logic : ObservableObject {
    
    private var addedOperationQueue : [String] = []
    
    @Published var results : String = "0"
    
    var lastOperation : String = "0"
    
    var lastComponent : String = "0"
 
    var stageValues : [Double] = []
    private var addedNumbersQueue : [String] = ["0"]
    func AddComponet(what component: String) {
        
        if checkComponent(component) == "숫자" {
            addedNumbersQueue.append(component)
            
            results = getNumber()
            print(getNumber())
//            print(getFrontNumber())
            print("stagesValue",stageValues)
        }
        else if checkComponent(component) == "사칙연산" {

            addedOperationQueue.append(component)
            print("addedOperationQueue:",addedOperationQueue)
            if addedNumbersQueue.count != 0 {// 숫자안누르고 사칙연산 연타누를때
                getNumber(component: "사칙연산")
                isItPossibleTocalculate()
                clearComponentsQueue(component:component)
                print("stageValues",stageValues)
            }
            
        }
    }
    func checkComponent(_ component: String) -> String {
        switch component {
            
        case "/","-","X","+","=" :
            return "사칙연산"

//        case "=" :
//            return "="
          
        case "AC" :
            return "AC"

        case "+/-" :
            return "+/-"

        case "%" :
            return "%"

        case "." :
            return "."

        default:
            return "숫자"
          
//            getFrontNumber()
        }
    }
    
    func getNumber(component:String = "숫자")-> String {
        //    a.truncatingRemainder(dividingBy: 1.0) == 0 ? true : false
        var number : String = ""
        for component in addedNumbersQueue {
            number.append(component)
        }
        let value = Double(number)!
        
        if component == "사칙연산" {
            print("stage올라갈거\(value)")
            stageValues.append(value)
            print("stageValues",stageValues)
            
        }
        
        
        print("숫자",Double(number))
        
        return String(value)
//
    }
    func clearComponentsQueue(component:String) {

        addedNumbersQueue = []
    }
    func isItPossibleTocalculate() {
//        if stageValues.count >= 2 {
        print("addedOperationQueue",addedOperationQueue)
            if addedOperationQueue.count >= 2 {
                print("계산할 operation:",addedOperationQueue[addedOperationQueue.endIndex-2])
                print("operation index: \(addedOperationQueue.endIndex-2)")
                calculate(operation:addedOperationQueue[addedOperationQueue.endIndex-2])
            }
        
            else {
                print("아직 계산못해")
            }
           
//        }
    }
    func calculate(operation: String) {
        var result:Double = 0
        switch operation {
        case "+" : result = stageValues[stageValues.count-2] + stageValues[stageValues.count-1]
        case "-" : result = stageValues[stageValues.count-2] - stageValues[stageValues.count-1]
        case "X" : result = stageValues[stageValues.count-2] * stageValues[stageValues.count-1]
        case "/" : result = stageValues[stageValues.count-2] / stageValues[stageValues.count-1]
        case "=" : result = stageValues[stageValues.count-1]
            
        default:
            print("not yet")
        }
        stageValues[stageValues.count - 1] = result
        results = String(result)
        print("stageValues",stageValues)
    }
    
    
}

