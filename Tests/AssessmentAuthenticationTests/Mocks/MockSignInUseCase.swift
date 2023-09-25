//
//  SignInUseCaseMock.swift
//  
//
//  Created by Amit Saini on 19/09/23.
//

import Foundation
import Combine
@testable import AssessmentAuthentication

class MockSignInUseCase: SignInUseCaseProtocol {
    var result: Result<Bool, Error>?
    
    func execute(credentials: AuthCredentials) async throws -> Bool {
        if let result = result {
            switch result {
            case .success(let success):
                return success
            case .failure(let error):
                throw error
            }
        } else {
            // You can customize the behavior when the result is not set in your tests.
            fatalError("SignInUseCaseMock result is not set.")
        }
    }
}

enum MockSignInUseCaseError: Error {
    case signInError
}
