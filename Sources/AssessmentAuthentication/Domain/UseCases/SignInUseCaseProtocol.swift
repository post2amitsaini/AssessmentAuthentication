//
//  SignInUseCaseProtocol.swift
//  
//
//  Created by Amit Saini on 13/09/23.
//

import Foundation

protocol SignInUseCaseProtocol {
    func execute(credentials: AuthCredentials) async throws -> Bool
}
