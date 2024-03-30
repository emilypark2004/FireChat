//
//  LoginView.swift
//  FireChat
//
//  Created by Emily Park on 3/29/24.
//

import SwiftUI

struct LoginView: View {

    @Environment(AuthManager.self) var authManager
    
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack {
            Text("Welcome!")
                .font(.largeTitle)

            // Email + password fields
            VStack {
                TextField("Email", text: $email)
                SecureField("Password", text: $password)
            }
            .textFieldStyle(.roundedBorder) // <-- Style text fields (applies to both text fields within the VStack)
            .textInputAutocapitalization(.never) // <-- No auto capitalization (can be annoying for emails and passwords)
            .padding(40)

            // Sign up + Login buttons
            HStack {
                Button("Sign Up") {
                    print("Sign up user: \(email), \(password)")
                    authManager.signUp(email: email, password: password)

                }
                .buttonStyle(.borderedProminent) // <-- Style button

                Button("Login") {
                    print("Login user: \(email), \(password)")
                    authManager.signIn(email: email, password: password)
                }
                .buttonStyle(.bordered) // <-- Style button
            }
        }
    }
}
#Preview {
    LoginView()
        .environment(AuthManager())
}
