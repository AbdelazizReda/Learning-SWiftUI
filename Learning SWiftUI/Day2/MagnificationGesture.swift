//
//  MagnificationGesture.swift
//  Learning SWiftUI
//
//  Created by Abdelaziz Reda on 21/01/2024.
//

import SwiftUI

struct MagnificationGesture: View {
    var body: some View {
        
        @State var currentAmount:CGFloat = 0
        @State var lastAmount: CGFloat = 0
        
        VStack{
            HStack {
                Circle()
                    .frame(width: 40, height: 40, alignment: .leading)
                Text("Instgram User")
                Spacer()
                Image(systemName: "ellipsis")
            }
            .padding(.horizontal)
            
            
            Rectangle()
                .frame( height: 300, alignment: .leading)
                .scaleEffect(1 + currentAmount )
                .gesture(
                    //                    MagnificationGesture()
                    //                    MagnificationGesture()
                    MagnifyGesture()
                        .onChanged {val in
                            //                        currentAmount = val - 1
                        }
                        .onEnded{ value  in
                            withAnimation(.spring()){
                                currentAmount = 0
                            }
                        }
                )
            
            //like and fav
            VStack{
            HStack {
                
                Image(systemName: "heart")
                Image(systemName: "cart")
                Spacer()
            }
            .padding(5)
            .padding(.horizontal)
            Text("Thank you very much for your series of SwiftUI Continued Learning")

            
        }
        }

    }
}

#Preview {
    MagnificationGesture()
}
