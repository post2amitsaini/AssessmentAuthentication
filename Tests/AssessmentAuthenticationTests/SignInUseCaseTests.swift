//
//  SignInUseCaseTests.swift
//  
//
//  Created by Amit Saini on 25/09/23.
//

import XCTest
import Combine
@testable import AssessmentAuthentication

final class SignInUseCaseTests: XCTestCase {
    var signInUseCase: SignInUseCase!
    var mockAuthRepository: MockAuthRepository!
    
    override func setUp() {
        super.setUp()
        mockAuthRepository = MockAuthRepository()
        signInUseCase = SignInUseCase(authRepository: mockAuthRepository)
    }
    
    override func tearDown() {
        signInUseCase = nil
        mockAuthRepository = nil
        super.tearDown()
    }
    
    func testExecuteSignInSuccess() async {
        let credentials = AuthCredentials(email: "test@example.com", password: "password")
        mockAuthRepository.result = .success(true)
        
        do {
            let result = try await signInUseCase.execute(credentials: credentials)
            XCTAssertTrue(result)
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }
    
    func testExecuteSignInFailure() async {
        let credentials = AuthCredentials(email: "test@example.com", password: "wrongpassword")
        mockAuthRepository.result = .failure(MockAuthRepositoryError.signInError)
        
        do {
            _ = try await signInUseCase.execute(credentials: credentials)
            XCTFail("Expected an error, but got success")
        } catch {
            XCTAssertEqual((error as? MockAuthRepositoryError), MockAuthRepositoryError.signInError)
        }
    }
    
}
