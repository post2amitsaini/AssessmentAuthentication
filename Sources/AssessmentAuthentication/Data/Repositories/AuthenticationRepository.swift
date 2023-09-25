//
//  File.swift
//  
//
//  Created by Amit Saini on 13/09/23.
//

import Foundation
import FirebaseAuth

class AuthRepository: AuthRepositoryProtocol {
    
    func signIn(credentials: AuthCredentials) async throws -> Bool {
        do {
            let authResult = try await Auth.auth().signIn(withEmail: credentials.email, password: credentials.password)
            // User successfully signed in
            return true
        } catch {
            // Handle sign-in error
            throw error
        }
    }
}
