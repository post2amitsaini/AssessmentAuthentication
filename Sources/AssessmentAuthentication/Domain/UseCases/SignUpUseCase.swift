//
//  File.swift
//  
//
//  Created by Amit Saini on 19/09/23.
//

import Foundation

class SignUpUseCase: SignUpUseCaseProtocol {
    private let signUpRepository: SignUpRepositoryProtocol

    init(signUpRepository: SignUpRepositoryProtocol) {
        self.signUpRepository = signUpRepository
    }

    func execute(credentials: AuthCredentials) async throws -> Bool {
        return try await signUpRepository.signUp(credentials: credentials)
    }
}
