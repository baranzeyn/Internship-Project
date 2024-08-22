//
//  Internship_ProjectApp.swift
//  Internship Project
//
//  Created by Zeynep Baran on 22.08.2024.
//

import SwiftUI
import Firebase

@main
struct Internship_ProjectApp: App {
    @StateObject private var coordinator = NavigationCoordinator()

    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            SignUpView() // Start with SignInView
                .environmentObject(coordinator) // Provide the coordinator to the environment
        }
    }
}
