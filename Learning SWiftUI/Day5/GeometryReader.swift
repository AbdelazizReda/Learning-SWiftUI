//
//  GeometryReader.swift
//  Learning SWiftUI
//
//  Created by Abdelaziz Reda on 22/01/2024.
//

import SwiftUI

struct GeometryReader: View {
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<20 ) { index in
//                    GeometryReader { geometry in
                        RoundedRectangle(cornerRadius: 10)
                            .rotation3DEffect(
//                                Angle(degrees: getPercentage(geo: geometry) * 40)
                                Angle(degrees: 10),
                                axis: (x: 0.0, y: 1.5, z: 0.0)
                            )
                            .frame(width: 300, height: 300, alignment: .center)
                    }
//                }
            }
        }


    }
    
    
    //GetPercentage
    func getPercentage (geo: GeometryProxy) -> Double {
        let maxDistance = UIScreen.main.bounds.width / 2
        let currentX = geo.frame(in: .global).midX
        return Double(1 - (currentX / maxDistance))
    }
}

#Preview {
    GeometryReader()
}



