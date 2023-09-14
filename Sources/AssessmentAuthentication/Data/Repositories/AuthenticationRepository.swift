//
//  File.swift
//  
//
//  Created by Amit Saini on 13/09/23.
//

import Foundation
import FirebaseAuth

class AuthenticationRepository: AuthenticationRepositoryProtocol {
    func signIn(email: String, password: String) async throws {
        do {
            let authResult = try await Auth.auth().signIn(withEmail: email, password: password)
            // User successfully signed in
        } catch {
            // Handle sign-in error
            throw error
        }
    }
}
