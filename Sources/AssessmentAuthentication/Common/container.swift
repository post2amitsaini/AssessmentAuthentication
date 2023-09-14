//
//  File.swift
//  
//
//  Created by Amit Saini on 14/09/23.
//

import Swinject

protocol AuthenticationDependencies {
    func registerDependencies(container: Container)
}


public class DefaultAuthenticationDependencies: AuthenticationDependencies {
    public init() { }
    
    public func registerDependencies(container: Container) {
        container.register(AuthenticationRepositoryProtocol.self) { _ in
            return AuthenticationRepository()
        }
        container.register(AuthenticationUseCaseProtocol.self) { r in
            return AuthenticationUseCase(authenticationData: r.resolve(AuthenticationRepositoryProtocol.self)!)
        }
        container.register(SigninViewModelProtocol.self) { r in
            return SigninViewModel(authenticationUseCase: r.resolve(AuthenticationUseCaseProtocol.self)!)
        }
    }
}


