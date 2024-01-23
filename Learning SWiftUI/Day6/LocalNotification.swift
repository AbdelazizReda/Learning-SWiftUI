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
            
            if error != nil {
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
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1.0, repeats: false)
        //calender
        var dateComponent = DateComponents()
        dateComponent.hour = 12
        dateComponent.minute = 3
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: true)
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
//        .onAppear{
//            UIApplication.shared.applicationIconBadgeNumber = 0
//        }
    }
}

#Preview {
    LocalNotification()
}

//notification Manager
