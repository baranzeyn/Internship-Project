import SwiftUI
import Firebase
import FirebaseAuth

struct SignUpView: View {
    @EnvironmentObject var coordinator: NavigationCoordinator
    
    @State private var dateOfBirth = Date()
    @State private var email = ""
    @State private var password = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var isRegistrationSuccessful = false

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            VStack {
                AuthView(
                    title: "Welcome",
                    actionButtonTitle: "Sign Up",
                    footerText: "Do you have an account? Sign In",
                    footerAction: {
                        coordinator.navigateToSignIn()
                    },
                    actionButtonAction: signUp,
                    email: $email,
                    password: $password,
                    dateOfBirth: $dateOfBirth
                )
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Registration Status"), message: Text(alertMessage), dismissButton: .default(Text("OK")) {
                        if isRegistrationSuccessful {
                            coordinator.navigateToHome()
                        }
                    })
                }
            }
            .navigationDestination(isPresented: $coordinator.isShowingSignIn) {
                SignInView()
                    .environmentObject(coordinator)
            }
        }
        .onAppear {
            coordinator.isShowingSignUp = true
            coordinator.isShowingSignIn = false
        }
    }
    
    private func signUp() {
        guard !email.isEmpty, !password.isEmpty else {
            alertMessage = "All fields are required"
            showAlert = true
            return
        }

        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                alertMessage = "Error creating user: \(error.localizedDescription)"
                showAlert = true
                isRegistrationSuccessful = false
                return
            }

            alertMessage = "User registered successfully!"
            isRegistrationSuccessful = true
            showAlert = true
        }
    }
}
