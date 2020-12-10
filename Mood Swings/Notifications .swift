//
//  Notifications .swift
//  Mood Swings
//
//  Created by amelia peng on 2020-12-10.
//

import Foundation
import UserNotifications

func askNotificationPermission() {
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
        if success {
            print("All set!")
        } else if let error = error {
            print(error.localizedDescription)
        }
    }
}

func publishNotifications(timeUntil: Double, title:  String, message: String) {
    let content = UNMutableNotificationContent()
    content.title = "\(title)"
    content.subtitle = "\(message)"
    content.sound = UNNotificationSound.default
    
    // show this notification x number of seconds from now
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeUntil, repeats: false)
    
    // choose a random identifier
    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
    
    // add our notification request
    UNUserNotificationCenter.current().add(request)
}
