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
    
    var lastOperation : String = "merong"
    
    var lastNumber : String = "merong"
    var calculatorLetters: [String] {
        if clearPressed {
            return  ["AC","+/-","%","/","7","8","9","X","4","5","6","-","1","2","3","+","0","",".","="]
        }
        else {
            return ["C","+/-","%","/","7","8","9","X","4","5","6","-","1","2","3","+","0","",".","="]
        }
       
    }
    var clearPressed : Bool = true
    var stageValues : [Double] = []
    private var addedNumbersQueue : [String] = ["0"]
    func AddComponet(what component: String) {
        if checkComponent(component) == "C" || checkComponent(component) == "AC"{
            print("aNQ",addedNumbersQueue)
            results = "0.0"
            lastNumber = "0.0"
            addedNumbersQueue = ["0"]//진행중인 것 제거
            if checkComponent(component) == "C" {
                clearPressed = true//c를 눌러야만 ac가뜬다.
            }
            
        }
        if checkComponent(component) == "숫자" {//숫자일때
            clearPressed = false//숫자누르면 clear뜨므로
            addedNumbersQueue.append(component)
            results = getNumber()
            lastNumber = results
            print("aNQ",addedNumbersQueue)
            print("lastComponent:",lastNumber)
            print("stagesValue",stageValues)
        }
        else if checkComponent(component) == "사칙연산" {//사칙연산일때
            lastOperation = (component != "=") ? component : lastOperation
//            print("lastOperation:",lastOperation)
            addedOperationQueue.append(component)
            print("addedOperationQueue:",addedOperationQueue)
            print("addedNumberQueue:",addedNumbersQueue)
            
            if addedNumbersQueue.count != 0 {// 숫자안누르고 사칙연산 연타누를때
                print("added 카운트 0 아님 ")
                getNumber(component: "사칙연산")
                isItPossibleTocalculate()
                clearComponentsQueue(component:component)
                print("stageValues",stageValues)
            }
            else if addedNumbersQueue.count == 0{
                if component == "=" {
                    print("=가 왜 또 나와")
                    
                    if lastOperation != "merong" {
                        var a:String = ""
                        
                        switch lastOperation {
                        case "+" : a = String(stageValues[stageValues.count-1] + Double(lastNumber)!)
                        case "-" : a = String(stageValues[stageValues.count-1] - Double(lastNumber)!)
                        case "X" : a = String(stageValues[stageValues.count-1] * Double(lastNumber)!)
                        case "/" : a = String(stageValues[stageValues.count-1] / Double(lastNumber)!)
                        default : a = ""
                        }
                        results = a
                        stageValues.append(Double(a)!)
                    }
                    
                    
                }
                else {
                    print("\(component) 또 눌렀누?")
                    lastNumber = results
                }
            }
            
            
        }
    }
    func checkComponent(_ component: String) -> String {
        switch component {
            
        case "/","-","X","+","=" :
            return "사칙연산"

//        case "=" :
//            return "="
          
        case "C":
            return "C"
        case "AC":
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
        
        
//        print("숫자",Double(number))
        
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
        case "=" :
            result = stageValues[stageValues.count - 1]
            print("= 했다.")
//            result = stageValues[stageValues.count-1] + Double(lastNumber)!
//            result = calculate2(operation: lastOperation)
            
        default:
            print("not yet")
        }
        
        stageValues[stageValues.count - 1] = result
        results = String(result)
        print("stageValues",stageValues)
        
    }
    func calculate2(operation: String) -> Double {
        var result = 0.0
        switch operation {
        case "+" : result = stageValues[stageValues.count-1] + Double(lastNumber)!
        case "-" : result = stageValues[stageValues.count-1] - Double(lastNumber)!
        case "X" : result = stageValues[stageValues.count-1] * Double(lastNumber)!
        case "/" : result = stageValues[stageValues.count-1] / Double(lastNumber)!
        default:
            print("not yet")
        }
        return result
    }
    
}
