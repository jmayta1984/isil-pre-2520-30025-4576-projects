//
//  ContentView.swift
//  EasyNotification
//
//  Created by Jorge Mayta on 3/12/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var notificationManager: NotificationManager
    
    var body: some View {
        VStack {
        
            Button {
                notificationManager.timeIntervalNotification()
            } label: {
                Label("Time interval  notification", systemImage: "bell")
            }
            
            Button {
                notificationManager.calendarNotification()
            } label: {
                Label("Calendar notification", systemImage: "calendar")
            }

        }
        .onAppear {
            notificationManager.requestNotificationPermission()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(NotificationManager())
}
