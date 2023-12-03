//
//  finalApp.swift
//  final
//
//  Created by Supichakorn Boonkasem on 1/12/2566 BE.
//

import SwiftUI
import FirebaseCore

@main
struct finalApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
     ContentView()
        }
    }
}
