//
//  DragGestureMenu.swift
//  Learning SWiftUI
//
//  Created by Abdelaziz Reda on 21/01/2024.
//

import SwiftUI

struct DragGestureMenu: View {
    //starting offsets
    @State var startingOffsetY:CGFloat = UIScreen.main.bounds.height * 0.85
    @State var currentDragOffsetY:CGFloat = 0
    @State var endingOffsetY:CGFloat = 0
    
    var body: some View {
        ZStack{
            Color.gray.ignoresSafeArea()
            
            ExtractedView()
                .offset(y:startingOffsetY)
                .offset(y:currentDragOffsetY)
                .offset(y:endingOffsetY)
                .gesture(
                    DragGesture()
                        .onChanged({ val in
                            withAnimation(.spring()){
                                currentDragOffsetY = val.translation.height
                            }
                        })
                    
                        .onEnded({ val in
                            withAnimation(.spring()){
                                if currentDragOffsetY < -150{
                                    endingOffsetY = -startingOffsetY

                                }else if endingOffsetY != 0 && currentDragOffsetY > 150{
                                    endingOffsetY = 0

                                }else{
                                    currentDragOffsetY = 0
                                }
                                
                            }
                        })
                )
        }
        .ignoresSafeArea(edges: /*@START_MENU_TOKEN@*/.bottom/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    DragGestureMenu()
}

struct ExtractedView: View {
    var body: some View {
        VStack(spacing: 10){
            Image(systemName: "control")
                .padding(.top)
            Text("Sign up")
                .font(.headline)
                .fontWeight(.semibold)
            
            Image(systemName: "flame.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            
            Text(" can't stress enough how important and helpful your content is! Thanks a lot for making these! I was kinda lost and couldn't structure my learning on SwiftUI, but your videos are just unbelievably  well-structured")
                .multilineTextAlignment(.center)
            
            
            Text("Applay Now")
                .padding(.horizontal)
                .padding()
                .foregroundStyle(Color.white)
                .background(Color.black)
                .cornerRadius(10)
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30)
    }
}
