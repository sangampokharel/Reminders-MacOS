//
//  RemindersApp.swift
//  Reminders
//
//  Created by sangam pokharel on 03/09/2025.
//

import SwiftUI

@main
struct RemindersApp: App {
    var body: some Scene {
        WindowGroup {
            let viewContext = CoreDataManager.shared.persistentContainer.viewContext
            ContentView().environment(\.managedObjectContext, viewContext)
        }
    }
}
