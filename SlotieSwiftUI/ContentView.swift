//
//  ContentView.swift
//  SlotieSwiftUI
//
//  Created by Vishweshwaran on 05/09/20.
//  Copyright © 2020 Dynamic Dudes. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var symbols = ["apple","strawberry","orange"]
    @State private var index = Array(repeating: 0, count: 9)
    @State private var credit = 1000
    @State private var colorsArray = Array(repeating: Color.white, count: 9)
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
                VStack{
                    HStack{
                        
                        Spacer()
                        
                        SingleSlot(imageView: $symbols[index[0]],backgroundColor: $colorsArray[0])
                        SingleSlot(imageView: $symbols[index[1]], backgroundColor: $colorsArray[1])
                        SingleSlot(imageView: $symbols[index[2]], backgroundColor: $colorsArray[2])
                        
                        Spacer()
                        
                    }
                    HStack{
                        
                        Spacer()
                        
                        SingleSlot(imageView: $symbols[index[3]],backgroundColor: $colorsArray[3])
                        SingleSlot(imageView: $symbols[index[4]], backgroundColor: $colorsArray[4])
                        SingleSlot(imageView: $symbols[index[5]], backgroundColor: $colorsArray[5])
                        
                        Spacer()
                        
                    }
                    HStack{
                        
                        Spacer()
                        
                        SingleSlot(imageView: $symbols[index[6]],backgroundColor: $colorsArray[6])
                        SingleSlot(imageView: $symbols[index[7]], backgroundColor: $colorsArray[7])
                        SingleSlot(imageView: $symbols[index[8]], backgroundColor: $colorsArray[8])
                        
                        Spacer()
                        
                    }
                }
                
                Spacer()
                
                
                //Button
                HStack(spacing: 30){
                    
                    VStack {
                        Button(action: {
                            self.processResult()
                        }) {
                            
                            Text("Spin")
                                .bold()
                                .foregroundColor(.white)
                                .padding(.all, 10)
                                .padding([.leading,.trailing],30)
                                .background(Color.init(.purple))
                                .cornerRadius(40)
                            
                        }
                        Text("\(betAmmout) credit")
                            .font(.footnote)
                            .padding(.top,8)
                        .foregroundColor(.white)

                    }
                    
                    VStack{
                        Button(action: {
                            self.processResult(which: true)
                        }) {
                            Text("Max Spin")
                                .bold()
                                .foregroundColor(.white)
                                .padding(.all, 10)
                                .padding([.leading,.trailing],30)
                                .background(Color.init(.purple))
                                .cornerRadius(40)
                        }
                        
                        Text("\(betAmmout * 2) credit")
                        .font(.footnote)
                        .padding(.top,8)
                        .foregroundColor(.white)

                    }
                    
                    
                }
                Spacer()
                
            }
        }
        
    }
    
    func processResult(which isMax : Bool = false){
        
        self.colorsArray = self.colorsArray.map({ _ in
            Color.white
        })
        
        if isMax{
            self.index = self.index.map({ _ in
                Int.random(in : 0...self.symbols.count - 1)
            })
        }
        else{
            //Initial Stage Card Color
            
            self.index[3] = Int.random(in: 0...self.symbols.count - 1)
            self.index[4] = Int.random(in: 0...self.symbols.count - 1)
            self.index[5] = Int.random(in: 0...self.symbols.count - 1)
            
            
        }
        
         processWin(which: isMax)
        
        
        
    }
    
    func processWin(which isMax : Bool = false){
        
        var matches : Int = 0
        
        if !isMax{
            //Process Single Spin
            if self.index[3] == self.index[4] && self.index[4] == self.index[5] {
                
                matches += 1
                self.colorsArray[3] = Color.green
                self.colorsArray[4] = Color.green
                self.colorsArray[5] = Color.green
                
            }
           
        }
            
        else{
            //Process for MaxSpin
            
            //First Row
            if self.index[0] == self.index[1] && self.index[1] == self.index[2] {
                
                matches += 1
                self.colorsArray[0] = Color.green
                self.colorsArray[1] = Color.green
                self.colorsArray[2] = Color.green
                
            }
            
            //Middle Row
            if self.index[3] == self.index[4] && self.index[4] == self.index[5] {
                
                matches += 1
                self.colorsArray[3] = Color.green
                self.colorsArray[4] = Color.green
                self.colorsArray[5] = Color.green
                
            }
            
            //Third Row
            if self.index[6] == self.index[7] && self.index[7] == self.index[8] {
                
                matches += 1
                self.colorsArray[6] = Color.green
                self.colorsArray[7] = Color.green
                self.colorsArray[8] = Color.green
                
            }
            
            //Top-Bottom Diagnol
            if self.index[0] == self.index[4] && self.index[4] == self.index[8] {
                
                matches += 1
                self.colorsArray[0] = Color.green
                self.colorsArray[4] = Color.green
                self.colorsArray[8] = Color.green
                
            }
            
            //Bottom-Right Diagnol
            if self.index[6] == self.index[4] && self.index[4] == self.index[2] {
                
                matches += 1
                self.colorsArray[6] = Color.green
                self.colorsArray[4] = Color.green
                self.colorsArray[2] = Color.green
                
            }
            
        }
        
        if matches > 0 {
            // Atleast 1 win
            self.credit += matches * betAmmout * 2
        }
        else if !isMax{
            self.credit -= betAmmout
        }
        else{
            self.credit -= betAmmout * 5
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

