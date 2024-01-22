//
//  ScrollView.swift
//  Learning SWiftUI
//
//  Created by Abdelaziz Reda on 22/01/2024.
//

import SwiftUI

struct ScrollViewTask: View {
    var body: some View {
        
        ScrollView{
            
            ForEach(0..<50) { index in
                Text("\(index) Hello SwiftUI")
                    .frame(width: 300, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(Color.blue)
                    .background(Color.gray.opacity(0.1))
                    .padding()
                    .shadow(radius: 10)
            }
        }
    }
}

#Preview {
    ScrollViewTask()
}
