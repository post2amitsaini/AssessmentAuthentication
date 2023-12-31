//
//  SigninViewModelTests.swift
//  
//
//  Created by Amit Saini on 19/09/23.
//

import XCTest
import Combine
@testable import AssessmentAuthentication


class SigninViewModelTests: XCTestCase {
    var viewModel: SigninViewModel!
    var mockSignInUseCase: MockSignInUseCase!

    override func setUp() {
        super.setUp()
        mockSignInUseCase = MockSignInUseCase()
        viewModel = SigninViewModel(signInUseCase: mockSignInUseCase)
    }

    override func tearDown() {
        viewModel = nil
        mockSignInUseCase = nil
        super.tearDown()
    }

    func testEmailAndPasswordNotEmpty() {
        viewModel.email = "test@example.com"
        viewModel.password = "password"
        XCTAssertTrue(viewModel.isSignInButtonEnabled)
    }

    func testEmailEmpty() {
        viewModel.email = ""
        viewModel.password = "password"
        XCTAssertFalse(viewModel.isSignInButtonEnabled)
    }

    func testPasswordEmpty() {
        viewModel.email = "test@example.com"
        viewModel.password = ""
        XCTAssertFalse(viewModel.isSignInButtonEnabled)
    }

    func testEmailAndPasswordEmpty() {
        viewModel.email = ""
        viewModel.password = ""
        XCTAssertFalse(viewModel.isSignInButtonEnabled)
    }

    func testSignInSuccess() async throws {
        viewModel.email = "test@test.com"
        viewModel.password = "qwerty"
        mockSignInUseCase.result = .success(true)

        await viewModel.signIn()
        
        // Add a 5-second wait before checking the result
        await Task.sleep(5 * 1_000_000_000)

        switch viewModel.signInResult {
        case .success(let success):
            XCTAssertTrue(success)
        case .failure(_), .none:
            XCTFail("Expected success, but got failure or nil.")
        }
    }

    func testSignInFailure() async {
        viewModel.email = "test@example.com"
        viewModel.password = "password"
        mockSignInUseCase.result = .failure(MockSignInUseCaseError.signInError)

        await viewModel.signIn()
        await Task.sleep(5 * 1_000_000_000)
        switch viewModel.signInResult {
        case .success(_):
            XCTFail("Expected failure, but got success.")
        case .failure(let error):
            XCTAssertEqual(error as? MockSignInUseCaseError, MockSignInUseCaseError.signInError)
        case .none:
            XCTFail("Expected failure, but got nil.")
        }
    }
}
