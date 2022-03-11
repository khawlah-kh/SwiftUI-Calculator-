//
//  CalculatorViewModel.swift
//  Calculator
//
//  Created by khawlah khalid on 11/03/2022.
//

import Foundation




final class CalculatorViewModel : ObservableObject {
    
    @Published var value : String = "0"
    @Published var runningNumber = 0
    @Published var currentOperation: Operation = .none
    
    let buttons : [[CalculatorButton]] = [[.ac,.plusMinus,.percent,.divide],
                                          [.seven,.eight,.nine,.multiply],
                                          [.four,.five,.six,.minus],
                                          [.one,.two,.three,.plus],
                                          [.zero,.decimal,.equal]]
    
    
    
    func receiveInput(_ button : CalculatorButton){
        
        switch button {
        case .plus, .minus, .multiply, .divide, .equal:
            if button == .plus {
                self.currentOperation = .add
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .minus {
                self.currentOperation = .subtract
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .multiply {
                self.currentOperation = .multiply
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .divide {
                self.currentOperation = .divide
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .equal {
                let runningValue = self.runningNumber
                let currentValue = Int(self.value) ?? 0
                switch self.currentOperation {
                case .add: self.value = "\(runningValue + currentValue)"
                case .subtract: self.value = "\(runningValue - currentValue)"
                case .multiply: self.value = "\(runningValue * currentValue)"
                case .divide: self.value = "\(runningValue / currentValue)"
                case .none:
                    break
                }
            }
            
            
            if button != .equal {
                self.value = "0"
            }
        case .ac:
            self.value = "0"
        case .decimal, .plusMinus, .percent:
            break
        default:
            let number = button.rawValue
            if self.value == "0" {
                value = number
            }
            else {
                self.value = "\(self.value)\(number)"
            }
        }
    }
}




