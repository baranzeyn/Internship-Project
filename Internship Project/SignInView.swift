import SwiftUI
import Firebase
import FirebaseAuth

struct SignInView: View {
    @EnvironmentObject var coordinator: NavigationCoordinator

    @State private var email = ""
    @State private var password = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var isSignInSuccessful = false

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            VStack {
                AuthView(
                    title: "Welcome Back",
                    actionButtonTitle: "Sign In",
                    footerText: "Don't have an account? Sign Up",
                    footerAction: {
                        coordinator.navigateToSignUp()
                    },
                    actionButtonAction: signIn,
                    email: $email,
                    password: $password,
                    dateOfBirth: nil
                )
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Sign In Status"), message: Text(alertMessage), dismissButton: .default(Text("OK")) {
                        if isSignInSuccessful {
                            coordinator.navigateToHome()
                        }
                    })
                }
            }
            .navigationDestination(isPresented: $coordinator.isShowingSignUp) {
                SignUpView()
                    .environmentObject(coordinator)
            }
        }
        .onAppear {
            coordinator.isShowingSignIn = true
            coordinator.isShowingSignUp = false
        }
    }
    
    private func signIn() {
        guard !email.isEmpty, !password.isEmpty else {
            alertMessage = "All fields are required"
            showAlert = true
            return
        }

        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                alertMessage = "Error signing in: \(error.localizedDescription)"
                showAlert = true
                isSignInSuccessful = false
                return
            }

            alertMessage = "User signed in successfully!"
            isSignInSuccessful = true
            showAlert = true
        }
    }
}
