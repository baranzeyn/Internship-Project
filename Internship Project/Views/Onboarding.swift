//
//  Onboarding.swift
//  Internship Project
//
//  Created by Zeynep Baran on 23.08.2024.
//

import SwiftUI

struct Onboard: Identifiable {
    let id: UUID
    let title: String
    let description: String
}

struct Onboarding: View {
    @State private var index = 0
    @State private var showSignUp = false
    @EnvironmentObject var coordinator: NavigationCoordinator

    // Define onboardingItems within the view
    private let onboardingItems: [Onboard] = [
        Onboard(id: UUID(), title: "Security", description: "Your security is our top priority. We use state-of-the-art encryption and the latest security protocols."),
        Onboard(id: UUID(), title: "Card Options", description: "Explore a range of card options tailored to fit your lifestyle and financial needs."),
        Onboard(id: UUID(), title: "Earn Rewards", description: "Earn rewards with every purchase you make. Our card options allow you to accumulate points, cashback, or other benefits based on your spending.")
    ]
    
    var body: some View {
        VStack {
            TabView(selection: $index) {
                ForEach(onboardingItems.indices, id: \.self) { item in
                    Image("onboarding\(item+1)")
                        .resizable()
                        .padding()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 170, height: 170)
                        .tag(item)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            
            HStack(spacing: 4) {
                ForEach(onboardingItems.indices, id: \.self) { i in
                    Color(hex: "4158A6")
                        .opacity(i == index ? 1 : 0.5)
                        .frame(width: i == index ? 8 : 16, height: 8)
                        .animation(.easeInOut(duration: 0.4), value: i == index)
                }
            }
            
            ZStack {
                ForEach(onboardingItems.indices, id: \.self) { i in
                    VStack {
                        Text(onboardingItems[i].title)
                            .font(.largeTitle)
                            .foregroundColor(Color(hex: "4158A6"))
                        
                        Text(onboardingItems[i].description)
                            .foregroundColor(Color(hex: "4158A6"))
                            .multilineTextAlignment(.center)
                            .padding(9)
                    }
                    .opacity(i == index ? 1 : 0)
                    .offset(y: i == index ? 0 : 100)
                    .animation(.easeInOut, value: index)
                }
            }
            
            Button {
                coordinator.navigateToSignUp()
            } label: {
                Text("Get Started")
                    .font(.headline)
                    .frame(maxWidth: .infinity, maxHeight: 48)
                    .background(Color(hex: "4158A6"))
                    .foregroundColor(Color(hex: "F5EDED"))
                    .cornerRadius(12)
            }
            .padding()
            .fullScreenCover(isPresented: $coordinator.isShowingSignUp) {
                SignUpView()
                    .environmentObject(coordinator)
            }
        }
        .onChange(of: coordinator.isShowingSignUp) { newValue in
            // Handle the state change if necessary
            if !newValue {
                showSignUp = false
            }
        }
    }
}

#Preview {
    Onboarding()
        .environmentObject(NavigationCoordinator())
}
