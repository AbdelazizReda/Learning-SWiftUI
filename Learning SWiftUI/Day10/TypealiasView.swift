//
//  TypealiasView.swift
//  Learning SWiftUI
//
//  Created by Abdelaziz Reda on 29/01/2024.
//

import SwiftUI

struct typealiasDataModel : Identifiable{
    let id:UUID = UUID()
    let name:String
    let description:String
}
typealias typeData = typealiasDataModel

struct TypealiasView: View {
    @State var DM:typeData = typeData(name: "test", description: "hello , this for testing  only !")
    
    var body: some View {
        VStack{
            Text(DM.name )
            Text(DM.description)
        }
    }
}

#Preview {
    TypealiasView()
}
