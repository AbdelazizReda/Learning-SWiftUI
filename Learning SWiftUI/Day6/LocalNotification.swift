//
//  LocalNotification.swift
//  Learning SWiftUI
//
//  Created by Abdelaziz Reda on 23/01/2024.
//

import SwiftUI
import UserNotifications

class NotificationManager {
    
   static let instance = NotificationManager() //singleton
    
    func requestNotification(){
        let options:UNAuthorizationOptions = [.alert , .badge , .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            
            if let error = error {
                print("Error")
            }else{
                print("success")
            }
        }
    }
    
    
    func schudueleNotification(){
        let content = UNMutableNotificationContent()
        content.title = ""
        content.subtitle = ""
        content.sound = .default
        content.badge = 1
        
        //time
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        //calender
        
        //location
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
        
        
    }
    
}

struct LocalNotification: View {
    var body: some View {
        
        VStack(spacing: 10){
            Button("Permision for local"){
                NotificationManager.instance.requestNotification()
            }
            
            Button("sechuale notification "){
                NotificationManager.instance.schudueleNotification()
            }

        }
    }
}

#Preview {
    LocalNotification()
}

//notification Manager
