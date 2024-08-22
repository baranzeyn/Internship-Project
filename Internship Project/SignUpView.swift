import SwiftUI
import Firebase

struct SignUpView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var email: String? = ""  // Optional email
    
    var body: some View {
        AuthView(
            title: "Welcome",
            actionButtonTitle: "Sign Up",
            footerText: "Do you have an account? Sign In",
            footerAction: {
                // Action for sign in navigation
            },
            username: $username,
            email: $email,  // Pass as Binding<String?>
            password: $password
        )
    }
}

#Preview {
    SignUpView()
}

