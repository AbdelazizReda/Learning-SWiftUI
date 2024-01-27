//
//  TestView.swift
//  Learning SWiftUI
//
//  Created by Abdelaziz Reda on 27/01/2024.
//

import SwiftUI

struct TestView: View {
    
    @StateObject var VM = testViewModel()
    
    var body: some View {
        
        ScrollView{
            
            ForEach(VM.dataFilterd){ index in
                VStack{
                    Text(index.title)
                    Text(index.shortDescription)
                }
                .padding(20)
                .background(Color.gray .opacity(0.5))
                .shadow(radius: 2)
            }
            Spacer()
        }
    }
    }


#Preview {
    TestView()
}
