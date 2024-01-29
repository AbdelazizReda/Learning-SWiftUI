//
//  ThreadView.swift
//  Learning SWiftUI
//
//  Created by Abdelaziz Reda on 28/01/2024.
//

import SwiftUI

struct ThreadView: View {
    //viewmodel
    @StateObject var VM = threadViewmodel()
    var body: some View {
        Text("Get Data ")
            .onTapGesture {
                VM.addData()
            }
        
        ForEach (VM.data , id: \.self) { items in
            
            Text(items)
        }
    }
}

#Preview {
    ThreadView()
}
