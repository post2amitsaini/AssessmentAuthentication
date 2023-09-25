//
//  SignUpViewModelTests.swift
//  
//
//  Created by Amit Saini on 25/09/23.
//

import XCTest
@testable import AssessmentAuthentication

final class SignUpViewModelTests: XCTestCase {
    var viewModel: SignUpViewModel!
    var mockSignUpUseCase: MockSignUpUseCase!
    
    override func setUp() {
        super.setUp()
        mockSignUpUseCase = MockSignUpUseCase()
        viewModel = SignUpViewModel(signUpUseCase: mockSignUpUseCase)
    }
    
    override func tearDown() {
        viewModel = nil
        mockSignUpUseCase = nil
        super.tearDown()
    }
    
    func testEmailAndPasswordNotEmpty() {
        viewModel.email = "test@example.com"
        viewModel.password = "password"
        XCTAssertTrue(viewModel.isSignUpButtonEnabled)
    }
    
    func testEmailEmpty() {
        viewModel.email = ""
        viewModel.password = "password"
        XCTAssertFalse(viewModel.isSignUpButtonEnabled)
    }
    
    func testPasswordEmpty() {
        viewModel.email = "test@example.com"
        viewModel.password = ""
        XCTAssertFalse(viewModel.isSignUpButtonEnabled)
    }
    
    func testEmailAndPasswordEmpty() {
        viewModel.email = ""
        viewModel.password = ""
        XCTAssertFalse(viewModel.isSignUpButtonEnabled)
    }
    
    func testSignUpSuccess() async {
        viewModel.email = "test@example.com"
        viewModel.password = "password"
        mockSignUpUseCase.result = .success(true)
        
        await viewModel.signUp()
        // Add a 5-second wait before checking the result
        await Task.sleep(5 * 1_000_000_000)
        
        switch viewModel.signUpResult {
        case .success(let success):
            XCTAssertTrue(success)
        case .failure(_), .none:
            XCTFail("Expected success, but got failure or nil.")
        }
    }
    
    func testSignUpFailure() async {
        viewModel.email = "test@example.com"
        viewModel.password = "password"
        mockSignUpUseCase.result = .failure(MockSignUpUseCaseError.signUpError)
        
        await viewModel.signUp()
        // Add a 5-second wait before checking the result
        await Task.sleep(5 * 1_000_000_000)
        
        switch viewModel.signUpResult {
        case .success(_):
            XCTFail("Expected failure, but got success.")
        case .failure(let error):
            XCTAssertEqual(error as? MockSignUpUseCaseError, MockSignUpUseCaseError.signUpError)
        case .none:
            XCTFail("Expected failure, but got nil.")
        }
    }
    
}
