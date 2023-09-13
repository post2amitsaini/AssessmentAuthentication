//
//  File.swift
//  
//
//  Created by Amit Saini on 13/09/23.
//

import Foundation

class AuthenticationUseCase: AuthenticationUseCaseProtocol {
    let authenticationData: AuthenticationRepositoryProtocol

    init(authenticationData: AuthenticationRepositoryProtocol) {
        self.authenticationData = authenticationData
    }

    func signIn(email: String, password: String) async throws {
        try await authenticationData.signIn(email: email, password: password)
    }
}
