//
//  RotationGesture.swift
//  Learning SWiftUI
//
//  Created by Abdelaziz Reda on 21/01/2024.
//

import SwiftUI

struct RotationGesture: View {
    
    @State var angle:Angle = Angle(degrees: 0)
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .font(.largeTitle)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .foregroundStyle(.white)
            .padding(30)
            .background(Color.blue)
            .cornerRadius(10)
            .rotationEffect(angle)
            .gesture(
            RotationGesture()
                .onChanged {val in
                    angle = val
                    }
                .onEnded{ value  in
                    withAnimation(.spring()){
                        angle = Angle(degrees: 0)
                    }
                }
            
            
            )
    }
}

#Preview {
    RotationGesture()
}
