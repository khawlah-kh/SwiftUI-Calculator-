//
//  ContentView.swift
//  Calculator
//
//  Created by khawlah khalid on 11/03/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = CalculatorViewModel()
    
    var body: some View {
        
        ZStack{
            Color.black.ignoresSafeArea()
            
            VStack(spacing:12){
                
                Spacer()
                HStack{
                    Spacer()
                    Text(viewModel.value)
                        .foregroundColor(.white)
                        .font(.system(size: 64))
                }.padding()
                
                ForEach(viewModel.buttons,id:\.self) { buttonRow in
                    
                    HStack(spacing:12){
                        
                        ForEach(buttonRow,id:\.self) { button in
                            Button {
                                viewModel.receiveInput(button)
                            } label: {
                                CalculatorButtonView(button: button)
                            }
                            
                        }
    
                    }
                }
                
            }
            .padding(.bottom)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CalculatorButtonView: View {
    let button : CalculatorButton
    var body: some View {
        Text(button.rawValue)
            .foregroundColor(.white)
            .font(.system(size: 32))
            .frame(width: buttonWidth, height: buttonHeight)
            .background {
                button.buttonColor
            }
            .cornerRadius(buttonHeight / 2)
    }
    var buttonWidth : CGFloat {
        
        if button == .zero {
            return (UIScreen.main.bounds.width - 12 * 5 ) / 2
        }
        else{
            return (UIScreen.main.bounds.width - 12 * 5 ) / 4
        }
    }
    
    var buttonHeight : CGFloat {
        
        (UIScreen.main.bounds.width - 12 * 5 ) / 4
        
    }
    
    
}
