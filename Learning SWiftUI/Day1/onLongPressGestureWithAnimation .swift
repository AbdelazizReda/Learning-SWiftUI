//
//  onLongPressGestureWithAnimation .swift
//  Learning SWiftUI
//
//  Created by Abdelaziz Reda on 18/01/2024.
//

import SwiftUI

struct onLongPressGestureWithAnimation: View {
    @State var isCompleted: Bool = false
    @State var isSuccess:Bool = false
    
    var body: some View {
        VStack{
            Rectangle()
                .fill(isSuccess ? Color.green : Color.blue)
                .frame(maxWidth: isCompleted ? .infinity : 10)
                .frame(height: 60)
                .frame(maxWidth: .infinity , alignment: .leading)
                .background(Color.gray)
            
            
            HStack{
                Text("Apply")
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(Color.black)
                    .cornerRadius(10)
                    .onLongPressGesture(minimumDuration: 1.0, maximumDistance: 50) { ispressing in
                        //start od press -> min duration
                        if ispressing {
                            withAnimation(.easeInOut(duration: 1.0)) {
                                isCompleted.toggle()
                            }
                        }else{
                            
                            DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.1) {
                                if !isSuccess {
                                    withAnimation(.easeOut){
                                        isSuccess = false
                                    }
                                }
                            }
                        }
                        
                    } perform: {
                        withAnimation(.easeOut){
                            isSuccess = true
                        }
                    }
                
                Text("Reset")
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(Color.red)
                    .cornerRadius(10)
                    .onTapGesture {
                        isCompleted = false
                        isSuccess = false
                    }
            }
            
            
        }
        
    }
}

#Preview {
    onLongPressGestureWithAnimation()
}
