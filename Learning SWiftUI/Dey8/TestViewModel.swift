//
//  TestViewModel.swift
//  Learning SWiftUI
//
//  Created by Abdelaziz Reda on 27/01/2024.
//

import Foundation


class testViewModel: ObservableObject {
    
    //puplisher
    @Published var data:[testData] = []
    @Published var dataFilterd:[testData] = []

    
    init(){
        getData()
        dataFilter()
    }
    
    //append data
    func getData(){
        let user1 = testData(title: "test1", shortDescription: "This is a simple example, and you'll need to adapt it to your specific" ,points: 1)
        let user2 = testData(title: "test2", shortDescription: "This is a simple example, and you'll need to adapt it to your specific", points: 2)
        let user3 = testData(title: "test3", shortDescription: "This is a simple example, and you'll need to adapt it to your specific",points: 3)
        let user4 = testData(title: "test4", shortDescription: "This is a simple example, and you'll need to adapt it to your specific", points: 4)
        let user5 = testData(title: "test5", shortDescription: "This is a simple example, and you'll need to adapt it to your specific", points: 5)
        let user6 = testData(title: "test6", shortDescription: "This is a simple example, and you'll need to adapt it to your specific", points: 6)
        self.data.append(contentsOf: [ user1 , user2,user3 , user4, user5, user6])
    }
    
    func dataFilter(){
        
        //sort
        dataFilterd = data.sorted(by: {$0.points > $1.points})
    }
    
    
    
}
