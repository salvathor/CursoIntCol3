//
//  CoreDataSwiftUIApp.swift
//  CoreDataSwiftUI
//
//  Created by Salvador Lopez on 04/08/23.
//

import SwiftUI

@main
struct CoreDataSwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
