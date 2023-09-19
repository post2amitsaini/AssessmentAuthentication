//
//  SignInUseCase.swift
//  
//
//  Created by Amit Saini on 13/09/23.
//

import Foundation

class SignInUseCase: SignInUseCaseProtocol {
    private let authRepository: AuthRepositoryProtocol

    init(authRepository: AuthRepositoryProtocol) {
        self.authRepository = authRepository
    }

    func execute(credentials: AuthCredentials) async throws -> Bool {
        return try await authRepository.signIn(credentials: credentials)
    }
}
