//
//  SigninViewModelTests.swift
//  
//
//  Created by Amit Saini on 19/09/23.
//

import XCTest
import Combine
@testable import AssessmentAuthentication

final class SigninViewModelTests: XCTestCase {
    /*
    var viewModel: SigninViewModel!
    var signInUseCase: SignInUseCaseMock!
    var cancellables: Set<AnyCancellable> = []

    override func setUp() {
        super.setUp()
        signInUseCase = SignInUseCaseMock()
        viewModel = SigninViewModel(signInUseCase: signInUseCase)
    }

    override func tearDown() {
        viewModel = nil
        signInUseCase = nil
        super.tearDown()
    }
    
    // MARK: - Test for isSignInButtonEnabled
    
    func testIsSignInButtonEnabled_WhenBothEmailAndPasswordAreNotEmpty_ShouldReturnTrue() {
        // Given
        viewModel.email = "test@example.com"
        viewModel.password = "password"
        
        // Then
        XCTAssertTrue(viewModel.isSignInButtonEnabled)
    }
    
    func testIsSignInButtonEnabled_WhenEmailIsEmpty_ShouldReturnFalse() {
        // Given
        viewModel.email = ""
        viewModel.password = "password"
        
        // Then
        XCTAssertFalse(viewModel.isSignInButtonEnabled)
    }
    
    func testIsSignInButtonEnabled_WhenPasswordIsEmpty_ShouldReturnFalse() {
        // Given
        viewModel.email = "test@example.com"
        viewModel.password = ""
        
        // Then
        XCTAssertFalse(viewModel.isSignInButtonEnabled)
    }
    
    // MARK: - Test for signIn()
    
    func testSignIn_WhenSignInUseCaseSucceeds_ShouldSetSignInResultToSuccess() async {
        // Given
        let credentials = AuthCredentials(email: "test@example.com", password: "password")
        signInUseCase.result = .success(true)
        
        // When
        viewModel.signIn()
        
        // Then
        XCTAssertTrue(viewModel.signInResult?.isSuccess ?? false)
    }
    
    func testSignIn_WhenSignInUseCaseFails_ShouldSetSignInResultToFailure() {
        // Given
        let credentials = AuthCredentials(email: "test@example.com", password: "password")
        signInUseCase.result = .failure(MockError.someError)
        
        // When
        viewModel.signIn()
        
        // Then
        XCTAssertTrue(viewModel.signInResult?.isFailure ?? false)
    }
     */
}
