//
//  MockSignUpRepository.swift
//  
//
//  Created by Amit Saini on 26/09/23.
//

import Foundation
import Combine
@testable import AssessmentAuthentication

class MockSignUpRepository: SignUpRepositoryProtocol {
    var shouldSucceed = true
    
    func signUp(credentials: AuthCredentials) async throws -> Bool {
        if shouldSucceed {
            return true
        } else {
            throw NSError(domain: "SignUpUseCaseTests", code: 12345, userInfo: nil)
        }
    }
}
