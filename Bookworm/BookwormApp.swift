//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Margarita Mayer on 17/01/24.
//

import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
