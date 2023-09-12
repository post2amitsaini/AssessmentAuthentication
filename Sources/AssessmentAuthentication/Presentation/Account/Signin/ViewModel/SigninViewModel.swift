//
//  SigninViewModel.swift
//  Assessment
//
//  Created by Amit Saini on 24/08/23.
//

import Foundation
import Firebase
import FirebaseAuth

public class SigninViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var signInError: String? = nil
    
    func signIn() async throws {
        do {
            let authResult = try await Auth.auth().signIn(withEmail: email, password: password)
            // User successfully signed in
            // You can add additional logic here, such as navigating to another view
            print("User signed in successfully")
        
        } catch {
            // Handle sign-in error
            self.signInError = error.localizedDescription
            throw error
        }
    }
}

public class UserSettings: ObservableObject {
    @Published public var isLoggedIn = false
    public init() {
           // Initialize your properties here if needed
       }
}


