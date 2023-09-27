//
//  File.swift
//  
//
//  Created by Amit Saini on 19/09/23.
//

import Foundation
import FirebaseAuth

class SignUpRepository: SignUpRepositoryProtocol {
    
    func signUp(credentials: AuthCredentials) async throws -> Bool {
        do {
            let authResult = try await Auth.auth().createUser(withEmail: credentials.email, password: credentials.password)
            // User successfully signed Up
            return true
        } catch {
            // Handle sign-in error
            throw error
        }
    }
}

