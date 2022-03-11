//
//  CalculatorButton.swift
//  Calculator
//
//  Created by khawlah khalid on 11/03/2022.
//

import SwiftUI

enum CalculatorButton : String {
    
    case zero = "0"
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    
    case equal = "="
    case minus = "-"
    case plus = "+"
    case multiply = "X"
    case divide = "÷"
    
    
    case ac = "AC"
    case plusMinus = "±"
    case percent = "%"
    case decimal = "."
    
    
    var buttonColor : Color {
        switch self {
            
        case .zero,.one,.two,.three,.four,.five,.six,.seven,.eight,.nine , .decimal:
            return Color(.darkGray)
            
        case .equal,.minus,.plus,.multiply,.divide:
            return .orange
            
        case .ac,.plusMinus,.percent:
            return .gray
    
        }
        
    }
       
}



enum Operation {
    case add, subtract, multiply, divide, none
}
