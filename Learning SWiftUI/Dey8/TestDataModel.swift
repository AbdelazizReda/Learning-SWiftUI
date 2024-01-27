//
//  testDataModel.swift
//  Learning SWiftUI
//
//  Created by Abdelaziz Reda on 27/01/2024.
//

import Foundation

struct testData: Identifiable {
    let id: UUID = UUID()
    let title:String
    let shortDescription:String
    let points:Int
}
