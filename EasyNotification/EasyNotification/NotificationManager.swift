//
//  NotificationManager.swift
//  EasyNotification
//
//  Created by Jorge Mayta on 3/12/25.
//

import UserNotifications
import Combine

class NotificationManager: NSObject, ObservableObject, UNUserNotificationCenterDelegate {
    
    override init() {
        super.init()
        configure()
    }
    
    func configure() {
        let center = UNUserNotificationCenter.current()
        center.delegate = self
    }
    
    func requestNotificationPermission() {
        
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if let error = error {
                print("Error requesting notification permission: \(error)")
            } else {
                print("Permission granted: \(granted)")
            }
        }
    }
    
    func timeIntervalNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Time interval notification"
        content.body = "This is a time interval notification"
        content.sound = .defaultRingtone
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        let center = UNUserNotificationCenter.current()
        
        center.add(request) { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else {
                print("Time interval notification")
            }
        }
    }
    
    func calendarNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Calendar notification"
        content.body = "This is a calendar notification"
        content.sound = .defaultRingtone
        
        var dateComponents = DateComponents()
        dateComponents.hour = 20
        dateComponents.minute = 7
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        let center = UNUserNotificationCenter.current()
        
        center.add(request) { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else {
                print("Time interval notification")
            }
        }
        
    }
    
    
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .badge, .sound])
    }
    
}
