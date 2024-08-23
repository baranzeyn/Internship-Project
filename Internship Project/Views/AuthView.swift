import SwiftUI

struct AuthView: View {
    var title: String
    var actionButtonTitle: String
    var footerText: String
    var footerAction: () -> Void
    var actionButtonAction: () -> Void
    @Binding var email: String
    @Binding var password: String
    var dateOfBirth: Binding<Date>? // Make dateOfBirth optional

    var body: some View {
        ZStack {
            Color(hex: "F5EDED").ignoresSafeArea()
            
            RoundedRectangle(cornerRadius: 35, style: .continuous)
                .foregroundStyle(
                    LinearGradient(
                        colors: [Color(hex: "7FA1C3"), Color(hex: "4158A6")],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: 1000, height: 450)
                .rotationEffect(.degrees(135))
                
            VStack(spacing: 25) {
                Text(title)
                    .foregroundColor(Color(hex: "F5EDED"))
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .padding(.bottom, 30)
                
                VStack(spacing: 15) {
                    TextField("Email", text: $email)
                        .foregroundColor(Color(hex: "F5EDED"))
                        .textFieldStyle(.plain)
                        .placeholder(when: email.isEmpty) {
                            Text("Email")
                                .foregroundColor(Color(hex: "F5EDED"))
                                .bold()
                        }
                    
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(Color(hex: "F5EDED"))
                    
                    SecureField("Password", text: $password)
                        .foregroundColor(Color(hex: "F5EDED"))
                        .textFieldStyle(.plain)
                        .placeholder(when: password.isEmpty) {
                            Text("Password")
                                .foregroundColor(Color(hex: "F5EDED"))
                                .bold()
                        }
                    
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(Color(hex: "F5EDED"))
                    
                    if let dateOfBirth = dateOfBirth {
                        DatePicker("Date of Birth", selection: dateOfBirth, displayedComponents: .date)
                            .foregroundColor(Color(hex: "F5EDED"))
                            .padding()
                            .background(Color(hex: "7FA1C3"))
                            .cornerRadius(12)
                            .padding(.bottom, 10)
                    }
                    
                    Button {
                        actionButtonAction() // Call the action button action
                    } label: {
                        Text(actionButtonTitle)
                            .bold()
                            .frame(width: 150, height: 45)
                            .background(
                                RoundedRectangle(cornerRadius: 12, style: .continuous)
                                    .fill(Color(hex: "4158A6")))
                            .foregroundColor(Color(hex: "F5EDED"))
                            .padding(.top, 20)
                    }
                    
                    Button(action: footerAction) {
                        Text(footerText)
                            .bold()
                            .foregroundColor(Color(hex: "F5EDED"))
                    }
                    .padding(10)
                }
                .frame(width: 330)
            }
        }
    }
}
