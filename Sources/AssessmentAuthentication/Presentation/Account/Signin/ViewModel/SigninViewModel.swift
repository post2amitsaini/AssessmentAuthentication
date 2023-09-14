//
//  SigninViewModel.swift
//  Assessment
//
//  Created by Amit Saini on 24/08/23.
//

import SwiftUI

// SigninViewModelProtocol.swift
public protocol SigninViewModelProtocol: ObservableObject {
    var email: String { get set }
    var password: String { get set }
    var signInError: String? { get set }

    func signIn() async
}

class SigninViewModel: ObservableObject, SigninViewModelProtocol {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var signInError: String? = nil

    private let authenticationUseCase: AuthenticationUseCaseProtocol

    init(authenticationUseCase: AuthenticationUseCaseProtocol) {
        self.authenticationUseCase = authenticationUseCase
    }

    func signIn() async {
        do {
            try await authenticationUseCase.signIn(email: email, password: password)
            // Sign-in was successful
        } catch {
            // Handle the sign-in error here
            signInError = error.localizedDescription
        }
    }
}



