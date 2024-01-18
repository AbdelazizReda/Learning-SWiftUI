//
//  OnLongPressGister.swift
//  Learning SWiftUI
//
//  Created by Abdelaziz Reda on 18/01/2024.
//

import SwiftUI

struct OnLongPressGister: View {
    @State var isSelected:Bool = false
    
    var body: some View {
        VStack {
            Text(isSelected ? "selected" : "not selected")
                .padding(.all , 15)
                .padding(.horizontal)
                .background(isSelected ? .green : .blue)
                .cornerRadius(10)
//                .onTapGesture {
//                    isSelected.toggle()
//                }
                .onLongPressGesture{
                    isSelected.toggle()
                }
        }
        .padding()
    }
}

#Preview {
    OnLongPressGister()
}
