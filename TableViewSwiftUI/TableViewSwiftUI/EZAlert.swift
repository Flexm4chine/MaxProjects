//
//  EZAlert.swift
//  TableViewSwiftUI
//
//  Created by Admin on 04.11.2020.
//

import SwiftUI

struct EZAlert: View {
    
    let screenSize = UIScreen.main.bounds
    
    var title: String = "Some text here"
    @Binding var isShown: Bool
    @Binding var textF: String
    var onDone: (String) -> Void = {_ in }
    
    
    var body: some View {
        
        VStack{
            
            Text(title)
            TextField("Some placeholder here", text: $textF) .textFieldStyle(RoundedBorderTextFieldStyle()).border(Color.gray, width: 5)
            
            HStack{
                Button("Done"){
                    self.isShown = false
                    self.onDone(self.textF)
                }
                
                Button("Cancel"){
                    self.isShown = false
                }
            }
            
            
        }.padding()
        
        .frame(width: screenSize.width * 0.7, height: screenSize.height * 0.3)
        .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray, lineWidth: 2) )
        .background(Color.white )
        .offset(y: isShown ? 0 : screenSize.height)
        .animation(.spring())
        .shadow(color: Color.white, radius: 6, x: -9, y: -9)
        
        
        
        
        
    }
}

struct EZAlert_Previews: PreviewProvider {
    static var previews: some View {
        EZAlert(isShown: .constant(true),textF: .constant(""))
    }
}
