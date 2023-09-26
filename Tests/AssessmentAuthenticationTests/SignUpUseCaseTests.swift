//
//  SignUpUseCaseTests.swift
//  
//
//  Created by Amit Saini on 26/09/23.
//

import XCTest
import Combine
@testable import AssessmentAuthentication

final class SignUpUseCaseTests: XCTestCase {
    var sut: SignUpUseCase!
    var signUpRepositoryMock: MockSignUpRepository!
    
    override func setUp() {
        super.setUp()
        signUpRepositoryMock = MockSignUpRepository()
        sut = SignUpUseCase(signUpRepository: signUpRepositoryMock)
    }
    
    override func tearDown() {
        sut = nil
        signUpRepositoryMock = nil
        super.tearDown()
    }
    
    func testExecute_success() async {
        signUpRepositoryMock.shouldSucceed = true
        let credentials = AuthCredentials(email: "test@example.com", password: "password123")
        
        do {
            let result = try await sut.execute(credentials: credentials)
            XCTAssertTrue(result)
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }
    
    func testExecute_failure() async {
        signUpRepositoryMock.shouldSucceed = false
        let credentials = AuthCredentials(email: "test@example.com", password: "password123")
        
        do {
            let result = try await sut.execute(credentials: credentials)
            XCTFail("Expected error")
        } catch let error as NSError {
            XCTAssertEqual(error.domain, "SignUpUseCaseTests")
            XCTAssertEqual(error.code, 12345)
        }
    }
    
}
