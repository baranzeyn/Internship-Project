import SwiftUI
import Firebase

struct SignInView: View {
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        AuthView(
            title: "Welcome Back",
            actionButtonTitle: "Sign In",
            footerText: "Don't have an account? Sign Up",
            footerAction: {
                // Action for sign up navigation
            },
            username: $username,
            email: .constant(nil),  // Pass as Binding<String?>
            password: $password
        )
    }
    
    func register(){
        //Auth.auth().createUser(withEmail: username, password: password){ result,error in
            
       // }
    }
}

#Preview {
    SignInView()
}


