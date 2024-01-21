//
//  DragGestureMoveDrag.swift
//  Learning SWiftUI
//
//  Created by Abdelaziz Reda on 21/01/2024.
//

import SwiftUI

struct DragGestureMove: View {
    @State var offset:CGSize = .zero
    var body: some View {
        
        Rectangle()
            .cornerRadius(10)
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .offset(offset)
            .gesture(
                DragGesture()
                    .onChanged({ val in
                        withAnimation(.spring()){
                            offset = val.translation
                        }
                    })
                    .onEnded({ val in
                        withAnimation(.spring()){
                            offset = .zero
                        }
                    })
            )
    }
}

#Preview {
    DragGestureMove()
}
