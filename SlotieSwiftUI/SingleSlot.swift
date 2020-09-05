//
//  SingleSlot.swift
//  SlotieSwiftUI
//
//  Created by Vishweshwaran on 05/09/20.
//  Copyright © 2020 Dynamic Dudes. All rights reserved.
//

import SwiftUI

struct SingleSlot: View {
    
    @Binding var imageView : String
    @Binding var backgroundColor : Color
    
    var body: some View {
    
       Image(imageView)
       .resizable()
       .aspectRatio(1, contentMode: .fit)
       .padding(.all, 10)
       .background(backgroundColor.opacity(0.5))
       .cornerRadius(20)
        
    }
}

struct SingleSlot_Previews: PreviewProvider {
    static var previews: some View {
        SingleSlot(imageView: Binding.constant("apple"), backgroundColor: Binding.constant(Color.green))
    }
}
