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

        ZStack{
            VStack{
                Text("\(offset.width)")
                Spacer()
            }
            
            Rectangle()
                .cornerRadius(10)
                .frame(width: 200, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .offset(offset)
                .scaleEffect(0.5)
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
        }}
}

#Preview {
    DragGestureMove()
}
