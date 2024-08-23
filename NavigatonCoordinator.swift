//
//  NavigatonCoordinator.swift
//  Internship Project
//
//  Created by Zeynep Baran on 23.08.2024.
//

import SwiftUI

class NavigationCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    @Published var isShowingSignIn = false
    @Published var isShowingSignUp = false
    @Published var isShowingHome = false

    func navigateToSignIn() {
        isShowingSignIn = true
        isShowingSignUp = false
        isShowingHome = false
    }

    func navigateToSignUp() {
        isShowingSignUp = true
        isShowingSignIn = false
        isShowingHome = false
    }

    func navigateToHome() {
        isShowingHome = true
        isShowingSignIn = false
        isShowingSignUp = false
    }
}
