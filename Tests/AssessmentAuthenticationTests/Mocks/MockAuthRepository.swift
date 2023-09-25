//
//  MockAuthRepository.swift
//  
//
//  Created by Amit Saini on 25/09/23.
//

import Foundation
import Combine
@testable import AssessmentAuthentication


class MockAuthRepository: AuthRepositoryProtocol {
    var result: Result<Bool, Error>?

    func signIn(credentials: AuthCredentials) async throws -> Bool {
        switch result {
        case .success(let success):
            return success
        case .failure(let error):
            throw error
        case .none:
            fatalError("Result not set in MockAuthRepository")
        }
    }
}

enum MockAuthRepositoryError: Error {
    case signInError
}
