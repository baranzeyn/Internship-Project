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
    
    init(){
        FirebaseApp.configure()}
    var body: some Scene {
        WindowGroup {
            SignInView()
        }
    }
}
