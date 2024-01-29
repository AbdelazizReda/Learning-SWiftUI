//
//  threadViewModel.swift
//  Learning SWiftUI
//
//  Created by Abdelaziz Reda on 28/01/2024.
//

import Foundation

class threadViewmodel:ObservableObject {
    
    @Published var data:[String] = []
    

    func addData(){
        
        DispatchQueue.global(qos: .background).async {
            let newData = self.featchData()
            
            DispatchQueue.main.async{
                self.data = newData
                
            }}
    }
    
    //featchData
    func featchData() ->[String]{
        //data in array
        var data: [String] = []
        for x in 0..<100{
            data.append("\(x)")
            print(data)
        }
        return data
        }
        
    }
    

