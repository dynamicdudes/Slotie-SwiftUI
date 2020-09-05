//
//  ContentView.swift
//  SlotieSwiftUI
//
//  Created by Vishweshwaran on 05/09/20.
//  Copyright © 2020 Dynamic Dudes. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    private var symbols = ["apple","strawberry","orange"]
    @State private var index = [1,2,0]
    @State private var credit = 1000
    @State private var betAmmout = 5
    
    var body: some View {
        
        ZStack{
            
            Rectangle()
                .foregroundColor(Color(red: 41/155, green: 65/255, blue: 163/255))
                .edgesIgnoringSafeArea(.all)
            
            Rectangle()
                .foregroundColor(Color(red:87/255,green:95/255,blue:247/255))
                .rotationEffect(Angle(degrees: 45))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                //App Title..
                HStack{
                    Image(systemName: "star.fill")
                        .foregroundColor(.purple)
                    Text("SwiftUI Sloty")
                        .bold()
                        .foregroundColor(.white)
                    Image(systemName: "star.fill")
                        .foregroundColor(.purple)
                }.scaleEffect(2)
                
                Spacer()
                
                //Count Label..
                Text("Count : \(credit)")
                    .padding(.all, 10)
                    .background(Color(.white).opacity(0.50))
                    .cornerRadius(30)
                Spacer()
                //Cards
                HStack{
                    
                    Spacer()
                    Image(symbols[index[0]])
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .padding(.all, 10)
                        .background(Color(.white).opacity(0.5))
                        .cornerRadius(20)
                    
                    Image(symbols[index[1]])
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .padding(.all, 10)
                        .background(Color(.white).opacity(0.5))
                        .cornerRadius(20)
                    
                    Image(symbols[index[2]])
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .padding(.all, 10)
                        .background(Color(.white).opacity(0.5))
                        .cornerRadius(20)
                    
                    Spacer()
                    
                }
                
                Spacer()
                //Button
                Button(action: {
                    self.index[0] = Int.random(in: 0...self.symbols.count - 1)
                    self.index[1] = Int.random(in: 0...self.symbols.count - 1)
                    self.index[2] = Int.random(in: 0...self.symbols.count - 1)
                    
                    if self.index[0] == self.index[1] && self.index[1] == self.index[2] {
                        self.credit += self.betAmmout * 10
                    }
                        
                    else{
                        self.credit -= self.betAmmout
                    }
                }) {
                    
                    Text("Spin")
                        .bold()
                        .foregroundColor(.white)
                        .padding(.all, 10)
                        .padding([.leading,.trailing],30)
                        .background(Color.init(.purple))
                        .cornerRadius(40)
                    
                }
                Spacer()
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

