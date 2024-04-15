//
//  Pick_a_PalApp.swift
//  Pick-a-Pal
//
//  Created by Robinson Thairu on 14/04/2024.
//

import SwiftUI
import SwiftData

@main
struct Pick_a_PalApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Pal.self)
        }
    }
}
