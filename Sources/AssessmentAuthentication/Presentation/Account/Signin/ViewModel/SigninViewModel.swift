//
//  SigninViewModel.swift
//  Assessment
//
//  Created by Amit Saini on 24/08/23.
//

import SwiftUI
import Combine

class SigninViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var signInResult: Result<Bool, Error>?
    @Published var isSignInButtonEnabled: Bool = false

    private var cancellables: Set<AnyCancellable> = []
    private let signInUseCase: SignInUseCase
    //@EnvironmentObject private var coordinator: Coordinator

    init(signInUseCase: SignInUseCase = SignInUseCase(authRepository: AuthRepositoryImpl())) {
        self.signInUseCase = signInUseCase
        
        Publishers.CombineLatest($email, $password)
            .map { email, password in
                return email.count > 0 && password.count > 0
            }
            .assign(to: &$isSignInButtonEnabled)
    }

    func signIn() async {
        let credentials = AuthCredentials(email: email, password: password)
        do {
            let result = try await signInUseCase.execute(credentials: credentials)
            DispatchQueue.main.async {
                
                self.signInResult = .success(result)
            }
            //coordinator.push(.Home)
        } catch {
            DispatchQueue.main.async {
                self.signInResult = .failure(error)
            }
        }
    }
}



