//
//  SignUpViewModel.swift
//  
//
//  Created by Amit Saini on 19/09/23.
//

import Foundation
import Combine

class SignUpViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var signUpResult: Result<Bool, Error>?
    @Published var isSignUpButtonEnabled: Bool = false

    private var cancellables: Set<AnyCancellable> = []
    private let signUpUseCase: SignUpUseCaseProtocol

    init(signUpUseCase: SignUpUseCaseProtocol = SignUpUseCase(signUpRepository: SignUpRepository())) {
        self.signUpUseCase = signUpUseCase
        
        Publishers.CombineLatest($email, $password)
            .map { email, password in
                return email.count > 0 && password.count > 0
            }
            .assign(to: &$isSignUpButtonEnabled)
    }

    func signUp() async {
        let credentials = AuthCredentials(email: email, password: password)
        do {
            let result = try await signUpUseCase.execute(credentials: credentials)
            signUpResult = .success(result)
        } catch {
            signUpResult = .failure(error)
        }
    }
}
